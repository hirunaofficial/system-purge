# SystemPurge

A comprehensive Windows system maintenance utility that helps improve performance by cleaning temporary files, cache, and performing various system optimizations.

## Overview

SystemPurge is a powerful batch script utility designed to clean and optimize your Windows system. It removes unnecessary files, clears various caches, and performs system optimizations to help improve performance and free up disk space.

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
  - System Restore Point creation
  - Registry backup functionality
  - Error handling and recovery

## Installation

1. Download the latest version of `SystemPurge.bat` from the [Releases](https://github.com/hirunagallage/system-purge/releases) page
2. Save it to a location on your computer
3. No installation required - it's a portable script!

## Usage

1. Right-click on `SystemPurge.bat` and select "Run as administrator"
2. Select your desired cleaning level:
   - Option 1: Quick Clean
   - Option 2: Standard Clean
   - Option 3: Deep Clean
   - Option 4: Create System Restore Point
3. Follow the on-screen prompts
4. After completion, a log file will be saved to your Desktop

## Requirements

- Windows 7/8/10/11
- Administrator privileges

## Important Notes

- **Always run as administrator** - The script requires elevated privileges to access system folders and perform cleaning operations
- **Create a System Restore Point first** - For added safety, use the built-in option to create a restore point before cleaning
- **Deep Clean can take significant time** - Depending on your system, it may take 30+ minutes to complete
- **System restart recommended** - For best results, restart your computer after running a Deep Clean
- **Log file location** - A detailed cleaning log is saved to your Desktop as `CleaningLog.txt`
- **Backup location** - Registry backups are saved to `%USERPROFILE%\SystemPurge_Backup\`

## Troubleshooting

If you encounter issues when running SystemPurge:

1. Make sure you're running as administrator
2. Check if your antivirus is blocking the script's operation
3. Try using the simplified version for better compatibility
4. Review the log file for error messages
5. Reboot your computer and try again

## Contributing

Contributions are welcome! If you'd like to improve SystemPurge:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Warning

This is a powerful system utility that removes various temporary files and caches. While it is designed to be safe, please ensure you understand what the script does before running it. The author is not responsible for any data loss or system issues that may occur from using this script.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

### Contact

- Author: Hiruna Gallage
- Website: [hiruna.dev](https://hiruna.dev)
- Email: [hello@hiruna.dev](mailto:hello@hiruna.dev)