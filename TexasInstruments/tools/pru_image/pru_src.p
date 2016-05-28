//******************************************************************************
//+--------------------------------------------------------------------------+**
//|                            ****                                          |**
//|                            ****                                          |**
//|                            ******o***                                    |**
//|                      ********_///_****                                   |**
//|                      ***** /_//_/ ****                                   |**
//|                       ** ** (__/ ****                                    |**
//|                           *********                                      |**
//|                            ****                                          |**
//|                            ***                                           |**
//|                                                                          |**
//|         Copyright (c) 1998-2010 Texas Instruments Incorporated           |**
//|                        ALL RIGHTS RESERVED                               |**
//|                                                                          |**
//| Permission is hereby granted to licensees of Texas Instruments           |**
//| Incorporated (TI) products to use this computer program for the sole     |**
//| purpose of implementing a licensee product based on TI products.         |**
//| No other rights to reproduce, use, or disseminate this computer          |**
//| program, whether in part or in whole, are granted.                       |**
//|                                                                          |**
//| TI makes no representation or warranties with respect to the             |**
//| performance of this computer program, and specifically disclaims         |**
//| any responsibility for any damages, special or consequential,            |**
//| connected with the use of this program.                                  |**
//|                                                                          |**
//+--------------------------------------------------------------------------+**
//*****************************************************************************/
// file:   icss_l2_fifo.p
//
// brief:  This file contains sample code to increment a register
//
//
//  (C) Copyright 2010, Texas Instruments, Inc
//
//  author     Amit Chatterjee
//  modified   Baskaran
//
//  version    0.2     Modified
//

    .origin 0
    .entrypoint main

main:
	MOV R3, 0	
INC_LOOP:
	ADD R3, R3, 1
	LDI R0, 22
	MOV R1, 0x20200
    SBBO    R0.w0, R1, 0, 4
	QBA	INC_LOOP
