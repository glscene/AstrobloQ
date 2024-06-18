rem @echo off
cls

set LANG=C

rem extracting texts from source dir to ..\..\astrobloq\default.po

echo -r ...if applied for all subdirs
dxgettext -b source --delphi --useignorepo

echo updating Russian translations
pushd locale\ru\LC_MESSAGES
copy default.po default-backup.po
ren default.po default-old.po

echo Merging
msgmergedx default-old.po ..\..\..\default.po -o default.po
del default-old.po
del default-backup.po

rem copy default.po astrobloq.po ...if applied for all projects
copy default.po galaktika.po

popd

del default.po

pause

