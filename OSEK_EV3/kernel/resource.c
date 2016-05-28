/*
 *  TOPPERS/OSEK Kernel
 *      Toyohashi Open Platform for Embedded Real-Time Systems/
 *      OSEK Kernel
 * 
 *  Copyright (C) 2000-2003 by Embedded and Real-Time Systems Laboratory
 *                              Toyohashi Univ. of Technology, JAPAN
 *  Copyright (C) 2004 by Embedded and Real-Time Systems Laboratory
 *              Graduate School of Information Science, Nagoya Univ., JAPAN
 *  Copyright (C) 2004 by Witz Corporation, JAPAN
 * 
 *  上記著作権者は，以下の (1)～(4) の条件か，Free Software Foundation 
 *  によって公表されている GNU General Public License の Version 2 に記
 *  述されている条件を満たす場合に限り，本ソフトウェア（本ソフトウェア
 *  を改変したものを含む．以下同じ）を使用・複製・改変・再配布（以下，
 *  利用と呼ぶ）することを無償で許諾する．
 *  (1) 本ソフトウェアをソースコードの形で利用する場合には，上記の著作
 *      権表示，この利用条件および下記の無保証規定が，そのままの形でソー
 *      スコード中に含まれていること．
 *  (2) 本ソフトウェアを，ライブラリ形式など，他のソフトウェア開発に使
 *      用できる形で再配布する場合には，再配布に伴うドキュメント（利用
 *      者マニュアルなど）に，上記の著作権表示，この利用条件および下記
 *      の無保証規定を掲載すること．
 *  (3) 本ソフトウェアを，機器に組み込むなど，他のソフトウェア開発に使
 *      用できない形で再配布する場合には，次のいずれかの条件を満たすこ
 *      と．
 *    (a) 再配布に伴うドキュメント（利用者マニュアルなど）に，上記の著
 *        作権表示，この利用条件および下記の無保証規定を掲載すること．
 *    (b) 再配布の形態を，別に定める方法によって，TOPPERSプロジェクトに
 *        報告すること．
 *  (4) 本ソフトウェアの利用により直接的または間接的に生じるいかなる損
 *      害からも，上記著作権者およびTOPPERSプロジェクトを免責すること．
 * 
 *  本ソフトウェアは，無保証で提供されているものである．上記著作権者お
 *  よびTOPPERSプロジェクトは，本ソフトウェアに関して，その適用可能性も
 *  含めて，いかなる保証も行わない．また，本ソフトウェアの利用により直
 *  接的または間接的に生じたいかなる損害に関しても，その責任を負わない．
 * 
 */

/*
 *	リソース管理機能
 */

#include "osek_kernel.h"
#include "check.h"
#include "task.h"
#include "interrupt.h"
#include "resource.h"

/*
 *  リソース管理機能の初期化
 */
void
resource_initialize(void)
{
	ResourceType	resid;

	for (resid = 0; resid < tnum_resource; resid++) {
		rescb_prevpri[resid] = TPRI_NULL;
	}
}

/*
 *  リソースの獲得
 */
StatusType
GetResource(ResourceType resid)
{
	StatusType	ercd = E_OK;
	Priority	ceilpri, curpri;

	LOG_GETRES_ENTER(resid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_RESID(resid);

	ceilpri = resinib_ceilpri[resid];
	if (callevel == TCL_TASK) {
		CHECK_ACCESS(tinib_inipri[runtsk] <= ceilpri);

		lock_cpu();
		D_CHECK_ACCESS(rescb_prevpri[resid] == TPRI_NULL);
		curpri = tcb_curpri[runtsk];
		rescb_prevpri[resid] = curpri;
		rescb_prevres[resid] = tcb_lastres[runtsk];
		tcb_lastres[runtsk] = resid;
		if (ceilpri > curpri) {
			tcb_curpri[runtsk] = ceilpri;
			if (ceilpri >= TPRI_MINISR) {
				set_ipl(ceilpri - TPRI_MINISR);
			}
		}
	}
	else {
		CHECK_ACCESS(isrinib_intpri[runisr] <= ceilpri);

		lock_cpu();
		D_CHECK_ACCESS(rescb_prevpri[resid] == TPRI_NULL);
		curpri = current_ipl() + TPRI_MINISR;
		rescb_prevpri[resid] = curpri;
		rescb_prevres[resid] = isrcb_lastres[runisr];
		isrcb_lastres[runisr] = resid;
		if (ceilpri > curpri) {
			set_ipl(ceilpri - TPRI_MINISR);
		}
	}
  exit:
	unlock_cpu();
	LOG_GETRES_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.resid = resid;
	call_errorhook(ercd, OSServiceId_GetResource);
	goto exit;
}

/*
 *  リソースの返却
 */
StatusType
ReleaseResource(ResourceType resid)
{
	StatusType	ercd = E_OK;

	LOG_RELRES_ENTER(resid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_RESID(resid);

	if (callevel == TCL_TASK) {
		CHECK_ACCESS(tinib_inipri[runtsk] <= resinib_ceilpri[resid]);
		CHECK_NOFUNC(tcb_lastres[runtsk] == resid);

		lock_cpu();
		if (rescb_prevpri[resid] >= TPRI_MINISR) {
			set_ipl(rescb_prevpri[resid] - TPRI_MINISR);
		}
		else{
			if (tcb_curpri[runtsk] >= TPRI_MINISR) {
				set_ipl(IPL_ENA_ALL);
			}
		}
		tcb_curpri[runtsk] = rescb_prevpri[resid];
		tcb_lastres[runtsk] = rescb_prevres[resid];
		rescb_prevpri[resid] = TPRI_NULL;
		if (tcb_curpri[runtsk] < nextpri) {
			preempt();
			dispatch();
		}
	}
	else {
		CHECK_ACCESS(isrinib_intpri[runisr] <= resinib_ceilpri[resid]);
		CHECK_NOFUNC(isrcb_lastres[runisr] == resid);

		lock_cpu();
		set_ipl(rescb_prevpri[resid] - TPRI_MINISR);
		isrcb_lastres[runisr] = rescb_prevres[resid];
		rescb_prevpri[resid] = TPRI_NULL;
	}
  exit:
	unlock_cpu();
	LOG_RELRES_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
	_errorhook_par1.resid = resid;
	call_errorhook(ercd, OSServiceId_ReleaseResource);
	goto exit;
}
