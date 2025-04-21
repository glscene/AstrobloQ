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
    Width = 121
    Height = 15
    Caption = #1047#1074#1105#1079#1076#1099' '#1073#1077#1079' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
  end
  object Label1: TLabel
    Left = 360
    Top = 56
    Width = 124
    Height = 15
    Caption = #1047#1074#1105#1079#1076#1099' '#1073#1077#1079' '#1089#1076#1074#1080#1078#1077#1085#1080#1081
  end
  object Label2: TLabel
    Left = 360
    Top = 88
    Width = 134
    Height = 15
    Caption = #1047#1074#1105#1079#1076#1099' '#1073#1077#1079' '#1087#1072#1088#1072#1083#1083#1072#1082#1089#1086#1074
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
