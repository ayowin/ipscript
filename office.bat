:�Թ���Ա������У��������Ҽ��Թ���Ա������У�ֱ��˫�����ɣ�
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

:����IPΪ192.168.0.42����������Ϊ255.255.255.0��Ĭ������Ϊ192.168.0.1
netsh interface ipv4 set address "��̫�� 2" static 192.168.0.42 255.255.255.0 192.168.0.1 1
:����DNSΪ119.29.29.29
netsh interface ipv4 set dnsservers "��̫�� 2" static 119.29.29.29 primary

:�û��ɰ����޸�Ϊ�ʺ��Լ��ļ���
:ע�⣬"��̫�� 2" ��С������ϵ��������������ƣ�Ӧ���Ը�Ϊ�����������������ơ�