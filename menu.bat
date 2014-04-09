::This tool creates a menu type UI inside command prompt which is scroll-able using the W and S keys
::read the comments to figure out what parts to change inorder to use for your own purposes
@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
:: The ColorText method was taken from this link : http://stackoverflow.com/questions/4339649/how-to-have-multiple-colors-in-a-batch-file/5344911#5344911
set /a option=1

:: change numOfOptions to the number of options you wish to have in your menu
set /a numOfOptions=3
set /a xtra=numOfOptions+1

:: edit the colour to your liking, type "color help" in command prompt for all the options
set color="0A"

:menu
echo Select an option.
echo.
:: add if statements for all your options, also add what text you want each line to display
if "%option%"=="1" (call :ColorText %color% "Option1" & echo.) else (echo Option1)
if "%option%"=="2" (call :ColorText %color% "Option2" & echo.) else (echo Option2)
if "%option%"=="3" (call :ColorText %color% "Option3" & echo.) else (echo Option3)
CHOICE /C WSD /N /M "W [UP]. S [DOWN]. D[SELECT]"
IF ERRORLEVEL 1 set /a option-=1
IF ERRORLEVEL 2 set /a option+=2
IF ERRORLEVEL 3 set /a option-=1 & goto :mainCode

IF "%option%"=="0" set /a option+=numOfOptions
IF "%option%"=="%xtra%" set /a option-=numOfOptions
cls
goto menu 

:mainCode
:: add code to act upon the option that the user selected
if "%option%"=="1" set optionNum="Option 1 Selected"
if "%option%"=="2" set optionNum="Option 2 Selected"
if "%option%"=="3" set optionNum="Option 3 Selected"
echo %optionNum%

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
