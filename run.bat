@echo off
setlocal
cd /d "%~dp0"
title IssueLens AI

if not exist ".venv\Scripts\python.exe" (
  echo First-time setup has not been completed. Starting setup...
  call setup.bat
  if errorlevel 1 exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Python environment is missing. Run setup.bat first.
  pause
  exit /b 1
)

echo Starting IssueLens AI...
echo Choose Cloud Gemini or Local Ollama in the app sidebar.
start "" http://localhost:8501
".venv\Scripts\python.exe" -m streamlit run app.py
pause
