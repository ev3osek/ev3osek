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
 *	エラーチェック用マクロ
 */

#ifndef _CHECK_H_
#define _CHECK_H_

#ifdef EXTENDED_STATUS

#define CHECK_ACCESS(exp) do {			\
	if (!(exp)) {						\
		ercd = E_OS_ACCESS;				\
		goto error_exit;				\
	}									\
} while (0)

#define D_CHECK_ACCESS(exp) do {		\
	if (!(exp)) {						\
		ercd = E_OS_ACCESS;				\
		goto d_error_exit;				\
	}									\
} while (0)

#define CHECK_CALLEVEL(clmask) do {		\
	if ((callevel & (clmask)) == 0) {	\
		ercd = E_OS_CALLEVEL;			\
		goto error_exit;				\
	}									\
} while (0)

#define CHECK_TSKID(tskid) do {			\
	if (!(tskid < tnum_task)) {			\
		ercd = E_OS_ID;					\
		goto error_exit;				\
	}									\
} while (0)

#define CHECK_RESID(resid) do {			\
	if (!(resid < tnum_resource)) {		\
		ercd = E_OS_ID;					\
		goto error_exit;				\
	}									\
} while (0)

#define CHECK_CNTID(cntid) do {			\
	if (!(cntid < tnum_counter)) {		\
		ercd = E_OS_ID;					\
		goto error_exit;				\
	}									\
} while (0)

#define CHECK_ALMID(almid) do {			\
	if (!(almid < tnum_alarm)) {		\
		ercd = E_OS_ID;					\
		goto error_exit;				\
	}									\
} while (0)

#define CHECK_NOFUNC(exp) do {			\
	if (!(exp)) {						\
		ercd = E_OS_NOFUNC;				\
		goto error_exit;				\
	}									\
} while (0)

#define CHECK_RESOURCE(exp) do {		\
	if (!(exp)) {						\
		ercd = E_OS_RESOURCE;			\
		goto error_exit;				\
	}									\
} while (0)

#define D_CHECK_STATE(exp) do {			\
	if (!(exp)) {						\
		ercd = E_OS_STATE;				\
		goto d_error_exit;				\
	}									\
} while (0)

#define CHECK_VALUE(exp) do {			\
	if (!(exp)) {						\
		ercd = E_OS_VALUE;				\
		goto error_exit;				\
	}									\
} while (0)

#else /* EXTENDED_STATUS */

#define CHECK_ACCESS(exp)		((void) 0)
#define D_CHECK_ACCESS(exp)		((void) 0)
#define CHECK_CALLEVEL(clmask)	((void) 0)
#define CHECK_TSKID(tskid)		((void) 0)
#define CHECK_RESID(resid)		((void) 0)
#define CHECK_CNTID(cntid)		((void) 0)
#define CHECK_ALMID(almid)		((void) 0)
#define CHECK_NOFUNC(exp)		((void) 0)
#define CHECK_RESOURCE(exp)		((void) 0)
#define D_CHECK_STATE(exp)		((void) 0)
#define CHECK_VALUE(exp)		((void) 0)

#endif /* EXTENDED_STATUS */
#endif /* _CHECK_H_ */
