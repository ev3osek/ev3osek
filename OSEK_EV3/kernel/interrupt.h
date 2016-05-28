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

#ifndef _INTERRUPT_H_
#define _INTERRUPT_H_

/*
 *  ISR（カテゴリ2）IDの特殊な値の定義
 */
#define ISRID_NULL		((IsrType) UINT8_INVALID)	/* 無効ID */

/*
 *  ISR（カテゴリ2）数を保持する変数の宣言（kernel_cfg.c）
 */
extern const UINT8		tnum_isr2;			/* ISR（カテゴリ2）の数 */

/*
 *  ISR（カテゴリ2）初期化ブロック（kernel_cfg.c）
 */
extern const Priority	isrinib_intpri[];	/* 割込み優先度 */

/*
 *  ISR（カテゴリ2）管理ブロック（kernel_cfg.c）
 */
extern ResourceType		isrcb_lastres[];	/* 最後に獲得したリソース */

/*
 *  ISR（カテゴリ2）の最高優先レベル（kernel_cfg.c）
 */
extern const IPL		ipl_maxisr2;

/*
 *  実行中のISR（カテゴリ2）
 *
 *  ISR（カテゴリ2）を実行していない時は，ISRID_NULL にする．
 */
extern IsrType		runisr;

/*
 *  SuspendAllInterrupts のネスト回数
 */
extern UINT8		sus_all_cnt;	/* SuspendAllInterrupts のネスト回数 */

/*
 *  割込み管理機能の初期化
 */
extern void	interrupt_initialize(void);

#endif /* _INTERRUPT_H_ */
