:以管理员身份运行（不必再右键以管理员身份运行，直接双击即可）
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (goto UACPrompt) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0

:设置IP自动获取
netsh interface ipv4 set address "以太网 2" dhcp
:设置DNS自动获取
netsh interface ipv4 set dnsservers "以太网 2" dhcp

:注意，"以太网 2" 是小编机器上的网络适配器名称，应当以改为您的网络适配器名称。