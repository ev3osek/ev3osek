================================================================================
 README.txt - bmp2c.exe
 
 November 9, 2011
--------------------------------------------------------------------------------
This file describes the bmp2c utility that is distributed as part of
StarterWare.  This application is used to convert 24-bit bitmap images into C-
language arrays of pixel data in 16-bit format (5:6:5) that is used by the LCDC.
To run bmp2c, you will need the .NET or Mono framework installed on your PC.
--------------------------------------------------------------------------------
Usage

1.  Create an image using the image editing software of your choice.

2.  Save your image in 24-bit BMP format (8:8:8).

3.  Run the bmp2c utility to convert your application into 16-bit format:

        bmp2c.exe [-8|-16] <input file name (*.bmp)> <output file name (*.c)>

    Note: the optional -8 or -16 arguments will make the generated C source file
    format itself as a byte or short array.  The default behavior is -8.

4.  Use the generated source file directly in your application or copy out the
    relevant portion of the data array.
    
    Note: In 16-bit mode, the generated array contains the palette bytes
    required by the LCDC for direct usage (i.e. raster example).
    
    Note: In 8-bit mode, the first 4 bytes specify the image width and height
    as expected by some grlib APIs.

--------------------------------------------------------------------------------
Known Issues

(none)

--------------------------------------------------------------------------------
End of README.TXT