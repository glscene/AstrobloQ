object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 638
  ClientWidth = 881
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
    Width = 672
    Height = 638
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 881
  end
  object Panel1: TPanel
    Left = 672
    Top = 0
    Width = 209
    Height = 638
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 1
    object BtnGenerate: TButton
      Left = 72
      Top = 96
      Width = 75
      Height = 25
      Caption = 'BtnGenerate'
      TabOrder = 0
    end
    object BtnFindPath: TButton
      Left = 72
      Top = 160
      Width = 75
      Height = 25
      Caption = 'BtnFindPath'
      TabOrder = 1
    end
  end
  object GLScene1: TGLScene
    Left = 264
    Top = 120
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLPoints1: TGLPoints
        NoZWrite = False
        Static = False
      end
      object StarPoints: TGLPoints
        NoZWrite = False
        Static = False
      end
      object PathLines: TGLLines
        Nodes = <>
        Options = []
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Left = 416
    Top = 128
  end
end
