/*
 *  TOPPERS/OSEK Kernel
 *      Toyohashi Open Platform for Embedded Real-Time Systems/
 *      OSEK Kernel
 * 
 *  Copyright (C) 2000-2003 by Embedded and Real-Time Systems Laboratory
 *                              Toyohashi Univ. of Technology, JAPAN
 *  Copyright (C) 2004,2006 by Embedded and Real-Time Systems Laboratory
 *              Graduate School of Information Science, Nagoya Univ., JAPAN
 *  Copyright (C) 2004-2006 by Witz Corporation, JAPAN
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
 *	アラーム機能
 */

#ifndef _ALARM_H_
#define _ALARM_H_

/*
 *  アラームIDの特殊な値の定義
 */
#define ALMID_NULL		((AlarmType) UINT8_INVALID)	/* 無効ID */

/*
 *  カウンタ数・アラーム数を保持する変数の宣言
 */
extern const UINT8		tnum_counter;		/* カウンタの数 */
extern const UINT8		tnum_alarm;			/* アラームの数 */

/*
 *  カウンタ初期化ブロック
 */
extern const TickType	cntinib_maxval[];	/* カウンタの最大値 */
extern const TickType	cntinib_maxval2[];	/* カウンタの最大値の2倍+1 */
extern const TickType	cntinib_tickbase[];	/* 1回で進むティック数 */
extern const TickType	cntinib_mincyc[];	/* 周期の最小値 */

/*
 *  カウンタ管理ブロック
 */
extern TickType			cntcb_curval[];		/* カウンタの現在ティック */
extern AlarmType		cntcb_almque[];		/* アラームのキュー */

/*
 *  アラーム初期化ブロック
 */
extern const CounterType alminib_cntid[];	/* 付加されているカウンタ */
extern const FP			 alminib_cback[];	/* アラームコールバック */
extern const AppModeType alminib_autosta[];	/* 起動するモード */
extern const TickType	 alminib_almval[];	/* expire するティック値 */
extern const TickType	 alminib_cycle[];	/* アラームの周期 */

/*
 *  アラーム管理ブロック
 *
 *  アラームがアラームキューに挿入されていない場合，almcb_nextには
 *  そのアラームのIDが入っている（nextが自分を指している）．
 */
extern AlarmType		almcb_next[];		/* アラームキュー */
extern AlarmType		almcb_prev[];		/* アラームキュー */
extern TickType			almcb_almval[];		/* expire するティック値 */
extern TickType			almcb_cycle[];		/* アラームの周期 */

/*
 *  アラーム機能の初期化
 */
extern void	alarm_initialize(void);

#endif /* _ALARM_H_ */
