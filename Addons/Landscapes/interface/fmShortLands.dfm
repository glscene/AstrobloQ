object frmShortLands: TfrmShortLands
  Left = 195
  Top = 107
  Caption = 'Short Landscape'
  ClientHeight = 441
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 688
    Height = 441
    Camera = GLCamera1
    Buffer.Lighting = False
    FieldOfView = 154.447631835937500000
    PenAsTouch = False
    Align = alClient
    OnDblClick = GLSceneViewer1DblClick
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 56
    Top = 8
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLCamera1: TGLCamera
        DepthOfView = 1000.000000000000000000
        FocalLength = 50.000000000000000000
        TargetObject = GLDummyCube1
      end
      object GLTerrainRenderer1: TGLTerrainRenderer
        Direction.Coordinates = {00000000000080BF0000000000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        TilesPerTexture = 1.000000000000000000
        MaterialLibrary = GLMaterialLibrary1
        ContourWidth = 0
      end
    end
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 224
    Top = 8
  end
end
