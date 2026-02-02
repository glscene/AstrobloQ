unit LUX.Brep;

// Boundary representation: B-rep library.

interface

uses
  LUX,
  LUX.Graph,
  LUX.Graph.Tree;

type
  TModel = class;
  TFold = class;
  TPoin = class;
  TWire = class;
  TVert = class;
  TEdge = class;
  TSlat = class;
  TFace = class;
  TCell = class;

  TModel = class
  private
  protected
  public
  end;

  TFold = class(TTreeNode)
  private
  protected
  public
  end;

  TPoin = class(TTreeNode)
  private
  protected
  public
  end;

  TWire = class(TTreeNode)
  private
  protected
    _Poin0: TPoin;
    _Poin1: TPoin;
  public
    property Poin0: TPoin read _Poin0;
    property Poin1: TPoin read _Poin1;
  end;

  TVert = class(TTreeNode)
  private
  protected
  public
  end;

  TEdge = class(TTreeNode)
  private
  protected
  public
  end;

  TSlat = class(TTreeNode)
  private
  protected
  public
  end;

  TFace = class(TTreeNode)
  private
  protected
  public
  end;

  TCell = class(TTreeNode)
  private
  protected
  public
  end;

implementation //--------------------------------------------------------------

initialization

finalization //----------------------------------------------------------------

end.
