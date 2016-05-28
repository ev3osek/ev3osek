///
/// \file  Program.cs
///
/// \brief Main function for bmp2c console application, which is used to
///        convert 24-bit BMP images into C arrays usable by StarterWare
///        applications.
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

namespace bmp2c
{
    class Program
    {
        static void Main(string[] args)
        {
            String input_file_name, output_file_name;
            int array_width = 8;

            // check usage
            if (args.Length != 2 && args.Length != 3)
            {
                Console.WriteLine("Usage:");
                Console.WriteLine("bmp2c.exe [-8|-16] <input file (BMP)> <output file (C array)>");
                Console.WriteLine("    -8:  Write output as byte array (default)");
                Console.WriteLine("    -16: Write output as short array");
                return;
            }

            if (args.Length == 3 && args[0] == "-16")
                array_width = 16;
            input_file_name = args[args.Length - 2];
            output_file_name = args[args.Length - 1];

            // convert file to RPRC binary format
            try
            {
                Bmp2C.Convert(input_file_name, output_file_name, array_width);
                Console.WriteLine("File conversion complete!");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Encountered exception:");
                Console.WriteLine(ex.Message);
            }
        }
    }
}
