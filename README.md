# Disk2EasyFlash v1.0 (unofficial)  
**Original Logic:** Alex Kazik  
**Enhancements:** Milasoft64.itch.io  
Original link: https://github.com/alexkazik/disk2easyflash  

---

## Overview

Disk2EasyFlash is a utility designed to create Commodore 64 cartridge images for modern EasyFlash cartridge hardware.

---

## Core Features

### 1. Multi-Disk Support

While standard converters limit you to a single disk-to-cartridge ratio, this utility supports the inclusion of up to **26 disk images**
Each disk is assigned a letter (A–Z) within the custom bootloader.

---

### 2. Dynamic Boot Menu System

The utility automatically generates a boot menu upon startup.

Users press a key corresponding to the disk letter to instantly mount and boot that image.

The menu pulls disk headers directly from the images, displaying the actual disk names in a clean, PETSCII-compatible interface.

---

### 3. Enhanced Format Compatibility

* **File Size Flexibility:** Handles various `.d64` variations, including the 175,531-byte extended format
* **Multi-Format Support:** `.d64` (up to track 40), `.d81`, and `.m2i`

---

### 4. Intelligent Memory Stubs

To ensure maximum compatibility with software that expects specific memory configurations:

* Supports **Normal (nm)**, **Low (lo)**, and **High (hi)** memory mapping modes

---

## ⚠️ Important – Kernal Load Requirement

The most significant technical limitation is inherited from the original loader design:

**Requirement:** The software must use standard ROM Kernal load routines.

* **Why:** The utility hooks into standard Kernal vectors to redirect disk traffic to cartridge banks
* **Incompatibility:** Software using custom fast-loaders or direct 1541 hardware access will generally NOT work

---

## Bank Constraints

You are limited by the physical capacity of the EasyFlash format (typically **64 banks of 16KB**).

Large multi-disk sets must fit within the **1MB total limit**.
The utility will alert you if the bank allocation exceeds capacity.

---

Usage
=============================

The tool can be run interactively (double-click or run with no arguments) for a guided menu, or via command line as follows.  

**Mode (required, pick one):  **
  --crt  / -c       Build a standard EasyFlash cartridge  
  --xbank / -x      Build an EasyFlash XBANK cartridge  
  --list            List disk contents without building anything  
  --multi           Pack multiple disks into one CRT with a boot menu (min. 2 disks)  

**Bank mode (optional, pick one):  **
  --normal          Full 16 KiB banks (default)  
  --low             Lower 8 KiB banks only ($8000)  
  --high            Upper 8 KiB banks only ($A000, Ultimax)  

**Other options:  **
  --nolisting / -n  Do not add the LOAD "$" directory listing  
  --blocks-free N   Set the blocks-free count shown in the listing (default: 2)  
  --remove ID       Remove entry #ID from the listing and cartridge entirely  
                    (can be used multiple times, e.g. --remove 1 --remove 3)  
  --ignore ID       Keep entry #ID in the listing but do not write its data to  
                    flash — useful for save-game slot placeholders (repeatable)  
  --verbose / -v    Print the file listing even when building with --crt/--xbank  

NOTE: The output .crt file is always last in all modes.  

**Examples:**

  Build a single-disk cartridge:
    python disk2easyflash.py --crt game.d64 game.crt

  Build from a .d81 image:
    python disk2easyflash.py --crt game.d81 game.crt

  Build using low bank mode:
    python disk2easyflash.py --xbank --low game.d64 game.crt

  List the contents of a disk image before converting:
    python disk2easyflash.py --list game_disk.d64

  Build with specific files removed/ignored:
    python disk2easyflash.py --crt --remove 1 --ignore 3 game.d64 game.crt

  Pack multiple disks into one cartridge (output .crt is always last):
    python disk2easyflash.py --multi disk1.d64 disk2.d64 disk3.d64 output.crt



## Note on Hardware

This utility is designed specifically for **EasyFlash** cartridges.
