================================================================================
 README.txt - AISgen GUI for d800k008/6/4/2 Bootloader
 
 July 7, 2011
--------------------------------------------------------------------------------
This file lists changes between versions of the AISgen GUI.  For information
on how to use the GUI, please see the application reports on your device's
webpage on www.ti.com.
--------------------------------------------------------------------------------
Changes in version 1.9

Bug Fixes
---------
-> Added a check to prevent users from enabling PSC1 module 8.  This module
   requires a forced transition that is not supported by the bootloader.

Enhancements
------------
-> Added support for d800k008 ROM bootloader.  Selected by default in
   "device type" drop down box.
-> Added support for MMC/SD0 boot mode (d800k008 ROM only)


--------------------------------------------------------------------------------
Changes in version 1.8

Bug Fixes
---------
-> Corrected an issue that could prevent UART boot mode from working when PLL0
   was not configured


--------------------------------------------------------------------------------
Changes in version 1.7

Bug Fixes
---------
-> Corrected CFG file parsing issue that prevented PLL1 post divider settings
   from being applied.
-> Set tab order of UI elements to be more intuitive

Enhancements
------------
-> PLL0 can now be configured to reach CPU speeds above 300 MHz.  Check
   your part's datasheet to see its maximum CPU frequency.  All other
   speed limits (ex. peripheral clocks) are unchanged.


--------------------------------------------------------------------------------
Changes in version 1.6

Bug Fixes
---------
-> Corrected issue with peripheral clocks when running the tool from
   the command line.

Enhancements
------------
-> Section load opcodes are now sorted from lowest to highest memory
   address (ex. section at 0x80000000 loaded before section at
   0x80000100).


--------------------------------------------------------------------------------
Changes in version 1.5

Bug Fixes
---------
-> Corrected issue with very large input files.
-> The utility will no longer attempt to use peripheral clock dividers
   (or prescale dividers) that do not fit in the appropriate field.  For
   instance, the maximum UART clock divider is 65,535 (0xFFFF).

Enhancements
------------
-> Added support for d800k006 ROM bootloader.  Selected by default in
   "device type" drop down box.
-> UART boot modes: the baud rate is now configurable in the Peripheral
   tab.  This allows UART boot to be used when the input clock is not
   24 MHz.  See the app note for information on the UART clock
   selection pins (not applicable to the d800k002 ROM).
-> UART clock dividers must obtain an actual UART baud rate within 10%
   of the user-specified baud.  AIS generation will fail if a suitable
   divider can't be found.
-> I2C and SPI master boot modes: the actual peripheral speed is now
   allowed to exceed the specified value in the special case that the
   peripheral clock divider is set to its maximum value and the clock
   is still faster than the specified value.  (This should only ever
   happen for very low speeds in I2C master boot modes.)


--------------------------------------------------------------------------------
Changes in version 1.4

Bug Fixes
---------
(none)

Enhancements
------------
-> Added support for d800k004 ROM bootloader.  Selected by default in
   "device type" drop down box.
-> Added "no config" option under boot mode selection.  This option
   explicitly disabled peripheral clock configuration to produce a
   simpler AIS file.  Note: using this option with PLL configuration
   selected is dangerous and can cause your boot process to freeze.
-> I2C and SPI master boot modes: the actual peripheral clock is now
   chosen to be as close as possible without exceeding the user-
   specified value.


--------------------------------------------------------------------------------
Changes in version 1.3

Bug Fixes
---------
-> Fixed miscellaneous issues with ELF file parsing
-> Fixed issues when specifying an application entrypoint with various
   combinations of object and binary files.

Enhancements
------------
-> Application object files no longer need the extension .out to be
   recognized.  Also, files with the .out extension that don't contain
   valid COFF or ELF headers will be treated as binary files.


--------------------------------------------------------------------------------
Changes in version 1.2

Bug Fixes
---------
-> Fixed issue with binary input files (previously did not save entire
   contents of file to AIS)

Enhancements
------------
-> Added support for ELF files (in addition to COFF and simple binary)
-> Added command line usage: AISgen_d800k002.exe -cfg="<CFG file name>"
   (uses CFG file previously generated using GUI)
-> Added ability to configure mDDR via bootloader patch function
-> Renamed "DDR2" tab to "DDR" and added DDR2/mDDR selection on that tab
-> Added SDCR2 register to DDR tab


--------------------------------------------------------------------------------
Changes in version 1.1

Bug Fixes
---------
-> The SDRAM tab will now display the correct clock when PLL0 is left
   in bypass mode (it previously always assumed PLL0 was configured)
-> Fixed an exception caused by saving SDRAM configuration to a CFG
   file (caused by format error in CFG file itself)

Enhancements
------------
-> Changed label text from "LPSC" to "PSC" and "Domain" to "LPSC" to be
   consistent with PSC documentation
-> Disallowed creating AIS files when only binary files are given with
   no entrypoint
-> Clarified some DDR and SDRAM register names:
	 SDTIMR      -> SDTIMR1
	 DDRPHYC1R   -> DRPYC1R
	 SDBCR       -> SDCR
	 SDRSRPDEXIT -> SDSRETR 

--------------------------------------------------------------------------------
End of README.TXT