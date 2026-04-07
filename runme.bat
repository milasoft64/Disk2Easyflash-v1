@echo off
setlocal

:: Check Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed or not in PATH.
    echo Please install Python 3.8+ from https://www.python.org/downloads/
    pause
    exit /b 1
)

:: Check minimum version (3.8+)
python -c "import sys; sys.exit(0 if sys.version_info >= (3,8) else 1)" >nul 2>&1
if errorlevel 1 (
    echo Python 3.8 or newer is required.
    echo Your installed version is too old.
    pause
    exit /b 1
)

:: Run the tool, passing through any arguments
python "%~dp0disk2easyflash.py" %*