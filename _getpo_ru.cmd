rem @echo off
cls

echo updating Russian translations

echo -r ... applied for all subdirs of source dir
dxgettext -b source --delphi --useignorepo -r

rem copy default.po d:\astrobloq\locale\ru\lc_messages\default.po
copy default.po d:\astrobloq\bin\locale\ru\lc_messages\default.po

rem pushd locale\ru\LC_MESSAGES
pushd bin\locale\ru\LC_MESSAGES

echo Merging
msgmergedx galaxy.po galaxy.po -o default.po

popd
del default.po

pause

