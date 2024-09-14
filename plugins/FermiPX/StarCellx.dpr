program StarCellx;

uses
  System.StartUpCopy,
  FMX.Forms,
  fxStarCells in 'srcex\fxStarCells.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
