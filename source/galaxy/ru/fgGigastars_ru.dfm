object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 433
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 624
    Height = 433
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 112
    Top = 72
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLSphere1: TGLSphere
        Radius = 0.500000000000000000
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Left = 232
    Top = 72
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 104
    Top = 160
  end
end
