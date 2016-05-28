/*
 *  TOPPERS/OSEK Kernel
 *      Toyohashi Open Platform for Embedded Real-Time Systems/
 *      OSEK Kernel
 *
 *  Copyright (C) 2000-2003 by Embedded and Real-Time Systems Laboratory
 *                              Toyohashi Univ. of Technology, JAPAN
 *  Copyright (C) 2004 by Embedded and Real-Time Systems Laboratory
 *              Graduate School of Information Science, Nagoya Univ., JAPAN
 *  Copyright (C) 2006 by Witz Corporation, JAPAN
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
 *  プロセッサ依存モジュール（AT91SAM7S用）
 */


#ifndef	_CPU_CONFIG_H_
#define	_CPU_CONFIG_H_

#define MAX_IPM  0xf	/* スタブなしの場合は最高優先度でCPUロック */


#ifndef _MACRO_ONLY
#include "cpu_insn.h"
#endif /* _MACRO_ONLY */


#ifndef _MACRO_ONLY
/* インライン関数プロトタイプ宣言	*/
Inline void set_ipl(UINT8 ipl);
Inline UINT8 current_ipl(void);


/*
 *  本OSカーネルでは割込み制御をIフラグ及びIPLの双方を用いて行う
 *  ことを前提とする．本CPUはIPLのみしか持たないため、
 *  Iフラグをソフトウェアで補う仕様とする
 */

/*
 *  割込み優先度レベル設定
 */
Inline void set_ipl(UINT8 ipl)
{
}


/*
 *  割込み優先度レベル取得
 */
Inline UINT8 current_ipl(void)
{
	return 0;
}


/*
 *  プロセッサ依存の初期化(cpu_config.c)
 */
extern void	cpu_initialize(void);

/*
 *  プロセッサ依存の終了時処理(cpu_config.c)
 */
extern void	cpu_terminate(void);

#define DEFINE_CTXB(tnum) \
FP tcxb_pc[tnum]; \
VP tcxb_sp[tnum];

extern FP tcxb_pc[];
extern VP tcxb_sp[];

/* ディスパッチ周りのアセンブラ関数プロトタイプ宣言	*/
extern void  dispatch(void);
extern void  exit_and_dispatch(void);
extern void  start_dispatch(void);

#endif /* _MACRO_ONLY */
#endif	/* _CPU_CONFIG_H_	*/

