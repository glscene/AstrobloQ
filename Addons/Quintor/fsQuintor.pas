unit fsQuintor;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.MMSystem,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Controls,
  GLS.Scene,
  GLS.Objects,
  Stage.VectorGeometry,
  GLS.SceneViewer,
  GLS.VectorFileObjects,
  Stage.VectorTypes,
  GLS.Material,
  GLS.State,
  GLS.BitmapFont,
  GLS.WindowsFont,
  GLS.File3DS,
  GLS.HUDObjects,
  GLS.Texture,
  GLS.Coordinates,
  GLS.BaseClasses;

type
  TFormMain = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    DummyCube1: TGLDummyCube;
    Red1: TGLFreeForm;
    Green4: TGLFreeForm;
    Yellow3: TGLFreeForm;
    Blue2: TGLFreeForm;
    btnNextStage: TButton;
    Timer1: TTimer;
    Base1: TGLFreeForm;
    GLWindowsBitmapFont1: TGLWindowsBitmapFont;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    miGame: TMenuItem;
    miHelp: TMenuItem;
    miNew: TMenuItem;
    miContents: TMenuItem;
    miSep1: TMenuItem;
    miAbout: TMenuItem;
    GLLightSource1: TGLLightSource;
    GLLightSource2: TGLLightSource;
    miSep2: TMenuItem;
    miExit: TMenuItem;
    miSep3: TMenuItem;
    miBestScores: TMenuItem;
    miView: TMenuItem;
    miPerspective3D: TMenuItem;
    miTop3D: TMenuItem;
    miSep4: TMenuItem;
    miWireframe: TMenuItem;
    procedure LoadResourceTexture(ResourceName: String; Texture: TGLTexture);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TocaSom(Sons: String);
    procedure Roda(aKey: TGLFreeForm);
    procedure btnNextStageClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure miNewClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miBestScoresClick(Sender: TObject);
    procedure miContentsClick(Sender: TObject);
    procedure miPerspective3DClick(Sender: TObject);
    procedure miTop3DClick(Sender: TObject);
    procedure miWireframeClick(Sender: TObject);
  public
  end;

var
  FormMain: TFormMain;
  mdx, mdy: Integer;
  old_color, new_color: TVector4f;
  color_a, color_n: TVector4f;
  notacerta, notaclicada: string;
  IsGameStarted: Boolean;
  S1, S2, S3, S4: string;
  Pontos: Integer;
  pickdown: TGLCustomSceneObject;
  pickup: TGLCustomSceneObject;

const
  clrWhite: TGLVector = (X: 1; Y: 1; Z: 1; W: 1);

implementation //=============================================================

uses
  fsRecord;

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
var
  KeyRes, BaseRes: TResourceStream;     // resources for keys
  redt, bluet, yellowt, greent: TGLTexture;
begin
  redt := TGLTexture.Create(self);
  LoadResourceTexture('Red1', redt);
  bluet := TGLTexture.Create(self);
  LoadResourceTexture('Blue2', bluet);
  yellowt := TGLTexture.Create(self);
  LoadResourceTexture('Yellow3', yellowt);
  greent := TGLTexture.Create(self);
  LoadResourceTexture('Green4', greent);
  KeyRes := TResourceStream.Create(hinstance, 'pedaco', '3DS');
  BaseRes := TResourceStream.Create(hinstance, 'base', '3DS');
  Red1.LoadFromStream('pedaco.3ds', KeyRes);
  Red1.Material.Texture.Image := redt.Image;
  Blue2.LoadFromStream('pedaco.3ds', KeyRes);
  Blue2.Material.Texture.Image := bluet.Image;
  Yellow3.LoadFromStream('pedaco.3ds', KeyRes);
  Yellow3.Material.Texture.Image := yellowt.Image;
  Green4.LoadFromStream('pedaco.3ds', KeyRes);
  Green4.Material.Texture.Image := greent.Image;
  Base1.LoadFromStream('base.3ds', BaseRes);
  IsGameStarted := false;
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  Pontos := 0;
end;


procedure TFormMain.LoadResourceTexture(ResourceName: String; Texture: TGLTexture);
var
  B: TBitmap;
  RS: TResourceStream;
begin
  RS := TResourceStream.Create(0, ResourceName, 'BMP');
  try
    B := TBitmap.Create;
    try
      B.LoadFromStream(RS);
      Texture.Image.Assign(B);
    finally
      B.Free;
    end;
  finally
    RS.Free;
  end;
end;

procedure TFormMain.GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  // if Shift<>[] then
  if Shift = [ssRight] then
    GLCamera1.MoveAroundTarget(mdy - Y, mdx - X);
  mdx := X;
  mdy := Y;
end;

//---------------------------------------------------------------------------

procedure TFormMain.GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then // test if the clicked mouse button was left
  begin
    pickdown := (GLSceneViewer1.Buffer.GetPickedObject(X, Y)
      as TGLCustomSceneObject);
    if Assigned(pickdown) and (pickdown is TGLFreeForm) then
    begin
      old_color := pickdown.Material.FrontProperties.Emission.Color;
      new_color := vectorlerp(old_color, clrWhite, 0.25);
      if pickdown.Name = 'Base1' then
        pickdown.Material.FrontProperties.Emission.Color := old_color
      else
        pickdown.Material.FrontProperties.Emission.Color := new_color;
    end;
  end;
end;

//----------------------------------------------------------------------------

procedure TFormMain.GLSceneViewer1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  aKey: string;
  tammenor, tammaior: Integer;
  Nome: string;
begin
  if Button = mbLeft then // check if the mouse button is still pressed
  begin
    pickup := (GLSceneViewer1.Buffer.GetPickedObject(X, Y)
      as TGLCustomSceneObject);
    if Assigned(pickup) then
      if (pickup = pickdown) and (pickup is TGLFreeForm) then
      begin
        pickup.Material.FrontProperties.Emission.Color := old_color;
        if pickup.Name = 'Red1' then
        begin
          S1 := S1 + '1';
          // sndPlaySound('red.wav',snd_ASync);
          PlaySound('Red', hinstance, SND_RESOURCE or SND_ASYNC);
        end;
        if pickup.Name = 'Blue2' then
        begin
          S1 := S1 + '2';
          // sndPlaySound('Blue.wav',snd_ASync);
          PlaySound('Blue', hinstance, SND_RESOURCE or SND_ASYNC);
        end;
        if pickup.Name = 'Yellow3' then
        begin
          S1 := S1 + '3';
          // sndPlaySound('Yellow.wav',snd_ASync);
          PlaySound('Yellow', hinstance, SND_RESOURCE or SND_ASYNC);
        end;
        if pickup.Name = 'Green4' then
        begin
          S1 := S1 + '4';
          // sndPlaySound('Green.wav',snd_ASync);
          PlaySound('Green', hinstance, SND_RESOURCE or SND_ASYNC);
        end;
      end;
    if (pickdown is TGLFreeForm) and (pickup <> pickdown) then
    begin
      pickdown.Material.FrontProperties.Emission.Color := old_color;
      if pickdown.Name = 'Red1' then
      begin
        S1 := S1 + '1';
        // sndPlaySound('red.wav',snd_ASync);
        PlaySound('Red', hinstance, SND_RESOURCE or SND_ASYNC);
      end;
      if pickdown.Name = 'Blue2' then
      begin
        S1 := S1 + '2';
        // sndPlaySound('blue.wav',snd_ASync);
        PlaySound('Blue', hinstance, SND_RESOURCE or SND_ASYNC);
      end;
      if pickdown.Name = 'Yellow3' then
      begin
        S1 := S1 + '3';
        // sndPlaySound('yellow.wav',snd_ASync);
        PlaySound('Yellow', hinstance, SND_RESOURCE or SND_ASYNC);
      end;
      if pickdown.Name = 'Green4' then
      begin
        S1 := S1 + '4';
        // sndPlaySound('green.wav',snd_ASync);
        PlaySound('Green', hinstance, SND_RESOURCE or SND_ASYNC);
      end;
    end;
    tammenor := length(S1);
    tammaior := length(S2);
    aKey := copy(S2, 1, tammenor);
    if (IsGameStarted = true) and (CompareStr(aKey, S1) <> 0) then
    begin
      // sndPlaySound('error.wav',snd_ASync);
      PlaySound('Error', hinstance, SND_RESOURCE or SND_ASYNC);
      IsGameStarted := false;
      btnNextStage.Visible := false;
      S3 := 'Game over';    // show videogame
      // begins the block of records
      Application.CreateForm(TFormRecord, FormRecord); // load form into memory
      if FormRecord.TestaRecorde(IntToStr(Pontos)) then
      begin
        Nome := InputBox('Best Scores', 'Type your name', '');
        FormRecord.AddRecord(IntToStr(Pontos), Nome);
        FormRecord.ShowModal; // show form in exclusive mode
        FormRecord.Free; // free memory
      end;
      // end of the block of memories
    end
    else if (tammenor = tammaior) and (IsGameStarted = true) then
    begin
      S1 := '';
      S3 := 'Stage completed';
      Inc(Pontos);
      S4 := IntToStr(Pontos) + ' Points';
      btnNextStage.Visible := true;
    end
    else
      S3 := '';
  end;
end;

procedure TFormMain.TocaSom(Sons: String);
Var
  I, K: Integer;
  J: String;
begin
  S2 := '';
  K := length(Sons);
  for I := 1 to K do
  begin
    J := Sons[I];
    if (J = '1') then
    begin
      S2 := S2 + '1';
      Roda(Red1);
    end;
    if (J = '2') then
    begin
      S2 := S2 + '2';
      Roda(Blue2);
    end;
    if (J = '3') then
    begin
      S2 := S2 + '3';
      Roda(Yellow3);
    end;
    if (J = '4') then
    begin
      S2 := S2 + '4';
      Roda(Green4);
    end;
    sleep(450);
  end;
end;

procedure TFormMain.Roda(aKey: TGLFreeForm);
begin
  if aKey.Name = 'Red1' then
  begin
    color_a := FormMain.Red1.Material.FrontProperties.Emission.Color;
    color_n := VectorLerp(color_a, clrWhite, 0.25);
    Red1.Material.FrontProperties.Emission.Color := color_n;
    GLSceneViewer1.Update;
    sleep(50);
    Red1.Material.FrontProperties.Emission.Color := color_a;
    // sndPlaySound('red.wav',snd_ASync);
    PlaySound('Red', hinstance, SND_RESOURCE or SND_ASYNC);
  end;
  if aKey.Name = 'Blue2' then
  begin
    color_a := FormMain.Blue2.Material.FrontProperties.Emission.Color;
    color_n := VectorLerp(color_a, clrWhite, 0.25);
    Blue2.Material.FrontProperties.Emission.Color := color_n;
    GLSceneViewer1.Update;
    sleep(50);
    Blue2.Material.FrontProperties.Emission.Color := color_a;
    // sndPlaySound('blue.wav',snd_ASync);
    PlaySound('Blue', hinstance, SND_RESOURCE or SND_ASYNC);
  end;
  if aKey.Name = 'Yellow3' then
  begin
    color_a := FormMain.Yellow3.Material.FrontProperties.Emission.Color;
    color_n := vectorlerp(color_a, clrWhite, 0.25);
    Yellow3.Material.FrontProperties.Emission.Color := color_n;
    GLSceneViewer1.Update;
    sleep(50);
    Yellow3.Material.FrontProperties.Emission.Color := color_a;
    // sndPlaySound('yellow.wav',snd_ASync);
    PlaySound('Yellow', hinstance, SND_RESOURCE or SND_ASYNC);
  end;
  if aKey.Name = 'Green4' then
  begin
    color_a := FormMain.Green4.Material.FrontProperties.Emission.Color;
    color_n := VectorLerp(color_a, clrWhite, 0.25);
    Green4.Material.FrontProperties.Emission.Color := color_n;
    GLSceneViewer1.Update;
    sleep(50);
    Green4.Material.FrontProperties.Emission.Color := color_a;
    // sndPlaySound('green.wav',snd_ASync);
    PlaySound('Green', hinstance, SND_RESOURCE or SND_ASYNC);
  end;
end;

procedure TFormMain.btnNextStageClick(Sender: TObject);
begin

  if IsGameStarted = true then
  begin
    btnNextStage.Visible := false;
    Randomize;
    notacerta := notacerta + IntToStr(Random(4) + 1);
    TocaSom(notacerta);
    S1 := '';
    S3 := '';
  end;

end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  // Caption:=Format('%.1f FPS', [GLSceneViewer1.FramesPerSecond]);
  GLSceneViewer1.ResetPerformanceMonitor;
  StatusBar1.Panels[0].Text := S4;
  StatusBar1.Panels[1].Text := S3;
end;

procedure TFormMain.miNewClick(Sender: TObject);
begin
  IsGameStarted := true;
  notacerta := '';
  btnNextStage.Click;
  S4 := '0 Points';
  S3 := '';
  Pontos := 0;
end;

procedure TFormMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.miBestScoresClick(Sender: TObject);
begin
  Application.CreateForm(TFormRecord, FormRecord);
  FormRecord.ShowModal;
  FormRecord.Free;
end;

procedure TFormMain.miContentsClick(Sender: TObject);
begin
  // Application.HelpFile:='Simon3D.hlp';
  // Application.helpcommand(HELP_CONTENTS,0);
end;

procedure TFormMain.miPerspective3DClick(Sender: TObject);
begin
  GLCamera1.Position.X := 6;
  GLCamera1.Position.Y := 6;
  GLCamera1.Position.Z := 6;
end;

procedure TFormMain.miTop3DClick(Sender: TObject);
begin
  GLCamera1.Position.X := 0;
  GLCamera1.Position.Y := 10;
  GLCamera1.Position.Z := 0;
  GLCamera1.MoveAroundTarget(-45, 0);
  GLSceneViewer1.Update;
end;

procedure TFormMain.miWireframeClick(Sender: TObject);
begin
  miWireframe.Checked := not miWireframe.Checked;
  if miWireframe.Checked = true then
  begin
    Base1.Material.PolygonMode := pmLines;
    Red1.Material.PolygonMode := pmLines;
    Blue2.Material.PolygonMode := pmLines;
    Yellow3.Material.PolygonMode := pmLines;
    Green4.Material.PolygonMode := pmLines;
  end
  else
  begin
    Base1.Material.PolygonMode := pmFill;
    Red1.Material.PolygonMode := pmFill;
    Blue2.Material.PolygonMode := pmFill;
    Yellow3.Material.PolygonMode := pmFill;
    Green4.Material.PolygonMode := pmFill;
  end;
end;

end.
