rem @echo off
cls

set LANG=C

dxgettext -b pascal --delphi --useignorepo -r

echo updating Russian translations
pushd locale\ru\LC_MESSAGES
copy default.po default-backup.po
ren default.po default-old.po

echo Merging
msgmergedx default-old.po ..\..\..\default.po -o default.po
del default-old.po
del default-backup.po

copy default.po apex.po

popd

del default.po

pause

