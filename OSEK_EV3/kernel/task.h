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

#ifndef _TASK_H_
#define _TASK_H_

/*
 *  タスクIDの特殊な値の定義
 */
#define TSKID_NULL		((TaskType) UINT8_INVALID)	/* 無効ID */

/*
 *  タスク状態（tcb_stat）値の定義
 */
#define TS_RUNNABLE		READY				/* 実行状態，実行可能状態 */
#define TS_DORMANT		SUSPENDED			/* 休止状態 */
#define TS_WAITING		WAITING				/* 待ち状態 */

/*
 *  タスク数を保持する変数の宣言（kernel_cfg.c）
 */
extern const UINT8	tnum_task;		/* タスクの数 */
extern const UINT8	tnum_exttask;		/* 拡張タスクの数 */

/*
 *  タスク初期化ブロック（kernel_cfg.c）
 */
extern const Priority	tinib_inipri[];		/* 初期優先度 */
extern const Priority	tinib_exepri[];		/* 実行開始時の優先度 */
extern const UINT8		tinib_maxact[];		/* 多重起動要求の最大数 */
extern const AppModeType tinib_autoact[];	/* 起動するモード */
extern const FP			tinib_task[];		/* タスクの起動番地 */
extern const VP			tinib_stk[];		/* スタック領域の先頭番地 */
extern const UINT16		tinib_stksz[];		/* スタック領域のサイズ */

/*
 *  タスク管理ブロック（kernel_cfg.c）
 *
 *  この他に，タスクコンテキストを保存するための配列が，ターゲット依存
 *  に定義される．
 */
extern TaskType			tcb_next[];			/* タスクキュー */
extern UINT8			tcb_tstat[];		/* タスク状態 */
extern Priority			tcb_curpri[];		/* 現在の優先度 */
extern UINT8			tcb_actcnt[];		/* 多重起動要求数 */
extern EventMaskType	tcb_curevt[];		/* イベントの現在値 */
extern EventMaskType	tcb_waievt[];		/* 待っているイベント */
extern ResourceType		tcb_lastres[];		/* 最後に獲得したリソース */

/*
 *  実行状態のタスク
 *
 *  実行状態のタスクがない場合には，TSKID_NULL にする．
 */
extern TaskType			runtsk;

/*
 *  最高優先順位タスク
 *
 *  タスク実行中は，runtsk と一致する．実行できる状態（実行状態または
 *  実行可能状態）のタスクがない場合には，TSKID_NULL にする．
 */
extern TaskType			schedtsk;

/*
 *  レディキュー中の最高優先度
 *
 *  レディキューには実行可能状態のタスクのみを含むので，実行可能状態の
 *  タスクの中出の最高優先度を保持する．レディキューが空の時（実行可能
 *  状態のタスクが無い時）は TPRI_MINTASK（＝0）にする．
 */
extern Priority			nextpri;

/*
 *  タスク管理モジュールの初期化
 */
extern void	task_initialize(void);

/*
 *  タスクの起動
 *
 *  対象タスク（tskid で指定したタスク）を起動する（休止状態から実行で
 *  きる状態に遷移させる．タスクの起動時に必要な初期化を行う．
 */
extern BOOL	make_active(TaskType tskid);

/*
 *  実行できる状態への移行
 *
 *  対象タスク（tskid で指定したタスク）を実行できる状態に遷移させる．
 *  対象タスクの優先度が，最高優先度タスク（schedtsk）の優先度よりも高
 *  い場合には，対象タスクを新しい最高優先度タスクとし，それまでの最高
 *  優先度タスクをレディキューの先頭に入れる．そうでない場合には，対象
 *  タスクをレディキューの末尾に入れる．対象タスクを最高優先度タスクと
 *  した場合に，TRUE を返す．
 */
extern BOOL	make_runnable(TaskType tskid);

/*
 *  最高優先順位タスクのサーチ
 *
 *  レディキュー中で最も優先順位の高いタスクをサーチし，それをレディ
 *  キューから外して，最高優先順位タスク（schedtsk）とする．実際には，
 *  レディキュー中の最高優先度が nextpri に設定されているためにサーチ
 *  は必要なく，優先度 nextpri のレディキューの先頭のタスクを最高優先
 *  順位タスクとする．レディキューのサーチは，そのタスクをレディキュー
 *  から外した後に nextpri を更新するために必要となる．このサーチに，
 *  ready_primap を用いる．
 *  この関数は，それまで実行状態であったタスクが待ち状態か休止状態に移
 *  行した時に，次に実行すべきタスクを選ぶために呼び出す．よってこの関
 *  数では，それまでの最高優先度タスクは無視する．
 */
extern void	search_schedtsk(void);

/*
 *  タスクのプリエンプト
 *
 *  自タスクを実行可能状態に移行させ，最高優先度タスクを実行状態にする．
 *  この関数から戻った後に，dispatch を呼び出して他のタスクへ切り替える
 *  ことを想定している．
 */
extern void	preempt(void);

#endif /* _TASK_H_ */
