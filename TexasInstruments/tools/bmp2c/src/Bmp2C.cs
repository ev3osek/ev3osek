///
/// \file  Bmp2C.cs
///
/// \brief Bmp2C class implementation. Converts a 24-bit BMP file into a C
///        array usable by StarterWare applications. Static members only;
///        called by main function in Program.cs.
///
// Copyright (c) 2012, Texas Instruments Inc.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the Texas Instruments Inc. nor the names of its
//       contributors may be used to endorse or promote products derived from
//       this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;


namespace bmp2c
{
    class Bmp2C
    {
        // no constructor; use static members only

        public static void Convert(String input_file_name, String output_file_name, int array_width)
        {
            Bitmap input_bmp;
            System.Drawing.Imaging.BitmapData bmp_data;
            Rectangle image_area;
            Byte[] image_data_rgb24, image_data_rgb16;
            int image_data_size;
            IntPtr ptr;
            System.IO.StreamWriter output_file;
            const String eol = "\r\n";

            // attempt to open input file as bitmap
            input_bmp = new Bitmap(input_file_name);
            image_area = new Rectangle(0, 0, input_bmp.Width, input_bmp.Height);
            Console.WriteLine("Image size is " + input_bmp.Width + " x " + input_bmp.Height);
            Console.WriteLine("Image data format is " + input_bmp.PixelFormat);

            // retrieve data bytes from image 
            bmp_data = input_bmp.LockBits(image_area, System.Drawing.Imaging.ImageLockMode.ReadWrite,
                input_bmp.PixelFormat);

            // Get the address of the first line.
            ptr = bmp_data.Scan0;

            // Declare an array to hold the bytes of the bitmap.
            image_data_size = Math.Abs(bmp_data.Stride) * bmp_data.Height;
            image_data_rgb24 = new Byte[image_data_size];
            Console.WriteLine("Original image data size is " + image_data_size + " bytes");
            
            // Copy the RGB values into the array.
            System.Runtime.InteropServices.Marshal.Copy(ptr, image_data_rgb24, 0, image_data_size);

            // unlock image data
            input_bmp.UnlockBits(bmp_data);

            // convert data to rgb16 if necessary
            switch (input_bmp.PixelFormat)
            {
                case System.Drawing.Imaging.PixelFormat.Format24bppRgb:
                    image_data_rgb16 = new Byte[input_bmp.Width * input_bmp.Height * 2];
                    convert24to16(image_data_rgb24, image_data_rgb16, input_bmp.Width * input_bmp.Height);
                    Console.WriteLine("Resampled image data size is " + input_bmp.Width * input_bmp.Height * 2 + " bytes");
                    break;

                case System.Drawing.Imaging.PixelFormat.Format16bppRgb565:
                    // image already in 16-bit format
                    image_data_rgb16 = image_data_rgb24;
                    break;

                default:
                    throw new Exception("Unsupported image type! Input must be a 16- or 24-bit bitmap.");
            }

            // initialize output file contents
            if (System.IO.File.Exists(output_file_name))
                System.IO.File.Delete(output_file_name);
            output_file = System.IO.File.AppendText(output_file_name);
            Console.WriteLine("Output file opened for writing...");
            
            output_file.Write("const unsigned " + (array_width == 8 ? "char" : "short") + " image[] ="
                + eol + "{" + eol);

            // write image data to output file
            switch (array_width)
            {
                case 8:
                    output_file.Write("    IMAGE_FMT_16BPP_UNCOMP," + eol +
                        "    " + (image_area.Width & 0xff) + ", " + ((image_area.Width >> 8) & 0xff) + "," + eol +
                        "    " + (image_area.Height & 0xff) + ", " + ((image_area.Height >> 8) & 0xff) + "," + eol + 
                        "    ");
                    for (int i = 0; i < input_bmp.Width * input_bmp.Height * 2; i++)
                    {
                        output_file.Write("0x" + byte2string(image_data_rgb16[i]) + ",");
                        if (((i + 1) % 16 == 0) && (i < input_bmp.Width * input_bmp.Height * 2 - 1))
                            output_file.Write(eol + "    ");
                    }
                    break;

                case 16:
                    output_file.Write("    /* palette data */" + eol +
                        "    0x4000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000," +
                        "0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000," + eol +
                        "    /* image data   */" + eol +
                        "    ");
                    for (int i = 0; i < input_bmp.Width * input_bmp.Height * 2; i+=2)
                    {
                        output_file.Write("0x" + byte2string(image_data_rgb16[i + 1]) +
                            byte2string(image_data_rgb16[i]) + ",");
                        if (((i + 2) % 32 == 0) && (i < input_bmp.Width * input_bmp.Height * 2 - 1))
                            output_file.Write(eol + "    ");
                    }
                    break;
            }

            // finalize output file
            output_file.Write(eol + "};" + eol);
            output_file.Close();
        }

        private static String byte2string(byte val)
        {
            String str = System.Convert.ToString(val, 16);
            
            if (val <= 0xf) return "0" + str;
            else return str;
        }

        private static void convert24to16(byte[] image_data_rgb24, byte[] image_data_rgb16, int pixels)
        {
            byte r, g, b;
            // RGB24: RRRRRRRR GGGGGGGG BBBBBBBB
            // RGB16: GGGRRRRR BBBBBGGG
            // (little endian)
            for (int i = 0; i < pixels; i++)
            {
                r = (byte)(image_data_rgb24[i * 3] >> 3);
                g = (byte)(image_data_rgb24[i * 3 + 1] >> 2);
                b = (byte)(image_data_rgb24[i * 3 + 2] >> 3);
                image_data_rgb16[i * 2] = (byte)(r + ((g & 0x7) << 5));
                image_data_rgb16[i * 2 + 1] = (byte)((g >> 3) + (b << 3));
            }
        }
    }
}
