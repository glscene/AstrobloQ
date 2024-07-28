rem @echo off
cls

set LANG=C

rem -r ...if applied for all subdirs of source dir
dxgettext -b source --delphi --useignorepo

echo updating Russian translations
pushd locale\ru\LC_MESSAGES
copy default.po default-backup.po
ren default.po default-old.po

echo Merging
msgmergedx default-old.po ..\..\..\default.po -o default.po
del default-old.po
del default-backup.po

copy default.po galaktikos.po

popd

del default.po

pause

