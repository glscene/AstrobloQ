program Quintor;



uses
  Forms,
  fsRecord in 'fsRecord.pas' {FormRecord},
  fsQuintor in 'fsQuintor.pas' {FormMain},
  fsAbout in 'fsAbout.pas' {FormAbout};

{$R 'SimonRec.RES'}

begin
  Application.Initialize;
  Application.Title := 'Simon 3D';
  Application.HelpFile := '';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormRecord, FormRecord);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
