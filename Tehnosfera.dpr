program Tehnosfera;

uses
  Vcl.Forms,
  ftTehnosfera in 'source\teh\ftTehnosfera.pas' {FormTehnosfera},
  uGlobals in 'source\uGlobals.pas',
  ftCyborg in 'source\teh\ftCyborg.pas' {FormCyborg},
  ftRobot in 'source\teh\ftRobot.pas' {FormLoadSmdMdl},
  ftStarPilot in 'source\teh\ftStarPilot.pas' {FormSpacePilot},
  Teh.BoneUtils in 'source\teh\Teh.BoneUtils.pas',
  fForm in 'source\fForm.pas' {FormI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTehnosfera, FormTehnosfera);
  Application.CreateForm(TFormI, FormI);
  Application.Run;
end.
