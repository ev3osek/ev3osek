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
 *	タスク管理機能
 */

#include "osek_kernel.h"
#include "check.h"
#include "task.h"
#include "resource.h"
#include "stdio.h"

/*
 *  タスクの起動
 */
StatusType
ActivateTask(TaskType tskid)
{
	StatusType	ercd = E_OK;

	LOG_ACTTSK_ENTER(tskid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_TSKID(tskid);
        
	lock_cpu();
	if (tcb_tstat[tskid] == TS_DORMANT) {
		if ((make_active(tskid)) && (callevel == TCL_TASK)) {
			dispatch();
		}
	}
	else if (tcb_actcnt[tskid] < tinib_maxact[tskid]) {
		tcb_actcnt[tskid] += 1;
	}
	else {
		ercd = E_OS_LIMIT;
		goto d_error_exit;
	}
  exit:
	unlock_cpu();
	LOG_ACTTSK_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.tskid = tskid;
	call_errorhook(ercd, OSServiceId_ActivateTask);
	goto exit;
}

/*
 *  自タスクの終了
 */
StatusType
TerminateTask(void)
{
	StatusType	ercd = E_OK;

	LOG_TERTSK_ENTER();
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);

	lock_cpu();
	/*
	 *  内部リソースの解放は優先度を下げるだけなので，ここでは
	 *  何もしなくてよい．
	 */
	tcb_tstat[runtsk] = TS_DORMANT;
	search_schedtsk();
	if (tcb_actcnt[runtsk] > 0) {
		tcb_actcnt[runtsk] -= 1;
		(void)make_active(runtsk);
	}
	exit_and_dispatch();
	/* ここには戻ってこない */

  error_exit:
	lock_cpu();
	call_errorhook(ercd, OSServiceId_TerminateTask);
	unlock_cpu();
	LOG_TERTSK_LEAVE(ercd);
	return(ercd);
}

/*
 *  自タスクの終了とタスクの起動
 */
StatusType
ChainTask(TaskType tskid)
{
	/*
	 *  ここでの ercd の初期化は本来は不要であるが，コンパイラの警
	 *  告メッセージを避けるために初期化している．
	 */
	StatusType	ercd = E_OK;

	LOG_CHNTSK_ENTER(tskid);
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);
	CHECK_TSKID(tskid);

	lock_cpu();
	if (tskid == runtsk) {
		search_schedtsk();
		(void)make_active(runtsk);
	}
	else {
		/*
		 *  エラー時に副作用が残らないように，エラーチェックは
		 *  タスク終了処理の前に行う必要がある．
		 */
		if ((tcb_tstat[tskid] != TS_DORMANT)
			&& (tcb_actcnt[tskid] >= tinib_maxact[tskid])) {
			ercd = E_OS_LIMIT;
			goto d_error_exit;
		}
		tcb_tstat[runtsk] = TS_DORMANT;
		search_schedtsk();
		if (tcb_actcnt[runtsk] > 0) {
			tcb_actcnt[runtsk] -= 1;
			(void)make_active(runtsk);
		}
		if (tcb_tstat[tskid] == TS_DORMANT) {
			(void)make_active(tskid);
		}
		else {
			tcb_actcnt[tskid] += 1;
		}
	}
	exit_and_dispatch();
	/* ここには戻ってこない */

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.tskid = tskid;
	call_errorhook(ercd, OSServiceId_ChainTask);
	unlock_cpu();
	LOG_CHNTSK_LEAVE(ercd);
	return(ercd);
}

/*
 *  スケジューラの呼び出し
 */
StatusType
Schedule(void)
{
	/*
	 *  ここでの ercd の初期化は本来は不要であるが，コンパイラの警
	 *  告メッセージを避けるために初期化している．
	 */
	StatusType	ercd = E_OK;

	LOG_SCHED_ENTER();
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);

	lock_cpu();
	if (tinib_inipri[runtsk] < nextpri) {
		tcb_curpri[runtsk] = tinib_inipri[runtsk];
		preempt();
		dispatch();
		tcb_curpri[runtsk] = tinib_exepri[runtsk];
	}
  exit:
	unlock_cpu();
	LOG_SCHED_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
	call_errorhook(ercd, OSServiceId_Schedule);
	goto exit;
}

/*
 *  実行状態のタスクIDの参照
 */
StatusType
GetTaskID(TaskRefType p_tskid)
{
	StatusType	ercd = E_OK;

	LOG_GETTID_ENTER(p_tskid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2 | TCL_ERROR | TCL_PREPOST);

	lock_cpu();
	*p_tskid = runtsk;
	/*
	 *  本来は runtsk ではなく以下の式になるべきだが，TSKID_NULL 
	 *  と INVALID_TASK は等しいので，単に runtsk でよい．
	 *      (runtsk == TSKID_NULL) ? INVALID_TASK : runtsk
	 */
  exit:
	unlock_cpu();
	LOG_GETTID_LEAVE(ercd, *p_tskid);
	return(ercd);

  error_exit:
	lock_cpu();
	call_errorhook(ercd, OSServiceId_GetTaskID);
	goto exit;

}

/*
 *  タスク状態の参照
 */
StatusType
GetTaskState(TaskType tskid, TaskStateRefType p_state)
{
	StatusType	ercd = E_OK;

	LOG_GETTST_ENTER(tskid, p_state);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2 | TCL_ERROR | TCL_PREPOST);
	CHECK_TSKID(tskid);

	lock_cpu();
	*p_state = (tskid == runtsk) ? RUNNING : tcb_tstat[tskid];
  exit:
	unlock_cpu();
	LOG_GETTST_LEAVE(ercd, *p_state);
	return(ercd);

  error_exit:
	lock_cpu();
	_errorhook_par1.tskid = tskid;
	_errorhook_par2.p_state = p_state;
	call_errorhook(ercd, OSServiceId_GetTaskState);
	goto exit;
}
