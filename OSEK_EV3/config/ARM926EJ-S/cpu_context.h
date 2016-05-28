/*
 *  TOPPERS/OSEK Kernel
 *      Toyohashi Open Platform for Embedded Real-Time Systems/
 *      OSEK Kernel
 * 
 *  Copyright (C) 2000-2003 by Embedded and Real-Time Systems Laboratory
 *                              Toyohashi Univ. of Technology, JAPAN
 *  Copyright (C) 2004 by Embedded and Real-Time Systems Laboratory
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
 *	タスクコンテキスト操作ルーチン（AT91SAM7S用）
 *
 *  このファイルを cpu_config.h と分離しているのは，このファイルは TCB
 *  が定義された後に読む必要があるのに対して，cpu_config.h には TCB を
 *  定義する前に読む必要がある定義を含んでいるためである．
 */


#ifndef _CPU_CONTEXT_H_
#define _CPU_CONTEXT_H_

/*
 *  タスクを起動できる状態に設定する関数の(cpu_support.S)プロトタイプ宣言
 */
Inline void activate_context(TaskType TaskID);
/*
 *  タスクの起動関数(cpu_support.S)プロトタイプ宣言
 */
extern void activate_r(void);

/*
 *  タスクの起動準備(TCBの初期化)
 *
 *  タスクが休止状態から実行できる状態に移行する時に呼ばれる．
 */
Inline void
activate_context(TaskType TaskID)
{
	/* ディスパッチ後実行開始位置設定	*/
	tcxb_pc[TaskID] = (FP)activate_r;	/*  cpu_support.S  */

	/* スタックポインタ初期値設定	*/
	tcxb_sp[TaskID] = (VP)( (UINT32)tinib_stk[TaskID] + (UINT32)tinib_stksz[TaskID]);
}


#endif /* _CPU_CONTEXT_H_ */
