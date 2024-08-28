rem @echo off
cls

dxgettext -b ..\source --delphi --useignorepo - r

echo updating Russian translation

pushd ru\LC_MESSAGES
copy default.po default-backup.po
ren default.po default-old.po
echo Merging
msgmergedx default-old.po ..\..\default.po -o default.po
del default-old.po
del default-backup.po

copy default.po galaxy.po

popd
del default.po
pause

