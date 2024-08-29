program TLangTrans;

uses
  FMX.Forms,
  fxTLangTrans in 'fxTLangTrans.pas' {fmMainSampleTLang},
  fxAbout in 'fxAbout.pas' {fmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMainSampleTLang, fmMainSampleTLang);
  Application.CreateForm(TfmAbout, fmAbout);
  Application.Run;
end.
