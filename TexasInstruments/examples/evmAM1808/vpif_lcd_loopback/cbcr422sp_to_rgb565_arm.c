/**
 * \file  cbcr422sp_to_rgb565_arm.c
 *
 * \brief Colorspace conversion from YCbCr422 semi-planar to RGB565 planar.
 *        This function is to be used by the ARM core.
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

#ifdef gcc
#define restrict
#endif

#ifndef _TMS320C6X
void cbcr422sp_to_rgb565_c
(
    const unsigned char *restrict cbcr_src, /* Blue color-difference (B'-Y') */
    unsigned int num_lines,
    unsigned int src_pitch,
    const short coeff[5],                   /* Matrix coefficients. */
    const unsigned char *restrict y_data,   /* Luminence data (Y') */
    unsigned int y_pitch,
    unsigned short *restrict rgb_data,      /* RGB 5:6:5 packed pixel output. */
    unsigned int rgb_pitch,
    unsigned num_pixels                     /* # of luma pixels to process. */
)
{
    int     i,j;                    /* Loop counter                     */
    int     y0, y1;                 /* Individual Y components          */
    int     cb, cr;                 /* Color difference components      */
    int     y0t,y1t;                /* Temporary Y values               */
    int     rt, gt, bt;             /* Temporary RGB values             */
    int     r0, g0, b0;             /* Individual RGB components        */
    int     r1, g1, b1;             /* Individual RGB components        */
    int     r0t,g0t,b0t;            /* Truncated RGB components         */
    int     r1t,g1t,b1t;            /* Truncated RGB components         */
    int     r0s,g0s,b0s;            /* Saturated RGB components         */
    int     r1s,g1s,b1s;            /* Saturated RGB components         */
    unsigned char     *cr_data, *cb_data;
    short   luma = coeff[0];        /* Luma scaling coefficient.        */
    short   r_cr = coeff[1];        /* Cr's contribution to Red.        */
    short   g_cb = coeff[2];        /* Cb's contribution to Green.      */
    short   g_cr = coeff[3];        /* Cr's contribution to Green.      */
    short   b_cb = coeff[4];        /* Cb's contribution to Blue.       */

    unsigned short  rgb0, rgb1;     /* Packed RGB pixel data            */
    unsigned short *restrict rgb_data_p;
    const unsigned char *y_data_p;
    
    /* ---------------------------------------------------------------- */
    /* For each line.                                                   */
    /* ---------------------------------------------------------------- */    
    for (j = 0; j < num_lines; j++)
    {
        /* ----------------------------------------------------------------- */
        /* Iterate for num_pixels/2 iters, since we process pixels in pairs. */
        /* ----------------------------------------------------------------- */
        i = num_pixels >> 1;

        /* ---------------------------------------------------------------- */
        /*  Separate the Cb and Cr value and get the right pointers.        */
        /* ---------------------------------------------------------------- */
        cb_data = (unsigned char *) cbcr_src + j * src_pitch;
        cr_data = (unsigned char *)(cbcr_src + 1) + j * src_pitch;
        y_data_p = (unsigned char *)y_data + j * y_pitch;
        rgb_data_p = (unsigned short *)rgb_data + j * rgb_pitch;

        while (i-->0)
        {
            /* ---------------------------------------------------------------- */
            /*  Read in YCbCr data from the separate data planes.               */
            /*                                                                  */
            /*  The Cb and Cr channels come in biased upwards by 128, so        */
            /*  subtract the bias here before performing the multiplies for     */
            /*  the color space conversion itself.  Also handle Y's upward      */
            /*  bias of 16 here.                                                */
            /* ---------------------------------------------------------------- */

            y0 = *y_data_p++  - 16;
            y1 = *y_data_p++  - 16;

            cb = *cb_data - 128;
            cr = *cr_data - 128;
            
            cb_data +=2;
            cr_data +=2;

            /* ================================================================ */
            /*  Convert YCrCb data to RGB format using the following matrix:    */
            /*                                                                  */
            /*      [ coeff[0] 0.0000   coeff[1] ]   [ Y' -  16 ]     [ R']     */
            /*      [ coeff[0] coeff[2] coeff[3] ] * [ Cb - 128 ]  =  [ G']     */
            /*      [ coeff[0] coeff[4] 0.0000   ]   [ Cr - 128 ]     [ B']     */
            /*                                                                  */
            /*  We use signed Q13 coefficients for the coefficients to make     */
            /*  good use of our 16-bit multiplier.  Although a larger Q-point   */
            /*  may be used with unsigned coefficients, signed coefficients     */
            /*  add a bit of flexibility to the kernel without significant      */
            /*  loss of precision.                                              */
            /* ================================================================ */

            /* ---------------------------------------------------------------- */
            /*  Calculate chroma channel's contribution to RGB.                 */
            /* ---------------------------------------------------------------- */
            rt  = r_cr * (short)cr;
            gt  = g_cb * (short)cb + g_cr * (short)cr;
            bt  = b_cb * (short)cb;

            /* ---------------------------------------------------------------- */
            /*  Calculate intermediate luma values.  Include bias of 16 here.   */
            /* ---------------------------------------------------------------- */
            y0t = luma * (short)y0;
            y1t = luma * (short)y1;
            
            /* ---------------------------------------------------------------- */
            /*  Mix luma, chroma channels.                                      */
            /* ---------------------------------------------------------------- */
            r0  = y0t + rt; r1 = y1t + rt;
            g0  = y0t + gt; g1 = y1t + gt;
            b0  = y0t + bt; b1 = y1t + bt;

            /* ================================================================ */
            /*  At this point in the calculation, the RGB components are        */
            /*  nominally in the format below.  If the color is outside the     */
            /*  our RGB gamut, some of the sign bits may be non-zero,           */
            /*  triggering saturation.                                          */
            /*                                                                  */
            /*                  3     2 2        1 1                            */
            /*                  1     1 0        3 2         0                  */
            /*                 [ SIGN  | COLOR    | FRACTION ]                  */
            /*                                                                  */
            /*  This gives us an 8-bit range for each of the R, G, and B        */
            /*  components.  (The transform matrix is designed to transform     */
            /*  8-bit Y/C values into 8-bit R,G,B values.)  To get our final    */
            /*  5:6:5 result, we "divide" our R, G and B components by 4, 8,    */
            /*  and 4, respectively, by reinterpreting the numbers in the       */
            /*  format below:                                                   */
            /*                                                                  */
            /*          Red,    3     2 2     1 1                               */
            /*          Blue    1     1 0     6 5            0                  */
            /*                 [ SIGN  | COLOR | FRACTION    ]                  */
            /*                                                                  */
            /*                  3     2 2      1 1                              */
            /*          Green   1     1 0      5 4           0                  */
            /*                 [ SIGN  | COLOR  | FRACTION   ]                  */
            /*                                                                  */
            /*  "Divide" is in quotation marks because this step requires no    */
            /*  actual work.  The code merely treats the numbers as having a    */
            /*  different Q-point.                                              */
            /* ================================================================ */

            /* ---------------------------------------------------------------- */
            /*  Shift away the fractional portion, and then saturate to the     */
            /*  RGB 5:6:5 gamut.                                                */
            /* ---------------------------------------------------------------- */
            r0t = r0 >> 16;
            g0t = g0 >> 15;
            b0t = b0 >> 16;
            r1t = r1 >> 16;
            g1t = g1 >> 15;
            b1t = b1 >> 16;

            r0s = r0t < 0 ? 0 : r0t > 31 ? 31 : r0t;
            g0s = g0t < 0 ? 0 : g0t > 63 ? 63 : g0t;
            b0s = b0t < 0 ? 0 : b0t > 31 ? 31 : b0t;
            r1s = r1t < 0 ? 0 : r1t > 31 ? 31 : r1t;
            g1s = g1t < 0 ? 0 : g1t > 63 ? 63 : g1t;
            b1s = b1t < 0 ? 0 : b1t > 31 ? 31 : b1t;

            /* ---------------------------------------------------------------- */
            /*  Merge values into output pixels.                                */
            /* ---------------------------------------------------------------- */
            rgb0 = (r0s << 11) + (g0s <<  5) + (b0s <<  0);
            rgb1 = (r1s << 11) + (g1s <<  5) + (b1s <<  0);

            /* ---------------------------------------------------------------- */
            /*  Store resulting pixels to memory.                               */
            /* ---------------------------------------------------------------- */

            *rgb_data_p++ = rgb0;
            *rgb_data_p++ = rgb1;
        }
    }
    return;
}
#endif
