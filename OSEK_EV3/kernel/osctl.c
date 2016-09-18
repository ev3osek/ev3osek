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
 *	���s�����@�\
 */

#include "osek_kernel.h"
#include "check.h"
#include "interrupt.h"
#include "stdio.h"
#include "init.h"

// Provided by ECRobot (osek_hook.c) and copied here to remove external reference
void StartupHook(void) {
    leJOS_init();
	UserStartupHook();
}

#ifndef PRETASKHOOK
void PreTaskHook(void){}
#endif
#ifndef POSTTASKHOOK
void PostTaskHook(void){}
#endif
#ifndef ERRORHOOK
void ErrorHook(StatusType ercd){}
#endif
#ifndef SHUTDOWNHOOK
void ShutdownHook(StatusType ercd){}
#endif
#ifndef STARTUPHOOK
void UserStartupHook(void){}
#endif

/*
 *  OS���s�����̂��߂̕ϐ�
 */
UINT8		callevel;		/* ���s���̃R���e�L�X�g */
AppModeType	appmode;		/* �A�v���P�[�V�������[�h */

/*
 *  �G���[�t�b�N�ɓn���������i�[�����ϐ�
 */
OSServiceIdType	_errorhook_svcid;
_ErrorHook_Par	_errorhook_par1, _errorhook_par2, _errorhook_par3;

/*
 *  �G���[�t�b�N�̌Ăяo��
 */
void
call_errorhook(StatusType ercd, OSServiceIdType svcid)
{
	UINT8	saved_callevel;
	IPL	saved_ipl;
	volatile FP	errorhook_adr;
	
	/*
	 *  C�����̋K�i�ł͊֐��̃A�h���X��0�ɂȂ��Ȃ��Ƃ����O�񂩂�,
	 *  �R���p�C���̍œK���ɂ���ErrorHook�̃A�h���X���蕪����
	 *  �폜�����Ă��܂��ꍇ�����邽��, volatile�w�肵�����[�J���ϐ���
	 *  �A�h���X���������Ă��画�肵�Ă����D
	*/
	errorhook_adr = (FP)ErrorHook;
	
	if (sus_all_cnt > 0) {
		if ((errorhook_adr != NULL) && (callevel != TCL_ERROR)) {
			_errorhook_svcid = svcid;
			ErrorHook(ercd);
		}
		ShutdownOS(E_OS_CALLEVEL);	/* �񕜕s�\ */
	}
	else {
		if (( errorhook_adr != NULL) && (callevel != TCL_ERROR)) {
			_errorhook_svcid = svcid;
			saved_callevel = callevel;
			callevel = TCL_ERROR;
			saved_ipl = current_ipl();
			if (saved_ipl < ipl_maxisr2) {
				set_ipl(ipl_maxisr2);
			}
			unlock_cpu();
			ErrorHook(ercd);
			lock_cpu();
			if (saved_ipl < ipl_maxisr2) {
				set_ipl(saved_ipl);
			}
			callevel = saved_callevel;	
		}
	}
}

/*
 *  �|�X�g�^�X�N�t�b�N�̌Ăяo��
 */
void
call_posttaskhook(void)
{
	callevel = TCL_PREPOST;
	set_ipl(ipl_maxisr2);
	unlock_cpu();
	PostTaskHook();
	lock_cpu();
	set_ipl(IPL_ENA_ALL);
	callevel = TCL_TASK;	
}

/*
 *  �v���^�X�N�t�b�N�̌Ăяo��
 */
void
call_pretaskhook(void)
{
	callevel = TCL_PREPOST;
	set_ipl(ipl_maxisr2);
	unlock_cpu();
	PreTaskHook();
	lock_cpu();
	set_ipl(IPL_ENA_ALL);
	callevel = TCL_TASK;	
}

/*
 *  ���݂̃A�v���P�[�V�������[�h�̎擾
 */
AppModeType
GetActiveApplicationMode(void)
{
	AppModeType	mode;

	LOG_GETAAM_ENTER();
	mode = appmode;
	LOG_GETAAM_LEAVE(mode);
	return(mode);
}

/*
 *  OS�̋N��
 */
void
StartOS(AppModeType mode)
{
	volatile FP startuphook_adr;

	LOG_STAOS_ENTER(mode);

	/*
	 *  �A�v���P�[�V�������[�h�̐ݒ�
	 */
	appmode = mode;

	/*
	 *  �^�[�Q�b�g�ˑ��̏�����
	 */
	cpu_initialize();
	sys_initialize();
	tool_initialize();

	/*
	 *  �e���W���[���̏�����
	 */
	object_initialize();

	/*
	 *  StartupHook �̌Ăяo��
	 *  
	 *  C�����̋K�i�ł͊֐��̃A�h���X��0�ɂȂ��Ȃ��Ƃ����O�񂩂�,
	 *  �R���p�C���̍œK���ɂ���StartupHook�̃A�h���X���蕪����
	 *  �폜�����Ă��܂��ꍇ�����邽��, volatile�w�肵�����[�J���ϐ���
	 *  �A�h���X���������Ă��画�肵�Ă����D
	 *
	 */
	startuphook_adr = (FP)StartupHook;
	
	if (startuphook_adr != NULL) {
		/*
		 *  StartupHook �̒��ŁCSuspendAllInterrupts ���Ă΂�
		 *  �Ă������v�Ȃ悤�ɁCsus_all_cnt �����[���ɂ��Ă����D
		 */
		callevel = TCL_STARTUP;
		sus_all_cnt++;
		StartupHook();
		sus_all_cnt--;
	}
	callevel = TCL_TASK;

	LOG_STAOS_LEAVE();

	start_dispatch();
}

/*
 *  OS�̏I��
 */
void
ShutdownOS(StatusType ercd)
{
	volatile FP shutdownhook_adr;

	LOG_STUTOS_ENTER(ercd);

	/*
	 *  ���ׂĂ̊����݂��֎~����
	 */
        IntGlobalDisable();

	/*
	 *  ShutdownHook �̌Ăяo��
	 *  
	 *  C�����̋K�i�ł͊֐��̃A�h���X��0�ɂȂ��Ȃ��Ƃ����O�񂩂�,
	 *  �R���p�C���̍œK���ɂ���ShutdownHook�̃A�h���X���蕪����
	 *  �폜�����Ă��܂��ꍇ�����邽��, volatile�w�肵�����[�J���ϐ���
	 *  �A�h���X���������Ă��画�肵�Ă����D
	 */
	 
	 shutdownhook_adr = (FP)ShutdownHook;
	 
	if (shutdownhook_adr != NULL) {
		/*
		 *  ShutdownHook �̒��ŁCSuspendAllInterrupts ���Ă΂�
		 *  �Ă������v�Ȃ悤�ɁCsus_all_cnt �����[���ɂ��Ă����D
		 */
		callevel = TCL_SHUTDOWN;
		sus_all_cnt++;
		ShutdownHook(ercd);
		sus_all_cnt--;
	}

	LOG_STUTOS_LEAVE();

	/*
	 *  �^�[�Q�b�g�ˑ��̏I������
	 */
	cpu_terminate();
	sys_exit();
}


