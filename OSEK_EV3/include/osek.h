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
 *	OSEK標準インクルードファイル
 *
 *  アセンブリ言語のソースファイルやシステムコンフィギュレーションファ
 *  イルからこのファイルをインクルードする時は，_MACRO_ONLY を定義して
 *  おくことで，マクロ定義以外の記述を除くことができる．
 *
 *  この中でインクルードしているファイルを除いて，他のインクルードファ
 *  イルに依存していない．
 */

#ifndef _OSEK_H_
#define _OSEK_H_

/*
 *  基礎データ型の定義
 */
#include <t_stddef.h>

#ifndef BASICTYPEDEFIND
#define BASICTYPEDEFIND

#ifndef _MACRO_ONLY

#ifdef _bool_
typedef _bool_				BOOL;		/* ブール型 */
#else /* _bool_ */
typedef int					BOOL;		/* ブール型 */
#endif /* _bool_ */

typedef	signed _int8_		INT8;		/* 符号付き8ビット整数 */
typedef	unsigned _int8_		UINT8;		/* 符号無し8ビット整数 */
#define UINT8_INVALID		((UINT8)(~0u))

typedef	signed _int16_		INT16;		/* 符号付き16ビット整数 */
typedef	unsigned _int16_	UINT16;		/* 符号無し16ビット整数 */
#define UINT16_INVALID		((UINT16)(~0u))

typedef	signed _int32_		INT32;		/* 符号付き32ビット整数 */
typedef	unsigned _int32_	UINT32;		/* 符号無し32ビット整数 */

#ifdef _int64_
typedef	signed _int64_		INT64;		/* 符号付き64ビット整数 */
typedef	unsigned _int64_	UINT64;		/* 符号無し64ビット整数 */
#endif /* _int64_ */

#endif /* _MACRO_ONLY */
#endif /* BASICTYPEDEFIND */

/*
 *  ステータス情報に関する定義
 */
#ifndef STATUSTYPEDEFINED
#define STATUSTYPEDEFINED

#ifndef _MACRO_ONLY
typedef UINT8		StatusType;			/* ステータス情報 */
#endif /* _MACRO_ONLY */

#define	E_OK		((StatusType) 0)	/* 正常終了 */

#endif /* STATUSTYPEDEFINED */

#endif /*_OSEK_H_*/
