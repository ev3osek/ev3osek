================================================================================
 README.txt - out2rprc.exe
 
 November 16, 2011
--------------------------------------------------------------------------------
This file describes the out2rprc utility that is distributed as part of
StarterWare.  This application is used to convert application .out files into a
binary format that can be loaded by the StarterWare bootloader utility.  To run
out2rprc, you will need the .NET or Mono framework installed on your PC.
--------------------------------------------------------------------------------
Usage

1.  Use CCS or make to build your application.  For compatibility with the
    bootloader utilty, do not place any initialized sections in L3RAM.

2.  Run the out2rprc utility convert your application into binary format:

        out2rprc.exe <input file name (*.out)> <output file name (*.bin)>
    
    Note: Application images in both COFF and ELF formats are supported.
    
    Optionally, you can specify two applications to create a combined binary
    image:
    
        out2rprc.exe <app 1 (*.out)> <app 2 (*.out)> <output file name (*.bin)>
          
    This can be particularly useful for ARM+DSP devices.  Note that the first
    application will be run by the core that normally serves as the device boot
    master.  For example, the ARM application must be specified first for
    OMAP-L138.  On OMAP-L138, the bootloader will automatically wake up the DSP
    and set it to run its own application (i.e. the second *.out file) as part
    of the boot process.
    
    The out2rprc utility only checks whether or not INITIALIZED SECTIONS of the
    applications overlap in memory.  Uninitialized sections can still cause
    contention after boot, so be careful to properly setup the application
    memory maps.

3.  Flash the bootloader utility AIS file and your application binary using the
    serial flasher (SFH) utility:

        sfh_OMAP-L138.exe -flash <bootloader (*.ais)> <application (*.bin)>
    
    Note: For a C6748 device, you must also use the "-targetType C6748" option
    with the SFH utility.

--------------------------------------------------------------------------------
Known Issues

(none)

--------------------------------------------------------------------------------
End of README.TXT