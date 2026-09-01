object frmStarcube: TfrmStarcube
  Left = 0
  Top = 0
  Caption = 'Starcube'
  ClientHeight = 565
  ClientWidth = 919
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
    Width = 919
    Height = 565
    Camera = GLCamera1
    FieldOfView = 159.926193237304700000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 112
    Top = 64
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcStarcube
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object dcStarcube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLPoints1: TGLPoints
        NoZWrite = False
        Static = False
      end
      object GLSphere1: TGLSphere
        Radius = 0.500000000000000000
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Left = 224
    Top = 64
  end
end
