unit faHipparcosR;

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
  Vcl.StdCtrls,

  GLS.SceneViewer,
  GLS.BaseClasses,
  GLS.Scene,
  faHercRusselR,
  Astro.ReadHyg;

type
  TFormHipparcos = class(TForm)
    LabelStars: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    starsNoCoord: TStaticText;
    starsNoProp: TStaticText;
    starsNoPar: TStaticText;
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    procedure FormCreate(Sender: TObject);
  private
    Hip: THipparcos; // Структура данных о звезде
    NoCoord : longint; // Счетчик звёзд без точных координат
    NoProp : longint; // Счетчик звёзд без собств. движений
    NoPar : longint; // Счетчик звёзд без параллаксов
    // Листинг D.2. Подсчет звезд без данных о координатах, собственных движениях и параллаксах
    procedure TestHip;
  public
  end;

var
  FormHipparcos: TFormHipparcos;

implementation

{$R *.dfm}

//--------------------------------------------------------------------------

procedure TFormHipparcos.TestHip;
begin
  NoCoord := 0; NoProp := 0; NoPar := 0; // Обнуление счетчиков
  OpenHygMain; // Открытие каталога
  while ReadHygMain(Hip) do // Цикл чтения каталога
  begin
    // Сравнение битов в маске с константами
    if (Hip.info and NoRADE) <> 0 then
      inc(NoCoord);
    if (Hip.info and Nopm) <> 0 then
      inc(NoProp);
    if (Hip.info and NoPlx) <> 0 then
      inc(NoPar);
  end;
  CloseHygMain;
end;

//--------------------------------------------------------------------------

procedure TFormHipparcos.FormCreate(Sender: TObject);
begin
  TestHip;
  // writeln('Звёзд без точных координат ',NoCoord);
  starsNoCoord.Caption := FloatToStr(NoCoord);
  //writeln('Звёзд без собственных движений ',NoProp);
  starsNoProp.Caption := FloatToStr(NoProp);
  //writeln('Звёзд без параллаксов ', NoPar);
  starsNoPar.Caption := FloatToStr(NoPar);
end;

end.
