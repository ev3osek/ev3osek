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
 *  ���L���쌠�҂́C�ȉ��� (1)�`(4) �̏������CFree Software Foundation 
 *  �ɂ����Č��\�����Ă��� GNU General Public License �� Version 2 �ɋL
 *  �q�����Ă��������𖞂����ꍇ�Ɍ����C�{�\�t�g�E�F�A�i�{�\�t�g�E�F�A
 *  �����ς������̂��܂ށD�ȉ������j���g�p�E�����E���ρE�Ĕz�z�i�ȉ��C
 *  ���p�ƌĂԁj���邱�Ƃ𖳏��ŋ��������D
 *  (1) �{�\�t�g�E�F�A���\�[�X�R�[�h�̌`�ŗ��p�����ꍇ�ɂ́C���L�̒���
 *      ���\���C���̗��p���������щ��L�̖��ۏ؋K�肪�C���̂܂܂̌`�Ń\�[
 *      �X�R�[�h���Ɋ܂܂��Ă��邱�ƁD
 *  (2) �{�\�t�g�E�F�A���C���C�u�����`���ȂǁC���̃\�t�g�E�F�A�J���Ɏg
 *      �p�ł����`�ōĔz�z�����ꍇ�ɂ́C�Ĕz�z�ɔ����h�L�������g�i���p
 *      �҃}�j���A���Ȃǁj�ɁC���L�̒��쌠�\���C���̗��p���������щ��L
 *      �̖��ۏ؋K�����f�ڂ��邱�ƁD
 *  (3) �{�\�t�g�E�F�A���C�@���ɑg�ݍ��ނȂǁC���̃\�t�g�E�F�A�J���Ɏg
 *      �p�ł��Ȃ��`�ōĔz�z�����ꍇ�ɂ́C���̂����ꂩ�̏����𖞂�����
 *      �ƁD
 *    (a) �Ĕz�z�ɔ����h�L�������g�i���p�҃}�j���A���Ȃǁj�ɁC���L�̒�
 *        �쌠�\���C���̗��p���������щ��L�̖��ۏ؋K�����f�ڂ��邱�ƁD
 *    (b) �Ĕz�z�̌`�Ԃ��C�ʂɒ��߂����@�ɂ����āCTOPPERS�v���W�F�N�g��
 *        �񍐂��邱�ƁD
 *  (4) �{�\�t�g�E�F�A�̗��p�ɂ��蒼�ړI�܂��͊ԐړI�ɐ����邢���Ȃ鑹
 *      �Q�������C���L���쌠�҂�����TOPPERS�v���W�F�N�g���Ɛӂ��邱�ƁD
 * 
 *  �{�\�t�g�E�F�A�́C���ۏ؂Œ񋟂����Ă������̂ł����D���L���쌠�҂�
 *  ����TOPPERS�v���W�F�N�g�́C�{�\�t�g�E�F�A�Ɋւ��āC���̓K�p�\����
 *  �܂߂āC�����Ȃ��ۏ؂��s���Ȃ��D�܂��C�{�\�t�g�E�F�A�̗��p�ɂ��蒼
 *  �ړI�܂��͊ԐړI�ɐ����������Ȃ鑹�Q�Ɋւ��Ă��C���̐ӔC�𕉂��Ȃ��D
 * 
 */

/*
 *	OSEK�J�[�l���W���C���N���[�h�t�@�C��
 *
 *  �A�Z���u�������̃\�[�X�t�@�C�����V�X�e���R���t�B�M�����[�V�����t�@
 *  �C�����炱�̃t�@�C�����C���N���[�h���鎞�́C_MACRO_ONLY �����`����
 *  �������ƂŁC�}�N�����`�ȊO�̋L�q���������Ƃ��ł����D
 *
 *  ���̒��ŃC���N���[�h���Ă����t�@�C���������āC���̃C���N���[�h�t�@
 *  �C���Ɉˑ����Ă��Ȃ��D
 */

#ifndef _KERNEL_H_
#define _KERNEL_H_

/*
 *  �J�[�l���E�A�v���P�[�V���� ���ʃC���N���[�h�t�@�C��
 */

/*
 *  �V�X�e�����v���Z�b�T�Ɉˑ��������`
 */
#include <sys_defs.h>
#include <cpu_defs.h>

#include <osek.h>


/*
 *  �f�[�^�^�̒��`
 */
#ifndef _MACRO_ONLY

typedef unsigned int    	TaskType;			/* �^�X�NID */
typedef UINT8			TaskStateType;		/* �^�X�N���� */
typedef UINT8			ResourceType;		/* ���\�[�XID */
typedef UINT32			EventMaskType;		/* �C�x���g�}�X�N */
typedef UINT32			TickType;			/* �J�E���^�l�i�e�B�b�N�j*/
typedef UINT8			AlarmType;			/* �A���[��ID */
typedef UINT8			AppModeType;		/* �A�v���P�[�V�������[�h */
typedef UINT8			OSServiceIdType;	/* OS�̃T�[�r�XAPI��ID */
typedef UINT8			IsrType;			/* ISR ID�iOSEK�d�l�O�j*/
typedef UINT8			CounterType;		/* �J�E���^ID�iOSEK�d�l�O�j*/

typedef struct {
	TickType maxallowedvalue;	/* �J�E���^�w���̍ő��l */
	TickType ticksperbase;		/* �P�ʂɒB�����܂ł̃e�B�b�N�� */
	TickType mincycle;			/* �T�C�N���w���̍ŏ��l */
} AlarmBaseType;

typedef TaskType		*TaskRefType;
typedef TaskStateType	*TaskStateRefType;
typedef EventMaskType	*EventMaskRefType;
typedef TickType		*TickRefType;
typedef AlarmBaseType	*AlarmBaseRefType;

/*
 *  �J�[�l���I�u�W�F�N�g�錾�p�̃}�N��
 */
#define DeclareTask(TaskName)		extern const TaskType TaskName
#define DeclareResource(ResName)	extern const ResourceType ResName
#define DeclareEvent(EventName)		extern const EventMaskType EventName
#define DeclareAlarm(AlarmName)		extern const AlarmType AlarmName
/* �J�E���^��OSEK�d�l�O	*/
#define DeclareCounter(CounterName)	extern const CounterType CounterName

/*
 *  ���C�����[�`�����`�p�̃}�N��
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
 *  �V�X�e���T�[�r�XAPI�̐錾
 */

/*
 *  �^�X�N�Ǘ��@�\
 */
extern StatusType ActivateTask(TaskType tskid);
extern StatusType TerminateTask(void);
extern StatusType ChainTask(TaskType tskid);
extern StatusType Schedule(void);
extern StatusType GetTaskID(TaskRefType p_tskid);
extern StatusType GetTaskState(TaskType tskid, TaskStateRefType p_state);

/*
 *  �����݊Ǘ��@�\
 */
extern void EnableAllInterrupts(void);
extern void DisableAllInterrupts(void);
extern void ResumeAllInterrupts(void);
extern void SuspendAllInterrupts(void);
extern void ResumeOSInterrupts(void);
extern void SuspendOSInterrupts(void);

/*
 *  ���\�[�X�Ǘ��@�\
 */
extern StatusType GetResource(ResourceType resid);
extern StatusType ReleaseResource(ResourceType resid);

/*
 *  �C�x���g�����@�\
 */
extern StatusType SetEvent(TaskType tskid, EventMaskType mask);
extern StatusType ClearEvent(EventMaskType mask);
extern StatusType GetEvent(TaskType tskid, EventMaskRefType p_mask);
extern StatusType WaitEvent(EventMaskType mask);

/*
 *  �A���[���@�\
 */
extern StatusType GetAlarmBase(AlarmType almid, AlarmBaseRefType p_info);
extern StatusType GetAlarm(AlarmType almid, TickRefType p_tick);
extern StatusType SetRelAlarm(AlarmType almid, TickType incr, TickType cycle);
extern StatusType SetAbsAlarm(AlarmType almid, TickType start, TickType cycle);
extern StatusType CancelAlarm(AlarmType almid);

/*
 *  OS���s�����@�\
 */
extern AppModeType GetActiveApplicationMode(void);
extern void StartOS(AppModeType mode);
extern void ShutdownOS(StatusType ercd);

/*
 *  �J�E���^�����@�\�iOSEK�d�l�O�j
 */
extern StatusType SignalCounter(CounterType cntid);

/*
 *  �R�[���o�b�N
 */
extern void ErrorHook(StatusType ercd);
extern void PreTaskHook(void);
extern void PostTaskHook(void);
extern void StartupHook(void);
extern void ShutdownHook(StatusType ercd);
extern void UserStartupHook(void);

#endif /* _MACRO_ONLY */

/*
 *  OS�̃G���[�R�[�h
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
 *  ���̑��̒萔�l
 */
#define INVALID_TASK		((TaskType) UINT8_INVALID)	/* �����^�X�N */

#define SUSPENDED			((StatusType) 0)	/* �x�~���� */
#define RUNNING				((StatusType) 1)	/* ���s���� */
#define READY				((StatusType) 2)	/* ���s�\���� */
#define WAITING				((StatusType) 3)	/* �҂����� */

#define RES_SCHEDULER		((ResourceType) 0)	/* �X�P�W���[�����\�[�X */

#define OSDEFAULTAPPMODE	((AppModeType) 0x01)
									/* �f�t�H���g�A�v���P�[�V�������[�h */

/*
 *  OS�̃T�[�r�XAPI��ID
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
 *  �G���[�t�b�N�ɓn�������̂��߂̒��`�i���`���e��OSEK�d�l�O�j
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
 *  �}�N���̒��`
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
 *  �o�[�W���������i��ITRON4.0�d�l�ɏ����j
 */
#define	TKERNEL_MAKER	0x0118u		/* �J�[�l���̃��[�J�[�R�[�h */
#define	TKERNEL_PRID	0x0010u		/* �J�[�l���̎��ʔԍ� */
#define	TKERNEL_SPVER	0x0221u		/* OSEK�d�l�̃o�[�W�����ԍ� */
#define	TKERNEL_PRVER	0x1010u		/* �J�[�l���̃o�[�W�����ԍ� */

#endif /* _KERNEL_H_ */
