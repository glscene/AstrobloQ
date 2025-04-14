unit fxUniversumR;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Actions,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Menus,
  FMX.Layouts,
  FMX.TreeView,

  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,

  FMX.ActnList,
  FMX.StdCtrls,

  //  fxVolumeRenderR,
  fxForm,
  fxAboutR,
  fxOptionsR,
  fxAstrogenR
  ;

type
  TfrmUniversum = class(TFormX)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miExit: TMenuItem;
    miView: TMenuItem;
    miTools: TMenuItem;
    miSettings: TMenuItem;
    miHelp: TMenuItem;
    miWiki: TMenuItem;
    miAbout: TMenuItem;
    miStarsysGen: TMenuItem;
    miDivider1: TMenuItem;
    tvPlanets: TTreeView;
    tviPlanet: TTreeViewItem;
    TreeViewItemMoon: TTreeViewItem;
    miSolarSystem: TMenuItem;
    ActionList: TActionList;
    acFileOpen: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    miMethod: TMenuItem;
    miGridding: TMenuItem;
    miTetralization: TMenuItem;
    miInterpolation: TMenuItem;
    ToolBar1: TToolBar;
    acFileExit: TAction;
    tviPlanetoid: TTreeViewItem;
    tviStar: TTreeViewItem;
    miScatterPlot: TMenuItem;
    miVolumeRender: TMenuItem;
    procedure frmCreate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miStarsysGenClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miWikiClick(Sender: TObject);
    procedure miScatterPlotClick(Sender: TObject);
    procedure miVolumeRenderClick(Sender: TObject);
  private
  public
    DataDir, StarDir, CurrentStar: TFileName;
    PlanetPath, CatalogName: TFileName;
    procedure ProcessMenu(const AMainMenu: TMainMenu; IsAuto: Boolean);
  end;

var
  frmUniversum: TfrmUniversum;

implementation //-------------------------------------------------------------

{$R *.fmx}

uses
  fxScatterPlotR;


procedure TfrmUniversum.ProcessMenu(const AMainMenu: TMainMenu; IsAuto: Boolean);
var
  I: Integer;
begin
  // MainMenu items translations
  miFile.AutoTranslate := IsAuto;
  for I := 0 to miFile.ItemsCount - 1 do
  begin
    miFile.Items[I].AutoTranslate := IsAuto;
  end;
  miMethod.AutoTranslate := IsAuto;
  for I := 0 to miMethod.ItemsCount - 1 do
  begin
    miMethod.Items[I].AutoTranslate := IsAuto;
  end;
  miView.AutoTranslate := IsAuto;
  for I := 0 to miView.ItemsCount - 1 do
  begin
    miView.Items[I].AutoTranslate := IsAuto;
  end;
  miTools.AutoTranslate := IsAuto;
  for I := 0 to miTools.ItemsCount - 1 do
  begin
    miTools.Items[I].AutoTranslate := IsAuto;
  end;
  miHelp.AutoTranslate := IsAuto;
  for I := 0 to miHelp.ItemsCount - 1 do
  begin
    miHelp.Items[I].AutoTranslate := IsAuto;
  end;
end;

//---------------------------------------------------------------------------
procedure TfrmUniversum.frmCreate(Sender: TObject);
var
  I: Integer;
begin
  ReadInifile;
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('astrobloq', DataDir) + 9, Length(DataDir));
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir);

  // MainMenu Translation
  ProcessMenu(MainMenu, True);

  StarDir := DataDir + '\star\';
  tvPlanets.ExpandAll;
  inherited;
end;

procedure TfrmUniversum.miSettingsClick(Sender: TObject);
begin
  inherited;
  frmSettings.Show;
end;

//--------------------------------------------------------------------------
procedure TfrmUniversum.miOpenClick(Sender: TObject);
var
  I, J: Integer;
begin
(*
  dmDialogs.OpenDialog.Filter := 'Planet system' + '(*.star)|*.star';
  dmDialogs.OpenDialog.InitialDir := StarDir;
  dmDialogs.OpenDialog.DefaultExt := '*.star';
  if dmDialogs.OpenDialog.Execute then
  begin  // new star
///    tvPlanets.LoadFromFile(dmDialogs.OpenDialog.FileName, TEncoding.UTF8);
    // tvPlanets.Images := dfImages.ImgVirtPlanets; // не загружаются символы
    CurrentStar := ExtractFilePath(dmDialogs.OpenDialog.FileName);

    // Assigning indices
    for I := 0 to tvPlanets.Items[I].Count - 1 do
    begin
      tvPlanets.Items[I].ImageIndex := I;
///      tvPlanets.Items[I].SelectedIndex := I;
///      tvPlanets.Items[I].StateIndex := -1;
    end;
///    tvPlanets.Select(tvPlanets.Items[0]);
///    tvPlanetsClick(Sender);
*)
end;


//---------------------------------------------------------------------------
procedure TfrmUniversum.miStarsysGenClick(Sender: TObject);
begin
  inherited;
  // Load astrogenerator and exoplanet constructor
  with TFormAstrogen.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmUniversum.miVolumeRenderClick(Sender: TObject);
begin
  inherited;
(*
  with TFormTexture3D.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
*)
end;

//---------------------------------------------------------------------------
procedure TfrmUniversum.miScatterPlotClick(Sender: TObject);
begin
  inherited;
  with TFormScatterPlot.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;

end;


//---------------------------------------------------------------------------

procedure TfrmUniversum.miWikiClick(Sender: TObject);
begin
  //
end;

//--------------------------------------------------------------------------

procedure TfrmUniversum.miAboutClick(Sender: TObject);
begin
  inherited;
  FormAbout := TFormAbout.Create(Application);
  FormAbout.ShowModal;
  FormAbout.Free;
end;

//---------------------------------------------------------------------------

procedure TfrmUniversum.miExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
