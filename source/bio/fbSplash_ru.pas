unit fbSplash_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Imaging.Jpeg,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,

  vSplashScreen, Vcl.Imaging.pngimage;

type
  TFormSplash = class(TForm)
    SplashTimer: TTimer;
    imgBackdrop: TImage;
    labVersion: TLabel;
    labBuild: TLabel;
    Label1: TLabel;
    labButton: TLabel;
    TimerClose: TTimer;
    procedure SplashTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure imgBackdropClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClick(Sender: TObject);
    procedure TimerCloseTimer(Sender: TObject);
  private

  public

  end;

var
  FormSplash: TFormSplash;

implementation //-------------------------------------------------------------

uses
  fbAbout_ru;

{$R *.DFM}

procedure TFormSplash.SplashTimerTimer(Sender: TObject);
begin
  labButton.Visible := not labButton.Visible;
end;

procedure TFormSplash.FormCreate(Sender: TObject);
var
  myAboutInfo: TAboutInfo;
begin
  // Width := imgBackdrop.Picture.Bitmap.Width;
  // Height := imgBackdrop.Picture.Bitmap.Height;

  myAboutInfo := TAboutInfo.Create(ParamStr(0));
  // labVersion.Caption := 'Версия ' + myAboutInfo.FileVersion;
  labVersion.Caption := 'Версия ' + myAboutInfo.FileVersionNoBuild;
  labBuild.Caption := 'v' + myAboutInfo.FileVersion + ' compiled on ' + myAboutInfo.FileBuildDate;
  myAboutInfo.Free;

  // SetWindowRgn(Handle, BitmapToRegion(imgBackdrop.Picture.Bitmap.Handle, clNone, 10), true);
end;

procedure TFormSplash.FormPaint(Sender: TObject);
begin
  // Canvas.Draw(0, 0, imgBackDrop.Picture.Bitmap);
end;

procedure TFormSplash.imgBackdropClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSplash.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Close;
end;

procedure TFormSplash.FormClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSplash.TimerCloseTimer(Sender: TObject);
begin
  Close;
end;

end.
