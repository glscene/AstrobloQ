rem @echo off
cls

set LANG=C

echo Extracting texts from source dir to d:\astronomy\astrobloq\default.po

echo -r ...if apply for all subdirs
dxgettext -b d:\astronomy\astrobloq\source --delphi --useignorepo

echo Updating Russian translations
pushd d:\astronomy\astrobloq\locale\ru\LC_MESSAGES
copy default.po default-backup.po
ren default.po default-old.po

echo Merging
msgmergedx default-old.po d:\astronomy\astrobloq\default.po -o default.po
del default-old.po
del default-backup.po

echo copy default.po astrobloq.po ...if apply for all projects
copy default.po galaktika.po

popd

del d:\astronomy\astrobloq\default.po

pause

