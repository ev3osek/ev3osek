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
 *  ��L���쌠�҂́C�ȉ��� (1)�`(4) �̏������CFree Software Foundation 
 *  �ɂ���Č��\����Ă��� GNU General Public License �� Version 2 �ɋL
 *  �q����Ă�������𖞂����ꍇ�Ɍ���C�{�\�t�g�E�F�A�i�{�\�t�g�E�F�A
 *  �����ς������̂��܂ށD�ȉ������j���g�p�E�����E���ρE�Ĕz�z�i�ȉ��C
 *  ���p�ƌĂԁj���邱�Ƃ𖳏��ŋ�������D
 *  (1) �{�\�t�g�E�F�A���\�[�X�R�[�h�̌`�ŗ��p����ꍇ�ɂ́C��L�̒���
 *      ���\���C���̗��p��������щ��L�̖��ۏ؋K�肪�C���̂܂܂̌`�Ń\�[
 *      �X�R�[�h���Ɋ܂܂�Ă��邱�ƁD
 *  (2) �{�\�t�g�E�F�A���C���C�u�����`���ȂǁC���̃\�t�g�E�F�A�J���Ɏg
 *      �p�ł���`�ōĔz�z����ꍇ�ɂ́C�Ĕz�z�ɔ����h�L�������g�i���p
 *      �҃}�j���A���Ȃǁj�ɁC��L�̒��쌠�\���C���̗��p��������щ��L
 *      �̖��ۏ؋K����f�ڂ��邱�ƁD
 *  (3) �{�\�t�g�E�F�A���C�@��ɑg�ݍ��ނȂǁC���̃\�t�g�E�F�A�J���Ɏg
 *      �p�ł��Ȃ��`�ōĔz�z����ꍇ�ɂ́C���̂����ꂩ�̏����𖞂�����
 *      �ƁD
 *    (a) �Ĕz�z�ɔ����h�L�������g�i���p�҃}�j���A���Ȃǁj�ɁC��L�̒�
 *        �쌠�\���C���̗��p��������щ��L�̖��ۏ؋K����f�ڂ��邱�ƁD
 *    (b) �Ĕz�z�̌`�Ԃ��C�ʂɒ�߂���@�ɂ���āCTOPPERS�v���W�F�N�g��
 *        �񍐂��邱�ƁD
 *  (4) �{�\�t�g�E�F�A�̗��p�ɂ�蒼�ړI�܂��͊ԐړI�ɐ����邢���Ȃ鑹
 *      �Q������C��L���쌠�҂����TOPPERS�v���W�F�N�g��Ɛӂ��邱�ƁD
 * 
 *  �{�\�t�g�E�F�A�́C���ۏ؂Œ񋟂���Ă�����̂ł���D��L���쌠�҂�
 *  ���TOPPERS�v���W�F�N�g�́C�{�\�t�g�E�F�A�Ɋւ��āC���̓K�p�\����
 *  �܂߂āC�����Ȃ�ۏ؂��s��Ȃ��D�܂��C�{�\�t�g�E�F�A�̗��p�ɂ�蒼
 *  �ړI�܂��͊ԐړI�ɐ����������Ȃ鑹�Q�Ɋւ��Ă��C���̐ӔC�𕉂�Ȃ��D
 * 
 */

/*
 *	�^�X�N�Ǘ��@�\
 */

#include "osek_kernel.h"
#include "check.h"
#include "task.h"
#include "resource.h"
#include "stdio.h"

/*
 *  �^�X�N�̋N��
 */
StatusType
ActivateTask(TaskType tskid)
{
	StatusType	ercd = E_OK;

	LOG_ACTTSK_ENTER(tskid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_TSKID(tskid);
        
	lock_cpu();
	if (tcb_tstat[tskid] == TS_DORMANT) {
		if ((make_active(tskid)) && (callevel == TCL_TASK)) {
			dispatch();
		}
	}
	else if (tcb_actcnt[tskid] < tinib_maxact[tskid]) {
		tcb_actcnt[tskid] += 1;
	}
	else {
		ercd = E_OS_LIMIT;
		goto d_error_exit;
	}
  exit:
	unlock_cpu();
	LOG_ACTTSK_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.tskid = tskid;
	call_errorhook(ercd, OSServiceId_ActivateTask);
	goto exit;
}

/*
 *  ���^�X�N�̏I��
 */
StatusType
TerminateTask(void)
{
	StatusType	ercd = E_OK;

	LOG_TERTSK_ENTER();
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);

	lock_cpu();
	/*
	 *  �������\�[�X�̉���͗D��x�������邾���Ȃ̂ŁC�����ł�
	 *  �������Ȃ��Ă悢�D
	 */
	tcb_tstat[runtsk] = TS_DORMANT;
	search_schedtsk();
	if (tcb_actcnt[runtsk] > 0) {
		tcb_actcnt[runtsk] -= 1;
		(void)make_active(runtsk);
	}
	exit_and_dispatch();
	/* �����ɂ͖߂��Ă��Ȃ� */

  error_exit:
	lock_cpu();
	call_errorhook(ercd, OSServiceId_TerminateTask);
	unlock_cpu();
	LOG_TERTSK_LEAVE(ercd);
	return(ercd);
}

/*
 *  ���^�X�N�̏I���ƃ^�X�N�̋N��
 */
StatusType
ChainTask(TaskType tskid)
{
	/*
	 *  �����ł� ercd �̏������͖{���͕s�v�ł��邪�C�R���p�C���̌x
	 *  �����b�Z�[�W������邽�߂ɏ��������Ă���D
	 */
	StatusType	ercd = E_OK;

	LOG_CHNTSK_ENTER(tskid);
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);
	CHECK_TSKID(tskid);

	lock_cpu();
	if (tskid == runtsk) {
		search_schedtsk();
		(void)make_active(runtsk);
	}
	else {
		/*
		 *  �G���[���ɕ���p���c��Ȃ��悤�ɁC�G���[�`�F�b�N��
		 *  �^�X�N�I�������̑O�ɍs���K�v������D
		 */
		if ((tcb_tstat[tskid] != TS_DORMANT)
			&& (tcb_actcnt[tskid] >= tinib_maxact[tskid])) {
			ercd = E_OS_LIMIT;
			goto d_error_exit;
		}
		tcb_tstat[runtsk] = TS_DORMANT;
		search_schedtsk();
		if (tcb_actcnt[runtsk] > 0) {
			tcb_actcnt[runtsk] -= 1;
			(void)make_active(runtsk);
		}
		if (tcb_tstat[tskid] == TS_DORMANT) {
			(void)make_active(tskid);
		}
		else {
			tcb_actcnt[tskid] += 1;
		}
	}
	exit_and_dispatch();
	/* �����ɂ͖߂��Ă��Ȃ� */

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.tskid = tskid;
	call_errorhook(ercd, OSServiceId_ChainTask);
	unlock_cpu();
	LOG_CHNTSK_LEAVE(ercd);
	return(ercd);
}

/*
 *  �X�P�W���[���̌Ăяo��
 */
StatusType
Schedule(void)
{
	/*
	 *  �����ł� ercd �̏������͖{���͕s�v�ł��邪�C�R���p�C���̌x
	 *  �����b�Z�[�W������邽�߂ɏ��������Ă���D
	 */
	StatusType	ercd = E_OK;

	LOG_SCHED_ENTER();
	CHECK_CALLEVEL(TCL_TASK);
	CHECK_RESOURCE(tcb_lastres[runtsk] == RESID_NULL);

	lock_cpu();
	if (tinib_inipri[runtsk] < nextpri) {
		tcb_curpri[runtsk] = tinib_inipri[runtsk];
		preempt();
		dispatch();
		tcb_curpri[runtsk] = tinib_exepri[runtsk];
	}
  exit:
	unlock_cpu();
	LOG_SCHED_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
	call_errorhook(ercd, OSServiceId_Schedule);
	goto exit;
}

/*
 *  ���s��Ԃ̃^�X�NID�̎Q��
 */
StatusType
GetTaskID(TaskRefType p_tskid)
{
	StatusType	ercd = E_OK;

	LOG_GETTID_ENTER(p_tskid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2 | TCL_ERROR | TCL_PREPOST);

	lock_cpu();
	*p_tskid = runtsk;
	/*
	 *  �{���� runtsk �ł͂Ȃ��ȉ��̎��ɂȂ�ׂ������CTSKID_NULL 
	 *  �� INVALID_TASK �͓������̂ŁC�P�� runtsk �ł悢�D
	 *      (runtsk == TSKID_NULL) ? INVALID_TASK : runtsk
	 */
  exit:
	unlock_cpu();
	LOG_GETTID_LEAVE(ercd, *p_tskid);
	return(ercd);

  error_exit:
	lock_cpu();
	call_errorhook(ercd, OSServiceId_GetTaskID);
	goto exit;

}

/*
 *  �^�X�N��Ԃ̎Q��
 */
StatusType
GetTaskState(TaskType tskid, TaskStateRefType p_state)
{
	StatusType	ercd = E_OK;

	LOG_GETTST_ENTER(tskid, p_state);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2 | TCL_ERROR | TCL_PREPOST);
	CHECK_TSKID(tskid);

	lock_cpu();
	*p_state = (tskid == runtsk) ? RUNNING : tcb_tstat[tskid];
  exit:
	unlock_cpu();
	LOG_GETTST_LEAVE(ercd, *p_state);
	return(ercd);

  error_exit:
	lock_cpu();
	_errorhook_par1.tskid = tskid;
	_errorhook_par2.p_state = p_state;
	call_errorhook(ercd, OSServiceId_GetTaskState);
	goto exit;
}
/*
 *Function that checks if dispatching after ISR_type2 is necessary.
 */

extern TaskType runtsk;
extern TaskType schedtsk;


static volatile unsigned long shouldDispatch = 0;
volatile unsigned int addrShouldDispatch = (unsigned int) &shouldDispatch;

void SetDispatch(void){
	if (runtsk != INVALID_TASK && runtsk != schedtsk){ // If runtsk is INVALID_TASK we are in idle mode and therefore will schedule automatically
		shouldDispatch = 1;
	} // Flag to indicate that after we return from the ISR we need to dispatch the current task (will be checked in IRQ Handler)
}
