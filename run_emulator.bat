@echo off
setlocal
echo ======================================================================
echo    STARTING EDUPATH ANDROID EMULATOR & LAUNCHING APP
echo ======================================================================

set "SDK_DIR=C:\Users\hunga\AppData\Local\Android\sdk"
set "EMULATOR_EXE=%SDK_DIR%\emulator\emulator.exe"
set "ADB_EXE=%SDK_DIR%\platform-tools\adb.exe"
set "APK_FILE=%~dp0frontend\flutter\build\app\outputs\flutter-apk\app-debug.apk"

echo [*] Checking running Android emulator...
"%ADB_EXE%" devices | findstr /R "emulator-[0-9]*" >nul
if %errorlevel% neq 0 (
    echo [*] Starting Android Emulator Medium_Phone_API_37.0 ...
    start "" "%EMULATOR_EXE%" -avd Medium_Phone_API_37.0 -gpu host
    echo [*] Waiting for emulator to boot up...
    "%ADB_EXE%" wait-for-device
)

echo [*] Waiting for Android OS to finish booting...
:wait_boot
for /f "tokens=*" %%a in ('"%ADB_EXE%" shell getprop sys.boot_completed 2^>nul') do set "BOOT_STATUS=%%a"
if not "%BOOT_STATUS%"=="1" (
    timeout /t 2 /nobreak >nul
    goto wait_boot
)

echo [+] Emulator is ready!
if exist "%APK_FILE%" (
    echo [*] Installing EduPath App (98 Screens)...
    "%ADB_EXE%" install -r "%APK_FILE%"
    echo [*] Launching EduPath App...
    "%ADB_EXE%" shell monkey -p com.edupath.edupath_flutter -c android.intent.category.LAUNCHER 1
    echo.
    echo [V] Ung dung EduPath da duoc mo tren may ao!
) else (
    echo [*] Installing via Flutter run...
    cd /d "%~dp0frontend\flutter"
    call flutter run
)

echo.
pause
endlocal
