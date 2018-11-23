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

:设置IP为192.168.0.42，子网掩码为255.255.255.0，默认网关为192.168.0.1
netsh interface ipv4 set address "以太网 2" static 192.168.0.42 255.255.255.0 192.168.0.1 1
:设置DNS为119.29.29.29
netsh interface ipv4 set dnsservers "以太网 2" static 119.29.29.29 primary

:用户可按需修改为适合自己的即可
:注意，"以太网 2" 是小编机器上的网络适配器名称，应当以改为您的网络适配器名称。