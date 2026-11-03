object frmTerrascope: TfrmTerrascope
  Left = 0
  Top = 0
  Caption = #1058#1077#1088#1088#1072#1089#1082#1086#1087
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
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 153.991439819335900000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 104
    Top = 56
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000004000000040000000400000803F}
    end
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000004000000040000000400000803F}
      SpotCutOff = 180.000000000000000000
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLSphere1: TGLSphere
        Radius = 0.500000000000000000
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Left = 224
    Top = 56
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 112
    Top = 128
  end
  object Timer1: TTimer
    Left = 528
    Top = 56
  end
end
