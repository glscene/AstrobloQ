object FormHipparcos: TFormHipparcos
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Hipparcos'
  ClientHeight = 609
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 30
  object LabelStars: TLabel
    Left = 630
    Top = 42
    Width = 234
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Stars without coordinates'
  end
  object Label1: TLabel
    Left = 630
    Top = 98
    Width = 234
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Stars without movements'
  end
  object Label2: TLabel
    Left = 630
    Top = 154
    Width = 198
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Stars without parallax'
  end
  object starsNoCoord: TStaticText
    Left = 938
    Top = 35
    Width = 131
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'starsNoCoord'
    TabOrder = 0
  end
  object starsNoProp: TStaticText
    Left = 938
    Top = 103
    Width = 118
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'starsNoProp'
    TabOrder = 1
  end
  object starsNoPar: TStaticText
    Left = 938
    Top = 147
    Width = 105
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'starsNoPar'
    TabOrder = 2
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 14
    Top = 19
    Width = 592
    Height = 576
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    PenAsTouch = False
    TabOrder = 3
  end
  object GLScene1: TGLScene
    Left = 48
    Top = 32
  end
end
