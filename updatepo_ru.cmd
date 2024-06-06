rem @echo off
cls

set LANG=C

echo Extracting texts from src dir to d:\astronomy\astrobloq\default.po

dxgettext -b d:\astronomy\astrobloq\src --delphi --useignorepo 

echo Updating Russian translations
pushd d:\astronomy\astrobloq\locale\ru\LC_MESSAGES
copy default.po default-backup.po
ren default.po default-old.po

echo Merging
msgmergedx default-old.po d:\astronomy\astrobloq\default.po -o default.po
del default-old.po
del default-backup.po
copy default.po galablock.po
popd


del d:\astronomy\astrobloq\default.po

pause

