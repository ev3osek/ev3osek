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
 *	実行制御機能
 */

#include "osek_kernel.h"
#include "check.h"
#include "interrupt.h"
#include "stdio.h"
#include "init.h"

// Provided by ECRobot (osek_hook.c) and copied here to remove external reference
void StartupHook(void) {
    leJOS_init();
}

void PreTaskHook(void){}
void PostTaskHook(void){}
void ErrorHook(StatusType ercd){}
void ShutdownHook(StatusType ercd){}


/*
 *  OS実行制御のための変数
 */
UINT8		callevel;		/* 実行中のコンテキスト */
AppModeType	appmode;		/* アプリケーションモード */

/*
 *  エラーフックに渡す情報を格納する変数
 */
OSServiceIdType	_errorhook_svcid;
_ErrorHook_Par	_errorhook_par1, _errorhook_par2, _errorhook_par3;

/*
 *  エラーフックの呼び出し
 */
void
call_errorhook(StatusType ercd, OSServiceIdType svcid)
{
	UINT8	saved_callevel;
	IPL	saved_ipl;
	volatile FP	errorhook_adr;
	
	/*
	 *  C言語の規格では関数のアドレスは0にならないという前提から,
	 *  コンパイラの最適化によりErrorHookのアドレス判定分岐が
	 *  削除されてしまう場合があるため, volatile指定したローカル変数に
	 *  アドレスを代入してから判定している．
	*/
	errorhook_adr = (FP)ErrorHook;
	
	if (sus_all_cnt > 0) {
		if ((errorhook_adr != NULL) && (callevel != TCL_ERROR)) {
			_errorhook_svcid = svcid;
			ErrorHook(ercd);
		}
		ShutdownOS(E_OS_CALLEVEL);	/* 回復不可能 */
	}
	else {
		if (( errorhook_adr != NULL) && (callevel != TCL_ERROR)) {
			_errorhook_svcid = svcid;
			saved_callevel = callevel;
			callevel = TCL_ERROR;
			saved_ipl = current_ipl();
			if (saved_ipl < ipl_maxisr2) {
				set_ipl(ipl_maxisr2);
			}
			unlock_cpu();
			ErrorHook(ercd);
			lock_cpu();
			if (saved_ipl < ipl_maxisr2) {
				set_ipl(saved_ipl);
			}
			callevel = saved_callevel;	
		}
	}
}

/*
 *  ポストタスクフックの呼び出し
 */
void
call_posttaskhook(void)
{
	callevel = TCL_PREPOST;
	set_ipl(ipl_maxisr2);
	unlock_cpu();
	PostTaskHook();
	lock_cpu();
	set_ipl(IPL_ENA_ALL);
	callevel = TCL_TASK;	
}

/*
 *  プレタスクフックの呼び出し
 */
void
call_pretaskhook(void)
{
	callevel = TCL_PREPOST;
	set_ipl(ipl_maxisr2);
	unlock_cpu();
	PreTaskHook();
	lock_cpu();
	set_ipl(IPL_ENA_ALL);
	callevel = TCL_TASK;	
}

/*
 *  現在のアプリケーションモードの取得
 */
AppModeType
GetActiveApplicationMode(void)
{
	AppModeType	mode;

	LOG_GETAAM_ENTER();
	mode = appmode;
	LOG_GETAAM_LEAVE(mode);
	return(mode);
}

/*
 *  OSの起動
 */
void
StartOS(AppModeType mode)
{
	volatile FP startuphook_adr;

	LOG_STAOS_ENTER(mode);

	/*
	 *  アプリケーションモードの設定
	 */
	appmode = mode;

	/*
	 *  ターゲット依存の初期化
	 */
	cpu_initialize();
	sys_initialize();
	tool_initialize();

	/*
	 *  各モジュールの初期化
	 */
	object_initialize();

	/*
	 *  StartupHook の呼び出し
	 *  
	 *  C言語の規格では関数のアドレスは0にならないという前提から,
	 *  コンパイラの最適化によりStartupHookのアドレス判定分岐が
	 *  削除されてしまう場合があるため, volatile指定したローカル変数に
	 *  アドレスを代入してから判定している．
	 *
	 */
	startuphook_adr = (FP)StartupHook;
	
	if (startuphook_adr != NULL) {
		/*
		 *  StartupHook の中で，SuspendAllInterrupts が呼ばれ
		 *  ても大丈夫なように，sus_all_cnt を非ゼロにしておく．
		 */
		callevel = TCL_STARTUP;
		sus_all_cnt++;
		StartupHook();
		sus_all_cnt--;
	}
	callevel = TCL_TASK;

	LOG_STAOS_LEAVE();

	start_dispatch();
}

/*
 *  OSの終了
 */
void
ShutdownOS(StatusType ercd)
{
	volatile FP shutdownhook_adr;

	LOG_STUTOS_ENTER(ercd);

	/*
	 *  すべての割込みを禁止する
	 */
        IntGlobalDisable();

	/*
	 *  ShutdownHook の呼び出し
	 *  
	 *  C言語の規格では関数のアドレスは0にならないという前提から,
	 *  コンパイラの最適化によりShutdownHookのアドレス判定分岐が
	 *  削除されてしまう場合があるため, volatile指定したローカル変数に
	 *  アドレスを代入してから判定している．
	 */
	 
	 shutdownhook_adr = (FP)ShutdownHook;
	 
	if (shutdownhook_adr != NULL) {
		/*
		 *  ShutdownHook の中で，SuspendAllInterrupts が呼ばれ
		 *  ても大丈夫なように，sus_all_cnt を非ゼロにしておく．
		 */
		callevel = TCL_SHUTDOWN;
		sus_all_cnt++;
		ShutdownHook(ercd);
		sus_all_cnt--;
	}

	LOG_STUTOS_LEAVE();

	/*
	 *  ターゲット依存の終了処理
	 */
	cpu_terminate();
	sys_exit();
}


