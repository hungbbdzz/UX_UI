@echo off
setlocal
cd /d "%~dp0frontend\flutter"
echo ======================================================================
echo    BUILDING EDUPATH FLUTTER ANDROID APK
echo ======================================================================
call flutter build apk --debug --android-skip-build-dependency-validation
echo.
if exist "build\app\outputs\flutter-apk\app-debug.apk" (
    echo [+] Build APK thanh cong!
    echo [i] File APK: %~dp0frontend\flutter\build\app\outputs\flutter-apk\app-debug.apk
) else (
    echo [!] Build that bai, vui long kiem tra log.
)
pause
endlocal

