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
 *	イベント制御機能
 */

#include "osek_kernel.h"
#include "check.h"
#include "task.h"
#include "resource.h"
#include "stdio.h"

/*
 *  イベントのセット
 */
StatusType
SetEvent(TaskType tskid, EventMaskType mask)
{
	StatusType	ercd = E_OK;

	LOG_SETEVT_ENTER(tskid, mask);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_TSKID(tskid);
	CHECK_ACCESS(tskid < tnum_exttask);

	lock_cpu();
	D_CHECK_STATE(tcb_tstat[tskid] != TS_DORMANT);

	tcb_curevt[tskid] |= mask;
	if ((tcb_curevt[tskid] & tcb_waievt[tskid]) != EVTMASK_NONE) {
		tcb_waievt[tskid] = EVTMASK_NONE;
		if ((make_runnable(tskid)) && (callevel == TCL_TASK)) {
			dispatch();
		}
	}
  exit:
	unlock_cpu();
	LOG_SETEVT_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.tskid = tskid;
	_errorhook_par2.mask = mask;
	call_errorhook(ercd, OSServiceId_SetEvent);
	goto exit;
}

/*
 *  イベントのクリア
 */
StatusType
ClearEvent(EventMaskType mask)
{
	StatusType	ercd = E_OK;

	LOG_CLREVT_ENTER(mask);
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_ACCESS(runtsk < tnum_exttask);

	lock_cpu();
	tcb_curevt[runtsk] &= ~mask;
  exit:
	unlock_cpu();
	LOG_CLREVT_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
	_errorhook_par1.mask = mask;
	call_errorhook(ercd, OSServiceId_ClearEvent);
	goto exit;
}

/*
 *  イベントの状態参照
 */
StatusType
GetEvent(TaskType tskid, EventMaskRefType p_mask)
{
	StatusType	ercd = E_OK;

	LOG_GETEVT_ENTER(tskid, p_mask);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2 | TCL_ERROR | TCL_PREPOST);
	CHECK_TSKID(tskid);
	CHECK_ACCESS(tskid < tnum_exttask);

	lock_cpu();
	D_CHECK_STATE(tcb_tstat[tskid] != TS_DORMANT);
	*p_mask = tcb_curevt[tskid];
  exit:
	unlock_cpu();
	LOG_GETEVT_LEAVE(ercd, *p_mask);
	return(ercd);

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.tskid = tskid;
	_errorhook_par2.p_mask = p_mask;
	call_errorhook(ercd, OSServiceId_GetEvent);
	goto exit;
}

/*
 *  イベント待ち
 */
StatusType
WaitEvent(EventMaskType mask)
{
	StatusType	ercd = E_OK;
        
	LOG_WAIEVT_ENTER(mask);
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_ACCESS(runtsk < tnum_exttask);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);
        
	lock_cpu();
	if ((tcb_curevt[runtsk] & mask) == EVTMASK_NONE) {
		tcb_curpri[runtsk] = tinib_inipri[runtsk];
		tcb_tstat[runtsk] = TS_WAITING;
		tcb_waievt[runtsk] = mask;
		search_schedtsk();
		dispatch();
		tcb_curpri[runtsk] = tinib_exepri[runtsk];
	}
  exit:
	unlock_cpu();
	LOG_WAIEVT_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
	_errorhook_par1.mask = mask;
	call_errorhook(ercd, OSServiceId_WaitEvent);
	goto exit;
}
