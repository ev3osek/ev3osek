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
 *	���\�[�X�Ǘ��@�\
 */

#include "osek_kernel.h"
#include "check.h"
#include "task.h"
#include "interrupt.h"
#include "resource.h"

/*
 *  ���\�[�X�Ǘ��@�\�̏�����
 */
void
resource_initialize(void)
{
	ResourceType	resid;

	for (resid = 0; resid < tnum_resource; resid++) {
		rescb_prevpri[resid] = TPRI_NULL;
	}
}

/*
 *  ���\�[�X�̊l��
 */
StatusType
GetResource(ResourceType resid)
{
	StatusType	ercd = E_OK;
	Priority	ceilpri, curpri;

	LOG_GETRES_ENTER(resid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_RESID(resid);

	ceilpri = resinib_ceilpri[resid];
	if (callevel == TCL_TASK) {
		CHECK_ACCESS(tinib_inipri[runtsk] <= ceilpri);

		lock_cpu();
		D_CHECK_ACCESS(rescb_prevpri[resid] == TPRI_NULL);
		curpri = tcb_curpri[runtsk];
		rescb_prevpri[resid] = curpri;
		rescb_prevres[resid] = tcb_lastres[runtsk];
		tcb_lastres[runtsk] = resid;
		if (ceilpri > curpri) {
			tcb_curpri[runtsk] = ceilpri;
			if (ceilpri >= TPRI_MINISR) {
				set_ipl(ceilpri - TPRI_MINISR);
			}
		}
	}
	else {
		CHECK_ACCESS(isrinib_intpri[runisr] <= ceilpri);

		lock_cpu();
		D_CHECK_ACCESS(rescb_prevpri[resid] == TPRI_NULL);
		curpri = current_ipl() + TPRI_MINISR;
		rescb_prevpri[resid] = curpri;
		rescb_prevres[resid] = isrcb_lastres[runisr];
		isrcb_lastres[runisr] = resid;
		if (ceilpri > curpri) {
			set_ipl(ceilpri - TPRI_MINISR);
		}
	}
  exit:
	unlock_cpu();
	LOG_GETRES_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
  d_error_exit:
	_errorhook_par1.resid = resid;
	call_errorhook(ercd, OSServiceId_GetResource);
	goto exit;
}

/*
 *  ���\�[�X�̕ԋp
 */
StatusType
ReleaseResource(ResourceType resid)
{
	StatusType	ercd = E_OK;

	LOG_RELRES_ENTER(resid);
	CHECK_CALLEVEL(TCL_TASK | TCL_ISR2);
	CHECK_RESID(resid);

	if (callevel == TCL_TASK) {
		CHECK_ACCESS(tinib_inipri[runtsk] <= resinib_ceilpri[resid]);
		CHECK_NOFUNC(tcb_lastres[runtsk] == resid);

		lock_cpu();
		if (rescb_prevpri[resid] >= TPRI_MINISR) {
			set_ipl(rescb_prevpri[resid] - TPRI_MINISR);
		}
		else{
			if (tcb_curpri[runtsk] >= TPRI_MINISR) {
				set_ipl(IPL_ENA_ALL);
			}
		}
		tcb_curpri[runtsk] = rescb_prevpri[resid];
		tcb_lastres[runtsk] = rescb_prevres[resid];
		rescb_prevpri[resid] = TPRI_NULL;
			if (tcb_curpri[runtsk] < nextpri) { 
		preempt(); 
		dispatch(); 
    } 
	}
	else {
		CHECK_ACCESS(isrinib_intpri[runisr] <= resinib_ceilpri[resid]);
		CHECK_NOFUNC(isrcb_lastres[runisr] == resid);

		lock_cpu();
		set_ipl(rescb_prevpri[resid] - TPRI_MINISR);
		isrcb_lastres[runisr] = rescb_prevres[resid];
		rescb_prevpri[resid] = TPRI_NULL;
	}
  exit:
	unlock_cpu();
	LOG_RELRES_LEAVE(ercd);
	return(ercd);

  error_exit:
	lock_cpu();
	_errorhook_par1.resid = resid;
	call_errorhook(ercd, OSServiceId_ReleaseResource);
	goto exit;
}
