unit GLS.MusicKeys;

interface

uses
  Stage.VectorTypes,
  GLS.VectorFileObjects,
  GLS.Color;

type
  TGLPianoKeySet = set of 0 .. 87;
  TGLGuitarKeySet = set of 0 .. 149;

type
  TGLPianoKeys = class(TGLMeshObject)
   // methods and properties
  end;

  TGLGuitars = class(TGLMeshObject)
   // methods and properties
  end;

var
  BlackKeySet: TGLPianoKeySet;
  NutKeySet: TGLGuitarKeySet;
  old_color, new_color: TVector4f;

const
  SelectionColor: TGLColorVector = (X: 0.243; Y: 0.243; Z: 0.243; W: 1.000);


implementation //=============================================================

end.
