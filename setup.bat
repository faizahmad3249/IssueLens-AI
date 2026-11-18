@echo off
setlocal
cd /d "%~dp0"
title IssueLens AI - First-time Setup

echo ==========================================
echo        IssueLens AI - First-time setup
echo ==========================================
echo.

where python >nul 2>nul
if errorlevel 1 (
  echo Python 3.10 or newer was not found.
  echo Install Python from https://www.python.org/downloads/
  echo During setup, enable "Add Python to PATH".
  start "" "https://www.python.org/downloads/"
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Creating Python virtual environment...
  python -m venv .venv
  if errorlevel 1 goto :error
)

echo Installing or updating Python dependencies...
".venv\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 goto :error
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto :error

echo.
where ollama >nul 2>nul
if errorlevel 1 (
  echo Ollama is not installed. Local AI mode requires Ollama.
  echo Install it from https://ollama.com/download
  start "" "https://ollama.com/download"
  echo.
  echo You can still use Cloud Gemini mode after setting GEMINI_API_KEY.
) else (
  echo Checking Gemma 3 4B model...
  ollama list | findstr /I "gemma3:4b" >nul
  if errorlevel 1 (
    echo Downloading Gemma 3 4B. This may take several minutes and several GB.
    ollama pull gemma3:4b
    if errorlevel 1 (
      echo Model download did not complete. You can retry with: ollama pull gemma3:4b
    )
  ) else (
    echo Gemma 3 4B is already installed.
  )
)

echo.
echo Setup finished.
echo To start IssueLens AI, double-click run.bat.
echo For cloud mode, set GEMINI_API_KEY as an environment variable.
pause
exit /b 0

:error
echo.
echo Setup failed. Read the error above, then run setup.bat again.
pause
exit /b 1
