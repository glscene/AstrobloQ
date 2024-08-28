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

  gnuGettext  // for translation
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
    miAstrogen: TMenuItem;
    miDivider1: TMenuItem;
    tvPlanets: TTreeView;
    TreeViewItemStar: TTreeViewItem;
    TreeViewItemPlanet: TTreeViewItem;
    TreeViewItemMoon: TTreeViewItem;
    TreeViewItemGalaxy: TTreeViewItem;
    miSolarSystem: TMenuItem;
    procedure frmCreate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miAstrogenClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miWikiClick(Sender: TObject);
  private
  public
    DataDir, StarDir, CurrentStar: TFileName;
    PlanetPath, CatalogName: TFileName;
    procedure ProcessMenu(AMenu: TMenuItem);
  end;

var
  frmGalaxy: TfrmGalaxy;

implementation //-------------------------------------------------------------

{$R *.fmx}

procedure TfrmGalaxy.ProcessMenu(AMenu: TMenuItem);
var
  I: integer;
begin
  for I := 0 to AMenu.ItemsCount - 1 do
  begin
    AMenu.Items[I].Text := _(AMenu.Items[I].Text);
  end;
end;

procedure TfrmGalaxy.frmCreate(Sender: TObject);
var
  I: Integer;
begin
  ReadInifile;
  DataDir := LowerCase(ExtractFilePath(ParamStr(0)));
  Delete(DataDir, Pos('astrobloq', DataDir) + 9, Length(DataDir));
  DataDir := IncludeTrailingPathDelimiter(DataDir) + 'data';
  SetCurrentDir(DataDir);

  ProcessMenu(miFile);
  ProcessMenu(miView);
  ProcessMenu(miTools);
  ProcessMenu(miHelp);


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

procedure TfrmGalaxy.miAstrogenClick(Sender: TObject);
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
