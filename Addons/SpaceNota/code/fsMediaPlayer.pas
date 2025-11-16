unit fsMediaPlayer;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Win.TaskbarCore,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Taskbar,
  Vcl.MPlayer,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.Outline,
  Vcl.Samples.DirOutln,

  GLS.Scene;

type
  TfrmMediaPlayer = class(TForm)
    Panel1: TPanel;
    MediaPlayer1: TMediaPlayer;
    OpenDialog1: TOpenDialog;
    Taskbar1: TTaskbar;
    GLMemoryViewer1: TGLMemoryViewer;
    ListBox1: TListBox;
    procedure Panel1DblClick(Sender: TObject);
    procedure Taskbar1ThumbButtonClick(Sender: TObject; AButtonID: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmMediaPlayer: TfrmMediaPlayer;

implementation //=============================================================

{$R *.dfm}

procedure TfrmMediaPlayer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MediaPlayer1.Close;
end;

procedure TfrmMediaPlayer.Panel1DblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MediaPlayer1.FileName := OpenDialog1.FileName;
    MediaPlayer1.Open;
  end;
end;

procedure TfrmMediaPlayer.Taskbar1ThumbButtonClick(Sender: TObject; AButtonID: Integer);
begin
  case  AButtonID of
    0: MediaPlayer1.Play;
    1: MediaPlayer1.Pause;
  end;
end;

end.
