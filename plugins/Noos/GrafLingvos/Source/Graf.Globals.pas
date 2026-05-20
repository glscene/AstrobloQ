unit Graf.Globals;

interface

uses
  System.SysUtils,
  System.Win.Registry,
  System.IniFiles;


const
  // cRegistryKey = 'Software\GLSViewer';
  RegGLSViewer = PathDelim + 'SOFTWARE' + PathDelim + 'GLSViewer' + PathDelim;


var
  ExePath: TFileName;
  ModelPath:   TFileName;
  TexturePath: TFileName;
  IniFile: TIniFile;

  LanguageID: integer;
  GeneralSection: string = RegGLSViewer + 'General';

  SplashStart : Boolean;
  TipOfTheDay : Boolean;


procedure InitGeneralRegistry;

implementation //===========================================================

procedure InitGeneralRegistry;
var
  RegIni:      TRegistryIniFile;
  FileVersion: cardinal;
begin
  GeneralSection := RegGLSViewer + 'General';
  FileVersion := GetFileVersion(ParamStr(0));
  ExePath := ExtractFilePath(ParamStr(0));
  RegIni := TRegistryIniFile.Create(GeneralSection);
  try
    with RegIni do
    begin
      if not RegIni.SectionExists(GeneralSection) then
      begin
        WriteString(GeneralSection, 'ExePath', ExePath);  //Don't translate the strings
        WriteInteger(GeneralSection, 'FileVersion', FileVersion);
        WriteString(GeneralSection, 'License', 'MPL');
      end
      else
      begin
        ExePath  := ReadString(GeneralSection, 'ExePath', ExePath);
      end;
    end;
  finally
    RegIni.Free;
  end;
(*
  if RegIni.ValueExists(GeneralSection,'SplashStart') then
    SplashStart := RegIni.ReadBool(GeneralSection,'SplashStart',False)
  else
    SplashStart := True;

  if RegIni.ValueExists(GeneralSection,'TipOfTheDay') then
    TipOfTheDay := RegIni.ReadBool(GeneralSection,'TipOfTheDay', True)
  else
    TipOfTheDay := False;
*)
end;

//----------------------------------------------------------------------------
initialization //-----------------------------------------------------------

  InitGeneralRegistry;

end.
