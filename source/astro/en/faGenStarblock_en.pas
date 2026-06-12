unit faGenStarblock_en;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,

  GLS.Cadencer,
  GLS.Scene,
  GLS.Objects,
  Stage.Coordinates,
  Stage.BaseClasses,
  GLS.SimpleNavigation,
  GLS.SceneViewer
  ;

type
  TfrmGenStarblock = class(TForm)
    StatusBar1: TStatusBar;
    GLSceneViewer1: TGLSceneViewer;
    Panel1: TPanel;
    Label2: TLabel;
    ShapeO: TShape;
    ShapeA: TShape;
    ShapeF: TShape;
    ShapeG: TShape;
    ShapeK: TShape;
    ShapeM: TShape;
    ShapeB: TShape;
    ButtonClear: TButton;
    chbO: TCheckBox;
    chbB: TCheckBox;
    chbA: TCheckBox;
    chbF: TCheckBox;
    chbG: TCheckBox;
    chbK: TCheckBox;
    chbM: TCheckBox;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLTypeM: TGLPoints;
    GLTypeK: TGLPoints;
    GLTypeG: TGLPoints;
    GLTypeF: TGLPoints;
    GLTypeA: TGLPoints;
    GLTypeB: TGLPoints;
    GLTypeO: TGLPoints;
    GLPoints1: TGLPoints;
    GLLightSource1: TGLLightSource;
    GLCadencer1: TGLCadencer;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenCSV1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    OpenTextFileDialog1: TOpenTextFileDialog;
    GLSimpleNavigation1: TGLSimpleNavigation;
    procedure OpenCSV1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Path: TFileName;
    X, Y, Z, G: Double;
  public

  end;

var
  frmGenStarblock: TfrmGenStarblock;

implementation //=============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TfrmGenStarblock.FormCreate(Sender: TObject);
begin
  Path := GetCurrentDir();
  SetCurrentDir(Path);
end;

//----------------------------------------------------------------------------
procedure TfrmGenStarblock.OpenCSV1Click(Sender: TObject);
var
  i, acount,
  start, finish: Integer;
  FX, FY, FZ, FSpect, FVx, FVy, FVz: Byte; // coordinate fields and velocities
  FH: Byte; // index of habitability of star system
  FullType: String;
  Sl,               // the whole CSV file,
  Tl: TStringList;  // current line with comma delimeters for fileds
  aType: String;

begin
  OpenTextFileDialog1.InitialDir := Path;
  OpenTextFileDialog1.Filter := 'CSV files (*.csv)';
  FormatSettings.DecimalSeparator := '.';

  // Open hygdata.csv
  if (OpenTextFileDialog1.Execute()) then
  begin
	  Sl.LoadFromFile(OpenTextFileDialog1.FileName); //loading CSV file
	  Tl.CommaText := Sl.Strings[0];   // reading the first line with field names

    // Define indices of fields x, y, z and spect
    for i := 0 to Tl.Count - 1 do
    begin
      if (Tl[0][i] = 'x') then
      FX := i
      else if (Tl[0][i] = 'y') then
      FY := i
      else if (Tl[0][i] = 'z') then
      FZ := i
      else if (Tl[0][i] = 'spect') then
      FSpect := i;
    end;

///  	start := Timer1.  // clock();
	  acount := 0;

    for i := 1 to Sl.Count - 1 do
    begin
      Tl.CommaText := Sl.Strings[i];
      begin
      X := StrToFloat(Tl[0][FX]) * 0.2;
      Y := StrToFloat(Tl[0][FY]) * 0.2;
      Z := StrToFloat(Tl[0][FZ]) * 0.2;

      FullType := Tl[0][FSpect];

      // CSV)
      if (FullType = '') then FullType := 'A';

      aType := FullType.SubString(0, 1);

      // Class "O"
      if (aType = 'O')  then
      begin
        GLTypeO.Colors.AddPoint(0, 0, 255);  // (cR, cG, CB)
        GLTypeO.Positions.Add(X, Y, Z);
        GLTypeO.Size := 2;
      end
      // Class "B"
      else if (aType = 'B') then
      begin
        GLTypeB.Colors.AddPoint(0, 255, 255);  // (cR, cG, CB)
        GLTypeB.Positions.Add(X, Y, Z);
        GLTypeB.Size := 2;
      end
      // Class "A"
      else if (aType = 'A') then
      begin
        GLTypeA.Colors.AddPoint(255, 255, 255);  // (cR, cG, CB)
        GLTypeA.Positions.Add(X, Y, Z);
        GLTypeA.Size := 2;
      end
      // Class "F"
      else if (aType = 'F')  then
      begin
        GLTypeF.Colors.AddPoint(0, 255, 0);  // (cR, cG, CB)
        GLTypeF.Positions.Add(X, Y, Z);
        GLTypeF.Size := 2;
      end
      // Class "G"
      else if (aType = 'G')  then
      begin
        GLTypeG.Colors.AddPoint(255, 255, 0);  // (cR, cG, CB)
        GLTypeG.Positions.Add(X, Y, Z);
        GLTypeG.Size := 2;
      end
      // Class "K"
      else if (aType = 'K') then
      begin
        GLTypeK.Colors.AddPoint(255, 0, 255);  // (cR, cG, CB)
        GLTypeK.Positions.Add(X, Y, Z);
        GLTypeK.Size := 2;
      end
      // Class "M"
      else
      begin
        GLTypeM.Colors.AddPoint(254, 0, 0);  // (cR, cG, CB)
        GLTypeM.Positions.Add(X, Y, Z);
        GLTypeM.Size := 3;
      end;
      acount := acount + 1;
    end;

///	finish = clock();
///	ex_time = (finish - start) / (double)CLOCKS_PER_SEC;

  	Sl.Free;
	  Tl.Free;
    end;
  end;
end;

//----------------------------------------------------------------------------
end.
