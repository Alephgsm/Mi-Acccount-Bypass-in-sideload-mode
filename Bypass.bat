@echo off
echo.
echo Mi Account Bypass in sideload mode GsmAlphabet Team (alephgsm.com).
echo Connect Device in Sideload Mode.
echo waiting for device.
adb wait-for-sideload >nul 2>&1
adb devices >nul 2>&1
echo Device Connected
cecho * Read Device info:
for /F "delims=_" %%a in ('adb getdevice') do set DEVICE=%%a
for /F "delims=" %%a in ('adb getdevice') do set Region=%%a
for /F "delims=" %%a in ('adb getsn') do set SERIAL=%%a
for /F "delims=" %%a in ('adb getcodebase') do set ANDROID=%%a
for /F "delims=" %%a in ('adb getversion') do set FR=%%a
for /F "delims=" %%a in ('adb getlanguage') do set LANG=%%a
cecho - Model    :  {0A}%DEVICE% {#}{\n}
cecho - Region   :  {0A}%Region%{#}{\n}
cecho - Serial   :  {0A}%SERIAL%{#}{\n}
cecho - Android  :  {0A}%ANDROID%{#}{\n}
cecho - Firmware :  {0A}%FR%{#}{\n}
cecho - language :  {0A}%LANG%{#}{\n}
if %ANDROID%==10 (goto nots)
if %ANDROID%==9 (goto nots)
if %ANDROID%==8 (goto nots)
if %DEVICE%==mojito (goto mojito)
if %DEVICE%==sunny (goto mojito)
if %DEVICE%==agate (goto agate)
if %DEVICE%==alioth (goto alioth)
if %DEVICE%==cmi (goto Cmi)
if %DEVICE%==courbet (goto courbet)
if %DEVICE%==curtana (goto Curtana)
if %DEVICE%==davinci (goto davinci)
if %DEVICE%==excalibur (goto excalibur)
if %DEVICE%==fog (goto fog)
if %DEVICE%==gauguin (goto gauguin)
if %DEVICE%==ginkgo (goto ginkgo)
if %DEVICE%==joyeuse (goto joyeuse)
if %DEVICE%==lime (goto lime)
if %DEVICE%==lisa (goto lisa)
if %DEVICE%==raphael (goto raphael)
if %DEVICE%==renoir (goto renoir)
if %DEVICE%==rosemary (goto rosemary)
if %DEVICE%==spes (goto Spessn)
if %DEVICE%==spesn (goto Spessn)
if %DEVICE%==Star (goto Star)
if %DEVICE%==surya (goto surya)
if %DEVICE%==sweetin (goto sweetin)
if %DEVICE%==toco (goto toco)
if %DEVICE%==umi (goto umi)
if %DEVICE%==apollo (goto apollo)
if %DEVICE%==vayu (goto vayu)
if %DEVICE%==veux (goto veux)
if %DEVICE%==vili (goto vili)
if %DEVICE%==zeus (goto zeus)
if %DEVICE%==gram (goto Curtana)
if %DEVICE%==phoenixin (goto courbet)
if %DEVICE%==sweet (goto sweet)
if NOT EXIST %DEVICE% goto :devnot



:agate
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/md1img_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe md1img_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe md1img_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push md1img_a /dev/block/sdc19 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdc14 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sdc4  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit


:alioth
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde5 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda22 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit

:apollo
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && echo * bakup data:ok
adb pull /dev/block/by-name/modem >nul 2>&1 && echo * bakup data:ok
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && echo * patching data:ok
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && echo * patching data:ok
replace.exe persist "fdsd" "frnx" >nul 2>&1 && echo * patching data:ok
adb push modem /dev/block/sde51 >nul 2>&1 && echo * write  data:ok
adb push persist /dev/block/sda22 >nul 2>&1 && echo * write  data:ok
adb push frp /dev/block/sda9 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit

:cepheus
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda23 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1

exit

:citrus
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda4 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:Cmi
echo Do NOT disconnect phone!!
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde51 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda22 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:courbet
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdf7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit



:Curtana
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda5 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1

adb kill-server >nul 2>&1
pause  >nul 2>&1
exit


:davinci
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde51 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdf7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit

:excalibur
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda5 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit


:fog
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda6 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1

exit


:gauguin
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde48 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda23 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:ginkgo
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/mmcblk0p80 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/mmcblk0p69 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/mmcblk0p30 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done

adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:joyeuse
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda5 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit

:lime
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda4 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit

:lisa
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda8 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda14  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:mojito
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda6 >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:raphael
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda23 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:renoir
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda8 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda14  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit

:rosemary
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/md1img_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe md1img_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe md1img_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push md1img_a /dev/block/sdc26 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdc21 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sdc10  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:Spessn
echo Bypass MCloud Account And FRP
echo.
.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda6  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1
exit


:Star
echo Bypass MCloud Account And FRP
echo.
.

adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde5 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda21 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:surya
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda2 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda5  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1

adb kill-server >nul 2>&1

pause  >nul 2>&1
exit


:sweet
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdf7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1


echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:sweetin
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdf7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:toco
echo Bypass MCloud Account And FRP
echo.
.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdf7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1

echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit


:umi
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde51 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda22 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}

Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:vayu
echo Bypass MCloud Account And FRP
echo.
.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem /dev/block/sde52 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sdf7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1

Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1
pause  >nul 2>&1

exit

:veux
echo Bypass MCloud Account And FRP
echo.
.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde4 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda11 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda5  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}

Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1


pause  >nul 2>&1
exit

:vili
echo # Start Remove Frp and patching Micloud"
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/modem_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde5 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda21 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}

Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1
echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:zeus
echo Bypass MCloud Account And FRP
echo.
adb pull /dev/block/by-name/persist >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
adb pull /dev/block/by-name/md1img_a >nul 2>&1 && cecho * backup data:{0A}OKAY{#}{\n}
replace.exe modem_a "CARDAPP MDT" "CARDAPP RNX" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe modem_a "#*#cardapp#*#*" "#*#.......#*#*" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
replace.exe persist "fdsd" "frnx" >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push modem_a /dev/block/sde7 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push persist /dev/block/sda21 >nul 2>&1 && cecho * Patching MIcloud:{0A}OKAY{#}{\n}
adb push frp /dev/block/sda9  >nul 2>&1 && cecho * Erase FRP:{0A}OKAY{#}{\n}
Del modem  >nul 2>&1
Del modem_a >nul 2>&1
Del persist  >nul 2>&1


echo Reboot Device Done
adb reboot  >nul 2>&1
adb kill-server >nul 2>&1

pause  >nul 2>&1
exit

:devnot
echo  Device not Supported
pause >nul 2>&1
exit

:nots
echo  Android %ANDROID% is not supported
pause >nul 2>&1
exit


:PAUSE
exit