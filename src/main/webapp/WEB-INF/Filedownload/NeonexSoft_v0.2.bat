@echo off
echo ##########################
echo ## NeonexSoft EOM SETUP ##
echo ##########################

bcdedit >> nul
if %errorlevel% == 1 goto noadmin 

	echo DIR CREATE START
	
	if exist "C:\NeonexSoft\URLprotocol" (
		echo URLprotocol directory is ready
	) else (
		mkdir "C:\NeonexSoft\URLprotocol"
		echo ..........URLprotocol directory complete
	)
	
	echo FILE DOWNLOAD START

	if exist "C:\NeonexSoft\URLprotocol\URLprotocol_v0.2.zip" (
		echo URLprotocol zip file is ready
	) else (
		powershell "(New-Object System.Net.WebClient).DownloadFile('http://106.248.228.114:9070/attachFile?fileName=URLprotocol_v0.2.zip','C:\NeonexSoft\URLprotocol\URLprotocol_v0.2.zip')"
		echo ..........file download complete
	)
	
	echo ZIP DECOMPRESS START
	
	if exist "C:\NeonexSoft\URLprotocol\putty.exe" (
		echo decompress is already
	) else (
		powershell "(New-Object System.Net.WebClient).DownloadFile('http://106.248.228.114:9070/attachFile?fileName=URLprotocol_v0.2.zip','C:\NeonexSoft\URLprotocol\URLprotocol_v0.2.zip')"
		powershell expand-archive C:\NeonexSoft\URLprotocol\URLprotocol_v0.2.zip C:\NeonexSoft\URLprotocol\
		echo ..........decompress complete
	)

	echo REGISTRY ADD START
	reg.exe add "HKEY_CLASSES_ROOT\nnsftp" /v "URL protocol" /d "" /f
	reg.exe add "HKEY_CLASSES_ROOT\nnsftp\shell\open\command" /v "" /d "\"C:\Windows\System32\WScript.exe\" \"C:\NeonexSoft\URLprotocol\sftp.js\" \"%%1\"" /f
	reg.exe add "HKEY_CLASSES_ROOT\nnssh" /v "URL protocol" /d "" /f
	reg.exe add "HKEY_CLASSES_ROOT\nnssh\shell\open\command" /v "" /d "\"C:\Windows\System32\WScript.exe\" \"C:\NeonexSoft\URLprotocol\ssh.js\" \"%%1\"" /f
	echo ..........registry add complete
	
	echo .
	echo ... END
	echo .
	pause
	exit

:noadmin 
	echo .
	echo ... please run admin mode
	echo .
	pause
