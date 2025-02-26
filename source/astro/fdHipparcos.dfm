object FormHipparcos: TFormHipparcos
  Left = 0
  Top = 0
  Caption = 'Hipparcos'
  ClientHeight = 348
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object LabelStars: TLabel
    Left = 360
    Top = 24
    Width = 134
    Height = 15
    Caption = 'Stars without coordinates'
  end
  object Label1: TLabel
    Left = 360
    Top = 56
    Width = 135
    Height = 15
    Caption = 'Stars without movements'
  end
  object Label2: TLabel
    Left = 360
    Top = 88
    Width = 112
    Height = 15
    Caption = 'Stars without parallax'
  end
  object starsNoCoord: TStaticText
    Left = 536
    Top = 20
    Width = 77
    Height = 19
    Caption = 'starsNoCoord'
    TabOrder = 0
  end
  object starsNoProp: TStaticText
    Left = 536
    Top = 59
    Width = 69
    Height = 19
    Caption = 'starsNoProp'
    TabOrder = 1
  end
  object starsNoPar: TStaticText
    Left = 536
    Top = 84
    Width = 61
    Height = 19
    Caption = 'starsNoPar'
    TabOrder = 2
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 8
    Top = 11
    Width = 338
    Height = 329
    PenAsTouch = False
    TabOrder = 3
  end
  object GLScene1: TGLScene
    Left = 48
    Top = 32
  end
end
