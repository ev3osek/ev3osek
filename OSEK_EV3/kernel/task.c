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
 *	タスク管理モジュール
 */

#include "osek_kernel.h"
#include "check.h"
#include "task.h"
#include "resource.h"
#include "cpu_context.h"
#include "stdio.h"

/*
 *  スタティック関数のプロトタイプ宣言
 */
Inline void	ready_insert_first(Priority pri, TaskType tskid);
Inline void	ready_insert_last(Priority pri, TaskType tskid);
Inline TaskType	ready_delete_first(Priority pri);
Inline Priority	bitmap_search(UINT16 bitmap);

/*
 *  レディキュー
 *
 *  レディキューには実行可能状態のタスクのみをつなぐこととし，実行状態
 *  のタスクはレディキューからは外す．厳密には，schedtsk をレディキュー
 *  から外す（割込み処理中には，runtsk がレディキューから外れているとは
 *  限らない）．
 *  レディキューは，優先度毎の単方向リンクキューで構成する．レディキュー
 *  の先頭のタスクIDを ready_queue_first に，末尾のタスクID を
 *  ready_queue_last に保持する．レディキューが空の時は，ready_queue_first 
 *  を TSKID_NULL とし，ready_queue_last は不定とする．
 */
// The following two arrays were declared static - but this caused the stored values to vanish between the call to ready_insert_last and ready_delete_first
TaskType ready_queue_first[TNUM_PRIORITY];
TaskType ready_queue_last[TNUM_PRIORITY];

/*
 *  レディキューの先頭への挿入
 */
Inline void
ready_insert_first(Priority pri, TaskType tskid)
{
	TaskType	first;

	assert(pri <= TPRI_MAXTASK);
	first = ready_queue_first[pri];
	ready_queue_first[pri] = tskid;
	tcb_next[tskid] = first;
	if (first == TSKID_NULL) {
		ready_queue_last[pri] = tskid;
	}
}

/*
 *  レディキューの末尾への挿入
 */
Inline void
ready_insert_last(Priority pri, TaskType tskid)
{
	assert(pri <= TPRI_MAXTASK);
	if (ready_queue_first[pri] == TSKID_NULL) {
		ready_queue_first[pri] = tskid;
	}
	else {
		tcb_next[ready_queue_last[pri]] = tskid;
	}
	ready_queue_last[pri] = tskid;
	tcb_next[tskid] = TSKID_NULL;
}

/*
 *  レディキューの先頭タスクの削除
 */
Inline TaskType
ready_delete_first(Priority pri)
{
	TaskType	first;

	first = ready_queue_first[pri];
	assert(first != TSKID_NULL);
	ready_queue_first[pri] = tcb_next[first];
	return(first);
}

/*
 *  ビットマップサーチ関数
 *
 *  bitmap 内の 1 のビットの内，最も上記（左）のものをサーチし，そのビ
 *  ット番号を返す．ビット番号は，最下位ビットを 0 とする．bitmap に 0
 *  を指定してはならない．この関数では，優先度が16段階以下であることを
 *  仮定し，bitmap の下位16ビットのみをサーチする．
 *  ビットサーチ命令を持つプロセッサでは，ビットサーチ命令を使うように
 *  書き直した方が効率が良いだろう．このような場合には，cpu_insn.h で
 *  ビットサーチ命令を使った bitmap_search を定義し，CPU_BITMAP_SEARCH 
 *  をマクロ定義すればよい．また，ビットサーチ命令のサーチ方向が逆など
 *  の理由で優先度とビットとの対応を変更したい場合には，PRIMAP_BIT を
 *  マクロ定義すればよい．
 *  また，標準ライブラリに ffs があるなら，次のように定義して標準ライ
 *  ブラリを使った方が効率が良い可能性もある．
 *	#define PRIMAP_BIT(pri)	(0x8000u >> (pri))
 *	#define	bitmap_search(bitmap) (16 - ffs(bitmap))
 *  μITRON仕様とは優先度の意味が逆のため，サーチする方向が逆になって
 *  いる．bitmap_search を置き換える場合には，注意が必要である．
 */
#ifndef PRIMAP_BIT
#define	PRIMAP_BIT(pri)		(1u << (pri))
#endif /* PRIMAP_BIT */

#ifndef CPU_BITMAP_SEARCH

Inline Priority
bitmap_search(UINT16 bitmap)
{
	static const UINT8 search_table[] = { 0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3 };
	Priority	pri = 0;

	assert((bitmap & ((UINT16) 0xffffu)) != 0);
	if ((bitmap & ((UINT16) 0xff00u)) != 0) {
		bitmap >>= 8;
		pri += 8;
	}
	if ((bitmap & ((UINT16) 0xf0)) != 0) {
		bitmap >>= 4;
		pri += 4;
	}
	return(pri + (search_table[(bitmap & ((UINT16) 0x0f)) - 1]));
}

#endif /* CPU_BITMAP_SEARCH */

/*
 *  実行状態のタスク
 */
TaskType	runtsk;

/*
 *  最高優先順位タスク
 */
TaskType	schedtsk;

/*
 *  レディキュー中の最高優先度
 */
Priority	nextpri;

/*
 *  レディキューに入っているタスクの優先度のビットマップ
 *
 *  レディキューが空の時（実行可能状態のタスクが無い時）は 0 にする．
 */
static UINT16	ready_primap;

/*
 *  タスク管理モジュールの初期化
 */
void
task_initialize(void)
{
	Priority	pri;
	TaskType	tskid;

	runtsk = TSKID_NULL;
	schedtsk = TSKID_NULL;
	for (pri = 0; pri < TNUM_PRIORITY; pri++) {
		ready_queue_first[pri] = TSKID_NULL;
	}
	nextpri = TPRI_MINTASK;
	ready_primap = 0u;

	for (tskid = 0; tskid < tnum_task; tskid++) {
		tcb_actcnt[tskid] = 0;
		if ((tinib_autoact[tskid] & appmode) != APPMODE_NONE) {
			(void)make_active(tskid);
			tcb_tstat[tskid] = TS_RUNNABLE;
		}
		else {
			tcb_tstat[tskid] = TS_DORMANT;
		}
	}
}

/*
 *  タスクの起動
 *
 *  TerminateTask や ChainTask の中で，自タスクに対して make_active を
 *  呼ぶ場合があるので注意する．
 */
BOOL
make_active(TaskType tskid)
{
	tcb_curpri[tskid] = tinib_inipri[tskid];
	if (tskid < tnum_exttask) {
		tcb_curevt[tskid] = EVTMASK_NONE;
		tcb_waievt[tskid] = EVTMASK_NONE;
	}
	tcb_lastres[tskid] = RESID_NULL;
	activate_context(tskid);
	return(make_runnable(tskid));
}

/*
 *  実行できる状態への移行
 */
BOOL
make_runnable(TaskType tskid)
{
	Priority	pri, schedpri;

	tcb_tstat[tskid] = TS_RUNNABLE;
	if (schedtsk != TSKID_NULL) {
		pri = tcb_curpri[tskid];
		schedpri = tcb_curpri[schedtsk];
                
		if (pri <= schedpri) {
			/*
			 *  schedtsk の方が優先度が高い場合，tskid をレ
			 *  ディキューの最後に入れる．
			 */
			ready_insert_last(pri, tskid);
			ready_primap |= PRIMAP_BIT(pri);
			if (pri > nextpri) {
				nextpri = pri;
			}
			return(FALSE);
		}
		/*
		 *  tskid の方が優先度が高い場合，schedtsk をレディキュー
		 *  の先頭に入れ，tskid を新しい schedtsk とする．
		 */
		ready_insert_first(schedpri, schedtsk);
		ready_primap |= PRIMAP_BIT(schedpri);
		nextpri = schedpri;
	}
	schedtsk = tskid;
	return(TRUE);
}

/*
 *  最高優先順位タスクのサーチ
 */
void
search_schedtsk(void)
{
	if (ready_primap == ((UINT16) 0)) {
		schedtsk = TSKID_NULL;
	}
	else {
		schedtsk = ready_delete_first(nextpri);
		if (ready_queue_first[nextpri] == TSKID_NULL) {
			ready_primap &= ~PRIMAP_BIT(nextpri);
			nextpri = (ready_primap == ((UINT16) 0)) ?
						TPRI_MINTASK : bitmap_search(ready_primap);
		}
	}
}

/*
 *  タスクのプリエンプト
 */
void
preempt(void)
{
	assert(runtsk == schedtsk);
	ready_insert_first(tcb_curpri[schedtsk], schedtsk);
	ready_primap |= PRIMAP_BIT(tcb_curpri[schedtsk]);
	search_schedtsk();
}
