object FormOptions: TFormOptions
  Left = 324
  Top = 109
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080
  ClientHeight = 370
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 13
  object Label3: TLabel
    Left = 12
    Top = 12
    Width = 144
    Height = 13
    Caption = #1059#1089#1090#1072#1072#1085#1086#1074#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 12
    Top = 79
    Width = 57
    Height = 13
    Caption = #1047#1072#1089#1090#1072#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 172
    Width = 67
    Height = 13
    Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbLoadOnStartup: TCheckBox
    Left = 18
    Top = 31
    Width = 185
    Height = 17
    Caption = #1055#1083#1072#1085#1077#1090#1072' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077
    TabOrder = 0
    OnClick = cbLoadOnStartupClick
  end
  object cbAutosave: TCheckBox
    Left = 18
    Top = 54
    Width = 181
    Height = 17
    Caption = #1040#1074#1090#1086#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
    Enabled = False
    TabOrder = 1
    OnClick = cbAutosaveClick
  end
  object panButtonBar: TPanel
    Left = 0
    Top = 329
    Width = 247
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitTop = 304
    ExplicitWidth = 239
    object panOKButton: TPanel
      Left = 142
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 134
      object btnOK: TBitBtn
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
  object cbSplashStart: TCheckBox
    Left = 18
    Top = 103
    Width = 185
    Height = 18
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077
    TabOrder = 3
    OnClick = cbSplashStartClick
  end
  object cbSplashExit: TCheckBox
    Left = 18
    Top = 123
    Width = 185
    Height = 18
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
    TabOrder = 4
    OnClick = cbSplashExitClick
  end
  object cbInvertMouse: TCheckBox
    Left = 12
    Top = 192
    Width = 185
    Height = 18
    Caption = #1052#1099#1096#1100' '#1086#1090' '#1087#1077#1088#1074#1086#1075#1086' '#1083#1080#1094#1072
    TabOrder = 5
    OnClick = cbInvertMouseClick
  end
  object cbInvertPlanet: TCheckBox
    Left = 12
    Top = 211
    Width = 185
    Height = 18
    Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1099#1096#1100' '#1087#1083#1072#1085#1077#1090#1099
    TabOrder = 6
    OnClick = cbInvertPlanetClick
  end
  object cbAuto3DView: TCheckBox
    Left = 12
    Top = 231
    Width = 187
    Height = 18
    Caption = #1040#1074#1090#1086' 3D '#1074#1080#1076' '#1074' '#1086#1082#1085#1077' '#1086#1073#1098#1077#1082#1090#1086#1074
    TabOrder = 7
    OnClick = cbAuto3DViewClick
  end
  object cbInvertMouseWheel: TCheckBox
    Left = 12
    Top = 251
    Width = 189
    Height = 18
    Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1091#1084' '#1082#1086#1083#1077#1089#1072' '#1084#1099#1096#1080
    TabOrder = 8
    OnClick = cbInvertMouseWheelClick
  end
  object cbTipOfTheDay: TCheckBox
    Left = 18
    Top = 144
    Width = 185
    Height = 18
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1091' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077
    TabOrder = 9
    OnClick = cbTipOfTheDayClick
  end
  object cbRememberView: TCheckBox
    Left = 12
    Top = 272
    Width = 191
    Height = 17
    Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1088#1072#1079#1084#1077#1088' 3D'
    TabOrder = 10
    OnClick = cbRememberViewClick
  end
  object cbAdvancedMode: TCheckBox
    Left = 12
    Top = 292
    Width = 191
    Height = 17
    Hint = 'Show advanced controls in the menus.'
    Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1088#1077#1078#1080#1084
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = cbAdvancedModeClick
  end
end
