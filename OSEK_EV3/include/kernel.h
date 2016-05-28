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
 *	OSEKカーネル標準インクルードファイル
 *
 *  アセンブリ言語のソースファイルやシステムコンフィギュレーションファ
 *  イルからこのファイルをインクルードする時は，_MACRO_ONLY を定義して
 *  おくことで，マクロ定義以外の記述を除くことができる．
 *
 *  この中でインクルードしているファイルを除いて，他のインクルードファ
 *  イルに依存していない．
 */

#ifndef _KERNEL_H_
#define _KERNEL_H_

/*
 *  カーネル・アプリケーション 共通インクルードファイル
 */

/*
 *  システムやプロセッサに依存する定義
 */
#include <sys_defs.h>
#include <cpu_defs.h>

#include <osek.h>


/*
 *  データ型の定義
 */
#ifndef _MACRO_ONLY

typedef unsigned int    	TaskType;			/* タスクID */
typedef UINT8			TaskStateType;		/* タスク状態 */
typedef UINT8			ResourceType;		/* リソースID */
typedef UINT32			EventMaskType;		/* イベントマスク */
typedef UINT32			TickType;			/* カウンタ値（ティック）*/
typedef UINT8			AlarmType;			/* アラームID */
typedef UINT8			AppModeType;		/* アプリケーションモード */
typedef UINT8			OSServiceIdType;	/* OSのサービスAPIのID */
typedef UINT8			IsrType;			/* ISR ID（OSEK仕様外）*/
typedef UINT8			CounterType;		/* カウンタID（OSEK仕様外）*/

typedef struct {
	TickType maxallowedvalue;	/* カウンタ指定の最大値 */
	TickType ticksperbase;		/* 単位に達するまでのティック数 */
	TickType mincycle;			/* サイクル指定の最小値 */
} AlarmBaseType;

typedef TaskType		*TaskRefType;
typedef TaskStateType	*TaskStateRefType;
typedef EventMaskType	*EventMaskRefType;
typedef TickType		*TickRefType;
typedef AlarmBaseType	*AlarmBaseRefType;

/*
 *  カーネルオブジェクト宣言用のマクロ
 */
#define DeclareTask(TaskName)		extern const TaskType TaskName
#define DeclareResource(ResName)	extern const ResourceType ResName
#define DeclareEvent(EventName)		extern const EventMaskType EventName
#define DeclareAlarm(AlarmName)		extern const AlarmType AlarmName
/* カウンタはOSEK仕様外	*/
#define DeclareCounter(CounterName)	extern const CounterType CounterName

/*
 *  メインルーチン定義用のマクロ
 */
#define TASKNAME(TaskName)	TaskMain##TaskName
#define TASK(TaskName)		void TaskMain##TaskName(void)
#define ISRNAME(ISRName)	ISRMain##ISRName
#define ISR(ISRName)		void ISRMain##ISRName(void)
#define ALARMCALLBACKNAME(AlarmCallBackName) 	\
							AlarmMain##AlarmCallBackName
#define ALARMCALLBACK(AlarmCallBackName)	\
							void AlarmMain##AlarmCallBackName(void)

/*
 *  システムサービスAPIの宣言
 */

/*
 *  タスク管理機能
 */
extern StatusType ActivateTask(TaskType tskid);
extern StatusType TerminateTask(void);
extern StatusType ChainTask(TaskType tskid);
extern StatusType Schedule(void);
extern StatusType GetTaskID(TaskRefType p_tskid);
extern StatusType GetTaskState(TaskType tskid, TaskStateRefType p_state);

/*
 *  割込み管理機能
 */
extern void EnableAllInterrupts(void);
extern void DisableAllInterrupts(void);
extern void ResumeAllInterrupts(void);
extern void SuspendAllInterrupts(void);
extern void ResumeOSInterrupts(void);
extern void SuspendOSInterrupts(void);

/*
 *  リソース管理機能
 */
extern StatusType GetResource(ResourceType resid);
extern StatusType ReleaseResource(ResourceType resid);

/*
 *  イベント制御機能
 */
extern StatusType SetEvent(TaskType tskid, EventMaskType mask);
extern StatusType ClearEvent(EventMaskType mask);
extern StatusType GetEvent(TaskType tskid, EventMaskRefType p_mask);
extern StatusType WaitEvent(EventMaskType mask);

/*
 *  アラーム機能
 */
extern StatusType GetAlarmBase(AlarmType almid, AlarmBaseRefType p_info);
extern StatusType GetAlarm(AlarmType almid, TickRefType p_tick);
extern StatusType SetRelAlarm(AlarmType almid, TickType incr, TickType cycle);
extern StatusType SetAbsAlarm(AlarmType almid, TickType start, TickType cycle);
extern StatusType CancelAlarm(AlarmType almid);

/*
 *  OS実行制御機能
 */
extern AppModeType GetActiveApplicationMode(void);
extern void StartOS(AppModeType mode);
extern void ShutdownOS(StatusType ercd);

/*
 *  カウンタ操作機能（OSEK仕様外）
 */
extern StatusType SignalCounter(CounterType cntid);

/*
 *  コールバック
 */
extern void ErrorHook(StatusType ercd);
extern void PreTaskHook(void);
extern void PostTaskHook(void);
extern void StartupHook(void);
extern void ShutdownHook(StatusType ercd);

#endif /* _MACRO_ONLY */

/*
 *  OSのエラーコード
 */
#define E_OS_ACCESS		((StatusType) 1)
#define E_OS_CALLEVEL	((StatusType) 2)
#define E_OS_ID			((StatusType) 3)
#define E_OS_LIMIT		((StatusType) 4)
#define E_OS_NOFUNC		((StatusType) 5)
#define E_OS_RESOURCE	((StatusType) 6)
#define E_OS_STATE		((StatusType) 7)
#define E_OS_VALUE		((StatusType) 8)

/*
 *  その他の定数値
 */
#define INVALID_TASK		((TaskType) UINT8_INVALID)	/* 無効タスク */

#define SUSPENDED			((StatusType) 0)	/* 休止状態 */
#define RUNNING				((StatusType) 1)	/* 実行状態 */
#define READY				((StatusType) 2)	/* 実行可能状態 */
#define WAITING				((StatusType) 3)	/* 待ち状態 */

#define RES_SCHEDULER		((ResourceType) 0)	/* スケジューラリソース */

#define OSDEFAULTAPPMODE	((AppModeType) 0x01)
									/* デフォルトアプリケーションモード */

/*
 *  OSのサービスAPIのID
 */
#define OSServiceId_ActivateTask				((OSServiceIdType) 0)
#define OSServiceId_TerminateTask				((OSServiceIdType) 1)
#define OSServiceId_ChainTask					((OSServiceIdType) 2)
#define OSServiceId_Schedule					((OSServiceIdType) 3)
#define OSServiceId_GetTaskID					((OSServiceIdType) 4)
#define OSServiceId_GetTaskState				((OSServiceIdType) 5)
#define OSServiceId_EnableAllInterrupts			((OSServiceIdType) 6)
#define OSServiceId_DisableAllInterrupts		((OSServiceIdType) 7)
#define OSServiceId_ResumeAllInterrupts			((OSServiceIdType) 8)
#define OSServiceId_SuspendAllInterrupts		((OSServiceIdType) 9)
#define OSServiceId_ResumeOSInterrupts			((OSServiceIdType) 10)
#define OSServiceId_SuspendOSInterrupts			((OSServiceIdType) 11)
#define OSServiceId_GetResource					((OSServiceIdType) 12)
#define OSServiceId_ReleaseResource				((OSServiceIdType) 13)
#define OSServiceId_SetEvent					((OSServiceIdType) 14)
#define OSServiceId_ClearEvent					((OSServiceIdType) 15)
#define OSServiceId_GetEvent					((OSServiceIdType) 16)
#define OSServiceId_WaitEvent					((OSServiceIdType) 17)
#define OSServiceId_GetAlarmBase				((OSServiceIdType) 18)
#define OSServiceId_GetAlarm					((OSServiceIdType) 19)
#define OSServiceId_SetRelAlarm					((OSServiceIdType) 20)
#define OSServiceId_SetAbsAlarm					((OSServiceIdType) 21)
#define OSServiceId_CancelAlarm					((OSServiceIdType) 22)
#define OSServiceId_GetActiveApplicationMode	((OSServiceIdType) 23)
#define OSServiceId_StartOS						((OSServiceIdType) 24)
#define OSServiceId_ShutdownOS					((OSServiceIdType) 25)
#define OSServiceId_SignalCounter				((OSServiceIdType) 26)

/*
 *  エラーフックに渡す情報のための定義（定義内容はOSEK仕様外）
 */
#ifndef _MACRO_ONLY

typedef union {
		TaskType			tskid;
		TaskRefType			p_tskid;
		TaskStateRefType	p_state;
		ResourceType		resid;
		EventMaskType		mask;
		EventMaskRefType	p_mask;
		AlarmType			almid;
		AlarmBaseRefType	p_info;
		TickRefType			p_tick;
		TickType			incr;
		TickType			cycle;
		TickType			start;
		AppModeType			mode;
		CounterType			cntid;
	} _ErrorHook_Par;

extern OSServiceIdType	_errorhook_svcid;
extern _ErrorHook_Par	_errorhook_par1, _errorhook_par2, _errorhook_par3;

#endif /* _MACRO_ONLY */

/*
 *  マクロの定義
 */
#define OSErrorGetServiceId()				(_errorhook_svcid)

#define OSError_ActivateTask_TaskID()		(_errorhook_par1.tskid)
#define OSError_ChainTask_TaskID()			(_errorhook_par1.tskid)
#define OSError_GetTaskID_TaskID()			(_errorhook_par1.p_tskid)
#define OSError_GetTaskState_TaskID()		(_errorhook_par1.tskid)
#define OSError_GetTaskState_State()		(_errorhook_par2.p_state)
#define OSError_GetResource_ResID()			(_errorhook_par1.resid)
#define OSError_ReleaseResource_ResID()		(_errorhook_par1.resid)
#define OSError_SetEvent_TaskID()			(_errorhook_par1.tskid)
#define OSError_SetEvent_Mask()				(_errorhook_par2.mask)
#define OSError_ClearEvent_Mask()			(_errorhook_par1.mask)
#define OSError_GetEvent_TaskID()			(_errorhook_par1.tskid)
#define OSError_GetEvent_Mask()				(_errorhook_par2.p_mask)
#define OSError_WaitEvent_Mask()			(_errorhook_par1.mask)
#define OSError_GetAlarmBase_AlarmID()		(_errorhook_par1.almid)
#define OSError_GetAlarmBase_Info()			(_errorhook_par2.p_info)
#define OSError_GetAlarm_AlarmID()			(_errorhook_par1.almid)
#define OSError_GetAlarm_Tick()				(_errorhook_par2.p_tick)
#define OSError_SetRelAlarm_AlarmID()		(_errorhook_par1.almid)
#define OSError_SetRelAlarm_increment()		(_errorhook_par2.incr)
#define OSError_SetRelAlarm_cycle()			(_errorhook_par3.cycle)
#define OSError_SetAbsAlarm_AlarmID()		(_errorhook_par1.almid)
#define OSError_SetAbsAlarm_start()			(_errorhook_par2.start)
#define OSError_SetAbsAlarm_cycle()			(_errorhook_par3.cycle)
#define OSError_CancelAlarm_AlarmID()		(_errorhook_par1.almid)
#define OSError_SignalCounter_CounterID()	(_errorhook_par1.cntid)

/*
 *  バージョン情報（μITRON4.0仕様に準拠）
 */
#define	TKERNEL_MAKER	0x0118u		/* カーネルのメーカーコード */
#define	TKERNEL_PRID	0x0010u		/* カーネルの識別番号 */
#define	TKERNEL_SPVER	0x0221u		/* OSEK仕様のバージョン番号 */
#define	TKERNEL_PRVER	0x1010u		/* カーネルのバージョン番号 */

#endif /* _KERNEL_H_ */
