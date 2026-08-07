@echo off
setlocal
cd /d "%~dp0"

REM ---------- 1. Install Python ----------
set "PY="
where py >nul 2>&1 && set "PY=py -3"
if not defined PY (
    where python >nul 2>&1 && set "PY=python"
)
if not defined PY (
    echo [ERROR] Python not found. Install Python 3 and enable "Add to PATH".
    echo https://www.python.org/downloads/
    pause
    exit /b 1
)

REM ---------- 2. Updating requirements ----------
if exist "requirements.txt" (
    echo [1/2] Installing requirements...
    %PY% -m pip install --upgrade pip --quiet
    %PY% -m pip install -r requirements.txt
    if errorlevel 1 goto :error
) else (
    echo [1/2] requirements.txt not found - skipping install.
)

REM ---------- 3. Running main.py ----------
if not exist "main.py" (
    echo [ERROR] main.py not found in %cd%
    pause
    exit /b 1
)
echo [2/2] Starting main.py...
echo.
%PY% main.py
set "CODE=%errorlevel%"
echo.
echo Program finished with exit code %CODE%.
pause
exit /b %CODE%

:error
echo.
echo [ERROR] Something went wrong. See the messages above.
pause
exit /b 1