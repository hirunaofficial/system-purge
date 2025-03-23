# SystemPurge

A comprehensive Windows system maintenance utility that helps improve performance by cleaning temporary files, cache, and performing various system optimizations.

## Features

- **Three cleaning levels** to match your needs:
  - **Quick Clean**: Basic temporary file removal and DNS flushing (1-2 minutes)
  - **Standard Clean**: Comprehensive system cache clearing (5-10 minutes)
  - **Deep Clean**: Complete system optimization with advanced cleanup (15-30+ minutes)

- **Cleans multiple areas**:
  - Windows temporary files
  - User temporary files
  - Browser caches (Chrome, Edge, Firefox)
  - Windows Update cache
  - Prefetch files
  - Recycle Bin
  - Windows Defender cache
  - Event logs
  - Font cache
  - Thumbnail cache
  - And more...

- **Network optimization**:
  - DNS cache flushing
  - IP configuration release/renew
  - Winsock reset
  - TCP/IP stack reset

- **System repair**:
  - System File Checker integration
  - Disk defragmentation
  - Advanced Disk Cleanup with registry optimizations

- **User-friendly features**:
  - Menu-driven interface
  - Detailed progress indicators
  - Automatic log file creation
  - Administrator privilege handling

## Installation

1. Download the `SystemPurge.bat` file
2. Save it to a location on your computer

## Usage

1. Right-click on `SystemPurge.bat` and select "Run as administrator"
2. Select your desired cleaning level:
   - Option 1: Quick Clean
   - Option 2: Standard Clean
   - Option 3: Deep Clean
3. Follow the on-screen prompts
4. After completion, a log file will be saved to your Desktop

## Requirements

- Windows 7/8/10/11
- Administrator privileges

## Important Notes

- **Always run as administrator** - The script requires elevated privileges to access system folders and perform cleaning operations
- **Deep Clean can take significant time** - Depending on your system, it may take 30+ minutes to complete
- **System restart recommended** - For best results, restart your computer after running a Deep Clean
- **Log file location** - A detailed cleaning log is saved to your Desktop as `CleaningLog.txt`

## Warning

This is a powerful system utility that removes various temporary files and caches. While it is designed to be safe, please ensure you understand what the script does before running it. The author is not responsible for any data loss or system issues that may occur from using this script.

## Contact

* Author: Hiruna Gallage
* Website: hiruna.dev
* Email: hello@hiruna.dev