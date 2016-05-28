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
 *	開発環境依存モジュール(arm-elf-gcc用)
 *
 *  このインクルードファイルは，t_config.h のみからインクルードされる．
 *  他のファイルから直接インクルードしてはならない．
 */


#ifndef _TOOL_CONFIG_H_
#define _TOOL_CONFIG_H_

/*
 *  開発環境依存の初期化は使用しない
 */
#define tool_initialize()

/*
 *  トレースログの設定
 */

#define LOG_ACTTSK_ENTER(tskid)
#define LOG_ACTTSK_LEAVE(ercd)
#define LOG_TERTSK_ENTER()
#define LOG_TERTSK_LEAVE(ercd)
#define LOG_CHNTSK_ENTER(tskid)
#define LOG_CHNTSK_LEAVE(ercd)
#define LOG_SCHED_ENTER()
#define LOG_SCHED_LEAVE(ercd)
#define LOG_GETTID_ENTER(p_tskid)
#define LOG_GETTID_LEAVE(ercd, tskid)
#define LOG_GETTST_ENTER(tskid, p_state)
#define LOG_GETTST_LEAVE(ercd, state)
#define LOG_DISINT_ENTER()
#define LOG_DISINT_LEAVE()
#define LOG_ENAINT_ENTER()
#define LOG_ENAINT_LEAVE()
#define LOG_SUSALL_ENTER()
#define LOG_SUSALL_LEAVE()
#define LOG_RSMALL_ENTER()
#define LOG_RSMALL_LEAVE()
#define LOG_SUSOSI_ENTER()
#define LOG_SUSOSI_LEAVE()
#define LOG_RSMOSI_ENTER()
#define LOG_RSMOSI_LEAVE()
#define LOG_GETRES_ENTER(resid)
#define LOG_GETRES_LEAVE(ercd)
#define LOG_RELRES_ENTER(resid)
#define LOG_RELRES_LEAVE(ercd)
#define LOG_SETEVT_ENTER(tskid, mask)
#define LOG_SETEVT_LEAVE(ercd)
#define LOG_CLREVT_ENTER(mask)
#define LOG_CLREVT_LEAVE(ercd)
#define LOG_GETEVT_ENTER(tskid, p_mask)
#define LOG_GETEVT_LEAVE(ercd, mask)
#define LOG_WAIEVT_ENTER(mask)
#define LOG_WAIEVT_LEAVE(ercd)
#define LOG_GETALB_ENTER(almid, info)
#define LOG_GETALB_LEAVE(ercd)
#define LOG_GETALM_ENTER(almid, p_tick)
#define LOG_GETALM_LEAVE(ercd)
#define LOG_SETREL_ENTER(almid, incr, cycle)
#define LOG_SETREL_LEAVE(ercd)
#define LOG_SETABS_ENTER(almid, start, cycle)
#define LOG_SETABS_LEAVE(ercd)
#define LOG_CANALM_ENTER(almid)
#define LOG_CANALM_LEAVE(ercd)
#define LOG_SIGCNT_ENTER(cntid)
#define LOG_SIGCNT_LEAVE(ercd)
#define LOG_GETAAM_ENTER()
#define LOG_GETAAM_LEAVE(mode)
#define LOG_STAOS_ENTER(mode)
#define LOG_STAOS_LEAVE()
#define LOG_STUTOS_ENTER(ercd)
#define LOG_STUTOS_LEAVE()

#endif /* _TOOL_CONFIG_H_ */
