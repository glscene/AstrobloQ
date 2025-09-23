unit faConstPolygons;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Menus,
  Vcl.VirtualImage,


  dmImages,
  GLS.SceneViewer,
  GLS.BaseClasses,
  GLS.Scene,

  Astro.Utils,
  fmFormFirst;

type
  TFormConstPolygons = class(TfrmFirst)
    PanelLeft: TPanel;
    tvShortNames: TTreeView;
    PanelNames: TPanel;
    GLSceneViewer1: TGLSceneViewer;
    MemoData: TMemo;
    CheckBoxData: TCheckBox;
    GLScene1: TGLScene;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvShortNamesClick(Sender: TObject);
    procedure CheckBoxDataClick(Sender: TObject);
  private
    DataDir, CurrentPath, FileName: TFileName;
    procedure InsertFileInMemo(Memo: TMemo; AFileName: string;
      ReplaceSel: Boolean);
  public
  end;

var
  FormConstPolygons: TFormConstPolygons;

implementation //-------------------------------------------------------------

{$R *.dfm}

procedure TFormConstPolygons.FormCreate(Sender: TObject);
begin
  // Определяем путь к известной папке с файлами
  DataDir := GetDataPath(); //ExtractFilePath(ParamStr(0)) + 'data';
  SetCurrentDir(DataDir);
  CurrentPath := DataDir;

  // Для текстовых файлов
  FileName := DataDir + '\constellation\boundary\and.txt';
  MemoData.Lines.LoadFromFile(FileName);
(*
  // a Загрузка из стрима выдаёт китайские иероглифы
  FileName := DataDir + '\starname\starnames.dat';
  InsertFileInMemo(Memo1, FileName, False);
*)
{
   if LangID = LANG_RUSSIAN then
     FormAbout.Caption := 'O программе'
   else
     FormAbout.Caption := 'About';
}
  inherited;
end;

(*
Memo - компонент с полем ввода текста;
AFileName - полное имя файла;
ReplaceSel - если вы хотите заменить уже выбранный в Memo текст,
то передайте в параметр ReplaceSel TRUE.
FALSE используется для простой вставки текста;
*)
procedure TFormConstPolygons.InsertFileInMemo(Memo: TMemo; AFileName: string;
  ReplaceSel: Boolean);
var
  Stream: TMemoryStream;
  NullTerminator: Char;
begin
  Stream := TMemoryStream.Create;
  try
    // Loading text from file...
    Stream.LoadFromFile(AFileName);

(*
    Stream.Seek(0, 2);
    NullTerminator := #0;
    Stream.Write(NullTerminator, 1);
*)
    // Вставляем текст в Memo...
    if not ReplaceSel then
      Memo.SelLength := 0;
    SendMessage(Memo.Handle, EM_ReplaceSel, 0, LongInt(Stream.Memory));
  finally
    Stream.Free;
  end;
end;

procedure TFormConstPolygons.tvShortNamesClick(Sender: TObject);
begin
  //
  FileName := DataDir + '\constellation\boundary\'+
  tvShortNames.Selected.Text + '.txt';
//  'and.txt';
  MemoData.Lines.LoadFromFile(FileName);
end;

procedure TFormConstPolygons.Button1Click(Sender: TObject);
begin
  tvShortNames.HideSelection := False;
end;


procedure TFormConstPolygons.CheckBoxDataClick(Sender: TObject);
begin
  MemoData.Visible := CheckBoxData.Checked;
end;

end.
