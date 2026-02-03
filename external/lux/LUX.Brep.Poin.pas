unit LUX.Brep.Poin;

interface

uses
  LUX,
  LUX.Graph.Tree;

type

  TPoin<_TPos_: record > = class;

  TPoin<_TPos_: record > = class(TTreeLeaf<TTreeNode>)
  private
  protected
    _Pos: _TPos_;
    function GetPos: _TPos_; virtual;
    procedure SetPos(const Pos_: _TPos_); virtual;
  public
    constructor Create(const Pos_: _TPos_); overload;
    constructor Create(const Pos_: _TPos_; const Paren_: TTreeNode); overload;
    property Pos: _TPos_ read GetPos write SetPos;
  end;

TPoinModel < _TPos_: record;
_TPoin_:
TPoin < _TPos_ >> = class(TTreeRoot<_TPoin_>)private protected public
end;

implementation //--------------------------------------------------------------

function TPoin<_TPos_>.GetPos: _TPos_;
begin
  Result := _Pos;
end;

procedure TPoin<_TPos_>.SetPos(const Pos_: _TPos_);
begin
  _Pos := Pos_;
end;

constructor TPoin<_TPos_>.Create(const Pos_: _TPos_);
begin
  inherited Create;

  _Pos := Pos_;
end;

constructor TPoin<_TPos_>.Create(const Pos_: _TPos_; const Paren_: TTreeNode);
begin
  inherited Create(Paren_);

  _Pos := Pos_;
end;

initialization //==============================================================

finalization

end.
