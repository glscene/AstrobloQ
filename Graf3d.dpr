program Graf3d;

uses
  Vcl.Forms,
  faGraf3d in 'source\graf\faGraf3d.pas' {FormGraf3d},
  fAbout in 'source\fAbout.pas' {FormAbout},
  dImages in 'source\dImages.pas' {dfImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGraf3d, FormGraf3d);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TdfImages, dfImages);
  Application.Run;
end.
