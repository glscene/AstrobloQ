object FormOptions: TFormOptions
  Left = 0
  Top = 0
  Caption = 'Options'
  ClientHeight = 462
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 613
    Height = 432
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object chbRotate: TCheckBox
      Left = 289
      Top = 47
      Width = 112
      Height = 24
      Caption = 'Rotation'
      TabOrder = 0
    end
    object chbAxes: TCheckBox
      Left = 173
      Top = 125
      Width = 76
      Height = 17
      Caption = 'Axis'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chbAxesClick
    end
    object chbPlanet: TCheckBox
      Left = 440
      Top = 125
      Width = 105
      Height = 17
      Caption = 'Object'
      TabOrder = 2
      OnClick = chbPlanetClick
    end
    object chbGrid: TCheckBox
      Left = 295
      Top = 125
      Width = 81
      Height = 17
      Caption = 'Geogrid'
      TabOrder = 3
      OnClick = chbGridClick
    end
  end
end
