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
 *	割込み管理機能
 */

#include "osek_kernel.h"
#include "interrupt.h"
#include "armv5/am1808/interrupt.h"

/*
 *  実行中のISR（カテゴリ2）
 */
IsrType		runisr;

/*
 *  割込み管理機能内部で使用する変数の定義
 */

/*
 *  SuspendAllInterrupts のネスト回数
 *
 *  この変数は，disable_int() した状態でのみ変更してよい．
 */
UINT8		sus_all_cnt;

/*
 *  SuspendOSInterrupts のネスト回数
 *
 *  この変数は，set_ipl(ipl_maxisr2) した状態でのみ変更してよい．
 *  set_ipl(ipl_maxisr2) しても，カテゴリ1 の ISR は入ってくるが，元の
 *  値に戻してからリターンすれば問題はない．
 */
static UINT8	sus_os_cnt;

/*
 *  SuspendOSInterrupts する前の割込み優先レベル
 *
 *  この変数は，set_ipl(ipl_maxisr2) した状態でのみ変更してよい．また，
 *  この変数を使用している間は，sus_os_cnt を非ゼロにしておく．
 *  set_ipl(ipl_maxisr2) してもカテゴリ1 の ISR は入ってくるが，
 *  sus_os_cnt を非ゼロにしておくことで，カテゴリ1 の ISR でこの変数が
 *  変更されることはない．
 */
static IPL	saved_ipl;

/*
 *  SuspendAllInterrupts/SuspendOSInterrupts する前の実行コンテキスト
 *
 *  この変数は，disable_int または set_ipl(ipl_maxisr2) した状態でのみ
 *  変更してよい．また，この変数を使用している間は，sus_all_cnt か 
 *  sus_os_cnt を非ゼロにしておく．set_ipl(ipl_maxisr2) してもカテゴリ1
 *  の ISR は入ってくるが，sus_os_cnt を非ゼロにしておくことで，カテゴ
 *  リ1 の ISR でこの変数が変更されることはない．
 */
static UINT8	saved_callevel;

/*
 *  割込み管理機能の初期化
 */
void
interrupt_initialize(void)
{
	IsrType		isrid;

	isrid = ISRID_NULL;
	sus_all_cnt = 0u;
	sus_os_cnt = 0u;
	for (isrid = 0; isrid < tnum_isr2; isrid++) {
		isrcb_lastres[isrid] = 0u;
	}
}

/*
 *  すべての割込みの禁止（高速簡易版）
 */
void
DisableAllInterrupts(void)
{
	LOG_DISINT_ENTER();
	IntGlobalDisable();
	LOG_DISINT_LEAVE();
}

/*
 *  すべての割込みの許可（高速簡易版）
 */
void
EnableAllInterrupts(void)
{
	LOG_ENAINT_ENTER();
	IntGlobalEnable();
	LOG_ENAINT_LEAVE();
}

/*
 *  すべての割込みの禁止
 */
void
SuspendAllInterrupts(void)
{
	LOG_SUSALL_ENTER();
	if (sus_all_cnt == UINT8_INVALID) {
		/*
		 *  SuspendAllInterrupts を繰り返し呼んだ場合の対策
		 *  （何もせずに抜ける）
		 */
	}
	else if (sus_all_cnt == 0) {
		IntGlobalDisable();
		sus_all_cnt++;
		if (sus_os_cnt == 0) {
			saved_callevel = callevel;
			callevel = TCL_NULL;
		}
	}
	else {
		sus_all_cnt++;
	}
	LOG_SUSALL_LEAVE();
}

/*
 *  すべての割込みの許可
 */
void
ResumeAllInterrupts(void)
{
	LOG_RSMALL_ENTER();
	if (sus_all_cnt == 0) {
		/*
		 *  SuspendAllInterrupts を呼ばずに，ResumeAllInterrupts
		 *  を呼んだ場合の対策（何もせずに抜ける）
		 */
	}
	else if (sus_all_cnt == 1) {
		if (sus_os_cnt == 0) {
			callevel = saved_callevel;
		}
		sus_all_cnt--;
		IntGlobalEnable();
	}
	else {
		sus_all_cnt--;
	}
	LOG_RSMALL_LEAVE();
}

/*
 *  カテゴリ2の割込みの禁止
 */
void
SuspendOSInterrupts(void)
{
	IPL	ipl;

	LOG_SUSOSI_ENTER();
	if (sus_os_cnt == UINT8_INVALID) {
		/*
		 *  SuspendOSInterrupts を繰り返し呼んだ場合の対策
		 *  （何もせずに抜ける）
		 */
	}
	else if (sus_os_cnt == 0) {
		ipl = current_ipl();

		/*
		 *  すでに ISR2 が禁止されている時は何もしない．
		 */
		if (ipl < ipl_maxisr2) {
			set_ipl(ipl_maxisr2);
		}
		sus_os_cnt++;
		saved_ipl = ipl;
		if (sus_all_cnt == 0) {
			saved_callevel = callevel;
			callevel = TCL_NULL;
		}
	}
	else {
		sus_os_cnt++;
	}
	LOG_SUSOSI_LEAVE();
}

/*
 *  カテゴリ2の割込みの許可
 */
void
ResumeOSInterrupts(void)
{
	LOG_RSMOSI_ENTER();
	if (sus_os_cnt == 0) {
		/*
		 *  SuspendOSInterrupts を呼ばずに，ResumeOSInterrupts
		 *  を呼んだ場合の対策（何もせずに抜ける）
		 */
	}
	else if (sus_os_cnt == 1) {
		if (sus_all_cnt == 0) {
			callevel = saved_callevel;
		}
		sus_os_cnt--;

		/*
		 *  もともと ISR2 が禁止されていた時は何もしない．
		 */
		if (saved_ipl < ipl_maxisr2) {
			set_ipl(saved_ipl);
		}
	}
	else {
		sus_os_cnt--;
	}
	LOG_RSMOSI_LEAVE();
}
