unit fxStarSyx;

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
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.TreeView;

type
  TFormPlanetMoons = class(TForm)
    TreeView: TTreeView;
    ButtonLoad: TButton;
    ButtonEnum: TButton;
    ButtonGlobalIndex: TButton;
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonEnumClick(Sender: TObject);
    procedure ButtonGlobalIndexClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    NPlanets, NPlanetoids, NMoons, NAll: Integer;
  public
  end;

var
  FormPlanetMoons: TFormPlanetMoons;

implementation //==============================================================

{$R *.fmx}


procedure AddToItem(const aIndex: Integer; const aTV: TTreeView; const aBody: String;
  const aParentItem: TTreeViewItem = nil);
var
  aItem: TTreeViewItem;
begin
  aItem := TTreeViewItem.Create(aTV);
  aItem.Text := aBody + aIndex.ToString;
  aItem.Tag := aIndex;
  if aParentItem = nil then
    aTV.AddObject(aItem)
  else
    aParentItem.AddObject(aItem);
end;

//--------------------------------------------------------------------------

procedure TFormPlanetMoons.FormCreate(Sender: TObject);
begin
  NPlanets := 8;
  NMoons := 12;
  NPlanetoids := 5;
  NAll := NPlanets + NMoons + NPlanetoids;
end;

//--------------------------------------------------------------------------

procedure TFormPlanetMoons.ButtonLoadClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to NPlanets - 1 do
    AddToItem(i, TreeView, 'Planet ', nil);

  for I := 0 to NPlanets - 1 do // NMoons ?
    AddToItem(I + NPlanets, TreeView, 'Moon ', TreeView.ItemByIndex(I));

//  for I := 0 to NPlanetoids - 1 do
//    AddToItem(i, TreeView, 'Planetoids ', nil);

  for I := 0 to NPlanets - 1 do
    AddToItem(I + NPlanets + 10, TreeView, 'Moon ', TreeView.ItemByIndex(I));
end;

//--------------------------------------------------------------------------

procedure TFormPlanetMoons.ButtonEnumClick(Sender: TObject);
var
  aItem: TTreeViewItem;
begin
  aItem := nil;
  TreeView.EnumControls(
    function(Control: TControl): TEnumControlsResult
    begin
      if (Control is TTreeViewItem) then
      begin
        if (Control as TTreeViewItem).Tag = 20 then // find Tag with the number
        begin
          aItem := (Control as TTreeViewItem);
          TreeView.ExpandAll;
          Result := TEnumControlsResult.Discard;
        end
        else
          Result := TEnumControlsResult.Continue;
      end
      else
        Result := TEnumControlsResult.Continue;
    end);

  ShowMessage('Moon: ' + aItem.Text + sLineBreak +
              'Planet: ' + aItem.ParentItem.Index.ToString + sLineBreak +
              'Index in Planet: ' + aItem.Index.ToString);
end;

//----------------------------------------------------------------------------

procedure TFormPlanetMoons.ButtonGlobalIndexClick(Sender: TObject);
var
  aItem: TTreeViewItem;
  i: integer;
begin
  aItem := nil;
  TreeView.ExpandAll;

  for i := 0 to TreeView.GlobalCount - 1 do
  begin
    if TreeView.ItemByGlobalIndex(i).Tag = 24 then // find Tag with the number
    begin
      aItem := TreeView.ItemByGlobalIndex(i);
      Break;
    end;
  end;
  ShowMessage('Moon: ' + aItem.Text + sLineBreak +
              'Planet: ' + aItem.ParentItem.Index.ToString + sLineBreak +
              'Index in Planet: ' + aItem.
    Index.ToString);
end;

end.
