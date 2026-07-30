@echo off
chcp 65001 > nul
:: AO3-only strategy. Other websites are not intercepted.

cd /d "%~dp0"
call service.bat status_zapret
call service.bat check_updates
echo:

set "BIN=%~dp0bin\"
cd /d %BIN%

start "zapret: AO3" /min "%BIN%winws.exe" --wf-tcp=80,443 ^
--filter-tcp=80,443 --hostlist-domains=archiveofourown.org --dpi-desync=multisplit --dpi-desync-split-seqovl=568 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_4pda_to.bin"
