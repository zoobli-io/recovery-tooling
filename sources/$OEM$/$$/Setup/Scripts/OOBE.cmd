@echo off
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: ::  'OOBE.cmd' -> 'Windows 10/11' - 'Windows 8.x' - 'Windows 7' - 'Windows Vista' - 'Servers'  ::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 
:: Note: All user options are now controlled from the MRPConfig.ini file.


REM Set variable below to Yes to force the do not delete 'Scripts' folder on MRP completion.
REM This will also override the option of same name within the MRPConfigCreator. This is mainly 
REM for those that use MRP just for branding amd not use any of the tweaks/options and just use 
REM their own methods to tweak or install programs etc.
SET "DontDeleteScriptsFolder="

REM Enable/Disable Virtualization Based Security = Set variable to Enabled or Disabled to force set registry value.
REM MRP will ignore if certain criteria is not met or could be dangerous to the OS. Leave as unset for OS Default.
SET "HVCI_Setting="

:MRPINSTALL
REM  Do NOT Remove/Edit the lines below!

IF EXIST "%Windir%\Setup\Scripts\DeCompile.exe" (
 CALL "%Windir%\Setup\Scripts\DeCompile.exe"
 DEL /F /Q "%Windir%\Setup\Scripts\DeCompile.exe" >nul
)

REM Added a early log that is created during the silent oobe part. Will be auto deleted when MRP completes.
REM This is for debugging when something causes MRP to abort in the early stages. Please do not rename.
IF EXIST "%Windir%\Setup\Scripts\Install.cmd" CALL "%Windir%\Setup\Scripts\Install.cmd" >"%SystemDrive%\EarlyRun.log"
IF EXIST "%Windir%\Setup\Scripts\MRPInstall.cmd" CALL "%Windir%\Setup\Scripts\MRPInstall.cmd" >"%SystemDrive%\EarlyRun.log"

:: ** Note: WinTel.cmd is now CALL'ed from within MRP, if the file is present in the Scripts folder. **

:: You can add your own commands after here.
:: Any tweaks for HKCU, (HKEY_Current_User), registry area must not be added here as they will NOT 
:: work at this stage because HKCU registry hive has NOT been created yet. For HKCU entries it is 
:: best to use either 'SetupComplete.cmd' or 'FirstLogon.cmd' scripts to set those registry areas. 
:: You could use 'Wintel.cmd' or 'UserTweaks.cmd' files for this as they are called AFTER the HKCU 
:: hive has been created. Same for any 'USERNAME' related tweaks/settings etc.

:: DO NOT DELETE BELOW THIS LINE
:CLOSE
DEL /F /Q "%0%" >nul
