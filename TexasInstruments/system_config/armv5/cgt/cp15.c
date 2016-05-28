/**
 * \file  cp15.c
 *
 * \brief This file contains the API definitions for configuring coprocessor
 *        register.
 */

/*
* Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
*
*    Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
*
*    Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the
*    documentation and/or other materials provided with the
*    distribution.
*
*    Neither the name of Texas Instruments Incorporated nor the names of
*    its contributors may be used to endorse or promote products derived
*    from this software without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

asm("INV_TLB   .word 0x55555555");

/******************************************************************************
**                   FUNCTION DEFINITIONS
******************************************************************************/
/**
* \brief      This API disable the Instruction cache.
*
* \param      None.
*
* \return     None.
*
**/
void CP15ICacheDisable(void)
{
    asm("    mrc     p15, #0, r0, c1, c0, #0\n\t"
        "    bic     r0,  r0, #0x00001000\n\t"
        "    mcr     p15, #0, r0, c1, c0, #0");
}

/**
* \brief      This API disable the Data cache.
*
* \param      None.
*
* \return     None.
*
**/
void CP15DCacheDisable(void)
{
    asm("    mrc     p15, #0, r0, c1, c0, #0\n\t"
        "    bic     r0,  r0, #0x00000004\n\t"
        "    mcr     p15, #0, r0, c1, c0, #0");
}

/**
* \brief      This API Enables the Instruction cache.
*
* \param      None.
*
* \return     None.
*
**/
void CP15ICacheEnable(void)
{
    asm("    mrc     p15, #0, r0, c1, c0, #0\n\t"
        "    orr     r0,  r0, #0x00001000 \n\t"
        "    mcr     p15, #0, r0, c1, c0, #0 \n\t");
}

/**
* \brief      This API Enables the Data cache.
*
* \param      None.
*
* \retiurn     None.
* 
* Note: MMU shall be enabled before enabling D-Cache
**/
void CP15DCacheEnable(void)
{
    asm("    mrc     p15, #0, r0, c1, c0, #0\n\t"
        "    orr     r0,  r0, #0x00000004\n\t"
        "    mcr     p15, #0, r0, c1, c0, #0");
}

/**
* \brief      This API Invalidates data cache.
*
* \param      None.
*
* \return     None.
*
**/
void CP15DCacheFlush(void)
{
    asm( "   mov     r0, #0\n\t"   
         "   mcr     p15, #0, r0, c7, c6, #0\n\t");
}

/**
* \brief      This API cleans the D-Cache. The cleaning of D-Cache is done
*             using the test clean command
*
* \param      None.
*
* \return     None.
*
**/
void CP15DCacheClean(void)
{
    asm( "clean: \n\t"
    	 "		mrc    p15, #0, r15, c7, c10, #3\n\t"
         "		bne clean\n\t");
}
/**
* \brief      This API cleans and flushes the D-Cache. This is done  using the
*             test clean command
*
* \param      None.
*
* \return     None.
*
**/
void CP15DCacheCleanFlush(void)
{
    asm( "cleanflush: \n\t"
    	 "		mrc    p15, #0, r15, c7, c14, #3\n\t"
         "		bne cleanflush\n\t");
}

/**
* \brief      This API Invalidates Instruction cache.
*
* \param      None.
*
* \return     None.
*
**/
void CP15ICacheFlush(void)
{
    asm("    mov     r0, #0\n\t" 
        "    mcr     p15, #0, r0, c7, c5, #0\n\t");
}

/**
* \brief      Flushes cache lines corresponding to the buffer pointer
*             upto the specified length.
*
* \param      Buffer Pointer     1st parameter; Buffer start address
* \param      Buffer Size    2nd parameter; Size of the buffer in bytes
*
* \return     None.
*
**/
__asm("    .sect \".text:CP15ICacheFlushBuff\"\n"
          "    .clink\n"
          "    .global CP15ICacheFlushBuff\n"
          "CP15ICacheFlushBuff:\n"
          "    bic      r2, r0, #0x1F\n"
          "    add      r0, r1, r0\n"
          "    mov      r1, r2\n"
          "    b        FlushBuffChk\n"
          "FlushBuffLoop:\n"
          "    mcr p15, #0, r1, c7, c6, #1\n"
          "    add      r1, r1, #32\n"
          "FlushBuffChk:\n"
          "    cmp      r1, r0\n"
          "    blt      FlushBuffLoop\n"
          "    bx       lr\n");

/**
* \brief      Cleans the D-cache lines corresponding to the buffer pointer
*             upto the specified length.
*
* \param      Buffer Pointer     1st parameter; Buffer start address
* \param      Buffer Size    2nd parameter; Size of the buffer in bytes
*
* \return     None.
*
**/
__asm("    .sect \".text:CP15DCacheCleanBuff\"\n"
          "    .clink\n"
          "    .global CP15DCacheCleanBuff\n"
          "CP15DCacheCleanBuff:\n"
          "    bic      r2, r0, #0x1F\n"
          "    add      r0, r1, r0\n"
          "    mov      r1, r2\n"
          "    b        CleanBuffChk\n"
          "CleanBuffLoop:\n"
          "    mcr p15, #0, r1, c7, c10, #1\n"
          "    add      r1, r1, #32\n"
          "CleanBuffChk:\n"
          "    cmp      r1, r0\n"
          "    blt      CleanBuffLoop\n"
          "    bx       lr\n");

/**
 * \brief     This API Configures translation table base register with
 *            with page table starting address.
 *
 * \param     ttb  is the starting address of the pageTable.
 *
 * \return    None.
 *
 *  Note : Page Table starting address should be aligned to 16k.
 **/
__asm("    .sect \".text:CP15TtbSet\"\n"
          "    .clink\n"
          "    .global CP15TtbSet\n"
          "CP15TtbSet:\n"
          "    mov r1, #0\n"
          "    mcr p15, #0, r1, c8, c7, #0\n"
          "    ldr r1, [r15, #8]\n"
          "    mcr p15, #0, r1, c3, c0, #0\n"
          "     mcr p15, #0, r0, c2, c0, #0\n"
          "    bx       lr\n"
          "    .word 0x55555555\n");


/**
 * \brief     This API disables the MMU.
 *
 * \param     None.
 *
 * \return    None.
 *
 **/
void CP15MMUDisable(void)
{
    asm("    mov r0, #0\n\t"
        "    mcr p15, #0, r0, c8, c7, #0\n\t"
        "    mrc p15, #0, r0, c1, c0, #0\n\t"
        "    mov r1, #0x1\n\t"       
        "    bic r0, r0, r1\n\t"        
        "    mcr p15, #0, r0, c1, c0, #0\n\t");
}

/**
 * \brief     This API enables the MMU.
 *
 * \param     None.
 *
 * \return    None.
 *
 **/
void CP15MMUEnable(void)
{
    asm("    mrc p15, #0, r0, c1, c0, #0\n\t"
        "    orr r0, r0, #0x00000001\n\t"
        "    mcr p15, #0, r0, c1, c0, #0\n\t");
}

/********************************* End Of File *******************************/
