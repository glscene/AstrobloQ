unit fxGalaxy;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Menus,
  FMX.Layouts,
  FMX.TreeView,

  fxForm,
  fxAbout,
  fxSettings,
  fxAstrogen,
  dxDialogs,
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,

  gnuGettext, System.Actions, FMX.ActnList, FMX.StdCtrls  // for translation
  ;

type
  TfrmGalaxy = class(TFormO)
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
    Langs: TLang;
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
    procedure frmCreate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miStarsysGenClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miWikiClick(Sender: TObject);
  private
  public
    DataDir, StarDir, CurrentStar: TFileName;
    PlanetPath, CatalogName: TFileName;
    procedure ProcessMenu(const AMainMenu: TMainMenu; IsAuto: Boolean);
  end;

var
  frmGalaxy: TfrmGalaxy;

implementation //-------------------------------------------------------------

{$R *.fmx}

procedure TfrmGalaxy.ProcessMenu(const AMainMenu: TMainMenu; IsAuto: Boolean);
var
  I: Integer;
begin
  // MainMenu items translations
  miFile.AutoTranslate := IsAuto;
  miFile.Text := _(miFile.Text);
  for I := 0 to miFile.ItemsCount - 1 do
  begin
    miFile.Items[I].AutoTranslate := IsAuto;
    miFile.Items[I].Text := _(miFile.Items[I].Text);
  end;
  miMethod.AutoTranslate := IsAuto;
  miMethod.Text := _(miMethod.Text);
  for I := 0 to miMethod.ItemsCount - 1 do
  begin
    miMethod.Items[I].AutoTranslate := IsAuto;
    miMethod.Items[I].Text := _(miMethod.Items[I].Text);
  end;
  miView.AutoTranslate := IsAuto;
  miView.Text := _(miView.Text);
  for I := 0 to miView.ItemsCount - 1 do
  begin
    miView.Items[I].AutoTranslate := IsAuto;
    miView.Items[I].Text := _(miView.Items[I].Text);
  end;
  miTools.AutoTranslate := IsAuto;
  miTools.Text := _(miTools.Text);
  for I := 0 to miTools.ItemsCount - 1 do
  begin
    miTools.Items[I].AutoTranslate := IsAuto;
    miTools.Items[I].Text := _(miTools.Items[I].Text);
  end;
  miHelp.AutoTranslate := IsAuto;
  miHelp.Text := _(miHelp.Text);
  for I := 0 to miHelp.ItemsCount - 1 do
  begin
    miHelp.Items[I].AutoTranslate := IsAuto;
    miHelp.Items[I].Text := _(miHelp.Items[I].Text);
  end;
end;

//---------------------------------------------------------------------------
procedure TfrmGalaxy.frmCreate(Sender: TObject);
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

procedure TfrmGalaxy.miSettingsClick(Sender: TObject);
begin
  inherited;
  frmSettings.Show;
end;

//--------------------------------------------------------------------------
procedure TfrmGalaxy.miOpenClick(Sender: TObject);
var
  I, J: Integer;
begin
  dmDialogs.OpenDialog.Filter := '_(Planet system)' + '(*.star)|*.star';
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
    (**)
///    tvPlanets.Select(tvPlanets.Items[0]);
///    tvPlanetsClick(Sender);
  end;
end;


//---------------------------------------------------------------------------

procedure TfrmGalaxy.miStarsysGenClick(Sender: TObject);
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


//---------------------------------------------------------------------------

procedure TfrmGalaxy.miWikiClick(Sender: TObject);
begin
  //
end;

//--------------------------------------------------------------------------

procedure TfrmGalaxy.miAboutClick(Sender: TObject);
begin
  inherited;
  FormAbout := TFormAbout.Create(Application);
  FormAbout.ShowModal;
  FormAbout.Free;
end;

//---------------------------------------------------------------------------

procedure TfrmGalaxy.miExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
