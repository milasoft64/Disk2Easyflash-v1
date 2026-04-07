Disk2EasyFlash v1.0 (unofficial)
Original Logic: Alex Kazik
Enhancements: Milasoft64.itch.io

Overview

Disk2EasyFlash is a utility designed to create Commodore 64 cartridge images for modern EasyFlash cartridge hardware. 

Core Features
1. Massive Multi-Disk Support
=============================
While standard converters limit you to a single disk-to-cartridge ratio, this utility supports the inclusion of up to 26 disk images.

Each disk is assigned a letter (A–Z) within the custom bootloader.


2. Dynamic Boot Menu System
===========================
The utility automatically generates a boot menu upon startup.

Users press a key corresponding to the disk letter to instantly mount and boot that image.

The menu pulls disk headers directly from the images, displaying the actual disk names in a clean, PETSCII-compatible interface.


3. Enhanced Format Compatibility
================================
File Size Flexibility: Optimized to handle various .d64 variations, including the 175,531-byte extended format.
Multi-Format: Full support for .d64, .d81, and .m2i input formats.

4. Intelligent Memory Stubs
===========================
To ensure maximum compatibility with software that expects specific memory configurations:

Supports Normal (nm), Low (lo), and High (hi) memory mapping modes to accommodate different software requirements.


** IMPORTANT ** ** IMPORTANT **
The Kernal Load Requirement
** IMPORTANT ** ** IMPORTANT **

===========================
The most significant technical limitation is inherited from the original loader design: the software must use standard ROM Kernal load routines.

Why: The utility hooks into the standard Kernal vectors to redirect disk traffic to the cartridge banks.

Incompatibility: Software that uses custom fast-loaders or direct hardware access to the 1541 disk drive (bypassing the Kernal) will generally not function once converted to a CRT.

Bank Constraints
You are limited by the physical capacity of the EasyFlash format (typically 64 banks of 16KB).

Large multi-disk sets must fit within the 1MB total limit. The utility will alert you if the bank allocation exceeds the hardware's capacity.


python disk2easyflash.py --multi output.crt disk1.d64 disk2.d64 disk3.d64
To list the contents of a disk image before converting:


python disk2easyflash.py --list game_disk.d64
Note on Hardware
This utility is designed specifically for EasyFlas
