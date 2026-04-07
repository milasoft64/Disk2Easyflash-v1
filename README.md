# Disk2EasyFlash v1.0 (unofficial)  
**Original Logic:** [Alex Kazik](https://github.com/alexkazik)  
**Enhancements:** [Milasoft64](https://milasoft64.itch.io)  
Original link: [GitHub Repository](https://github.com/alexkazik/disk2easyflash)  


For setup on Windows, see [Windows Instructions](#windows-instructions) below.  


## Overview

Disk2EasyFlash is a utility designed to create Commodore 64 cartridge images for modern EasyFlash cartridge hardware.

---

## Core Features

### 1. Multi-Disk Support

Supports up to **26 disk images**. Each disk is assigned a letter (A–Z) within the custom bootloader.

### 2. Dynamic Boot Menu System

Automatically generates a boot menu on startup.  
Press the key corresponding to the disk letter to mount and boot that image.  
Displays actual disk names in a PETSCII-compatible interface.

### 3. Enhanced Format Compatibility

* **File Size Flexibility:** Handles various `.d64` variations, including 175,531-byte extended format  
* **Multi-Format Support:** `.d64` (up to track 40), `.d81`, `.m2i`

### 4. Intelligent Memory Stubs

Supports **Normal (nm)**, **Low (lo)**, and **High (hi)** memory mapping modes.

---

## ⚠️ Important – Kernal Load Requirement

**Requirement:** Software must use standard ROM Kernal load routines.  
**Why:** Hooks into Kernal vectors to redirect disk traffic to cartridge banks.  
**Incompatibility:** Custom fast-loaders or direct 1541 hardware access may not work.

---

## Bank Constraints

Limited by EasyFlash format (**64 banks of 16KB**, max **1MB**). Large multi-disk sets may exceed capacity.

---

## Usage

Run interactively (double-click) or via command line:

**Modes (required):**  
* `--crt / -c` – Standard EasyFlash cartridge  
* `--xbank / -x` – EasyFlash XBANK cartridge  
* `--list` – List disk contents  
* `--multi` – Pack multiple disks (min 2)  

**Bank modes (optional):**  
* `--normal` – Full 16 KiB banks (default)  
* `--low` – Lower 8 KiB banks ($8000)  
* `--high` – Upper 8 KiB banks ($A000, Ultimax)  

**Other options:**  
* `--nolisting / -n` – No LOAD "$" listing  
* `--blocks-free N` – Set blocks-free count (default: 2)  
* `--remove ID` – Remove entry #ID (repeatable)  
* `--ignore ID` – Keep entry but don’t flash (repeatable)  
* `--verbose / -v` – Print listing even when building

**NOTE:** Output `.crt` is always last.

### Command Examples (single copy-paste block)

```bash
# Build a single-disk cartridge
python disk2easyflash.py --crt game.d64 game.crt

# Build from a .d81 image
python disk2easyflash.py --crt game.d81 game.crt

# Build using low bank mode
python disk2easyflash.py --xbank --low game.d64 game.crt

# List the contents of a disk image
python disk2easyflash.py --list game_disk.d64

# Build with specific files removed/ignored
python disk2easyflash.py --crt --remove 1 --ignore 3 game.d64 game.crt

# Pack multiple disks into one cartridge
python disk2easyflash.py --multi disk1.d64 disk2.d64 disk3.d64 output.crt

```

## Windows Instructions

Run the .exe file under Windows for the menu-driven CRT creator.
Versions for Mac and Linux can be created using the Python script.  
## Windows Instructions

Run the .exe file under Windows for the menu-driven CRT creator.  
Versions for Mac and Linux can be created using the Python script.

<a name="windows-bottom"></a>
