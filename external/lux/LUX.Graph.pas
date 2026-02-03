unit LUX.Graph;

interface

uses
  LUX;

type

  TNodeLink<_TYPE_: class> = record
  private
  public
    o: _TYPE_;
    i: Integer;
    constructor Create(const o_: _TYPE_; const i_: Integer);
    class operator Implicit(const Node_: _TYPE_): TNodeLink<_TYPE_>;
    class operator Implicit(const Link_: TNodeLink<_TYPE_>): _TYPE_;
  end;

  TNode = class
  private
  protected
  public
  end;

  TRoot = class(TNode)
  private
  protected
  public
  end;

  TKnot = class(TNode)
  private
  protected
  public
  end;

  TLeaf = class(TNode)
  private
  protected
  public
  end;

implementation //=========================================

constructor TNodeLink<_TYPE_>.Create(const o_: _TYPE_; const i_: Integer);
begin
  o := o_;
  i := i_;
end;

class operator TNodeLink<_TYPE_>.Implicit(const Node_: _TYPE_)
  : TNodeLink<_TYPE_>;
begin
  with Result do
  begin
    o := Node_;
    i := -1;
  end;
end;

class operator TNodeLink<_TYPE_>.Implicit(const Link_
  : TNodeLink<_TYPE_>): _TYPE_;
begin
  Result := Link_.o;
end;

initialization //==============================================================

finalization

end.
