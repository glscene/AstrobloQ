object FormSatellite: TFormSatellite
  Left = 411
  Top = 200
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = #1057#1072#1090#1077#1083#1083#1080#1090
  ClientHeight = 346
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  TextHeight = 13
  object panDescription: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 324
    object Label1: TLabel
      Left = 147
      Top = 10
      Width = 82
      Height = 13
      Caption = #1063#1080#1089#1083#1086' '#1086#1073#1086#1088#1086#1090#1086#1074
    end
    object panRate: TPanel
      Left = 0
      Top = 0
      Width = 100
      Height = 29
      Align = alLeft
      Alignment = taRightJustify
      BevelOuter = bvNone
      BorderWidth = 5
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100':'
      ParentColor = True
      TabOrder = 0
    end
    object edRate: TEdit
      Left = 102
      Top = 4
      Width = 39
      Height = 21
      TabOrder = 1
      Text = '1'
      OnChange = edRateChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 58
    Width = 332
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    ExplicitWidth = 324
    object Label3: TLabel
      Left = 150
      Top = 8
      Width = 101
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1103
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 100
      Height = 29
      Align = alLeft
      Alignment = taRightJustify
      BevelOuter = bvNone
      BorderWidth = 5
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077':'
      ParentColor = True
      TabOrder = 0
    end
    object edMovement: TEdit
      Left = 102
      Top = 4
      Width = 39
      Height = 21
      TabOrder = 1
      Text = '25'
      OnChange = edMovementChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 29
    Width = 332
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    ExplicitWidth = 324
    object Label2: TLabel
      Left = 150
      Top = 8
      Width = 102
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1076#1086' '#1094#1077#1083#1080
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 100
      Height = 29
      Align = alLeft
      Alignment = taRightJustify
      BevelOuter = bvNone
      BorderWidth = 5
      Caption = #1056#1072#1076#1080#1091#1089':'
      ParentColor = True
      TabOrder = 0
    end
    object edRadius: TEdit
      Left = 102
      Top = 4
      Width = 39
      Height = 21
      TabOrder = 1
      Text = '5'
      OnChange = edRadiusChange
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 87
    Width = 332
    Height = 76
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 3
    ExplicitWidth = 324
    ExplicitHeight = 51
    object rgDirection: TRadioGroup
      Left = 47
      Top = 5
      Width = 196
      Height = 66
      Align = alClient
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Up'
        'Down'
        'Left'
        'Right')
      TabOrder = 0
      OnClick = rgDirectionClick
      ExplicitWidth = 188
      ExplicitHeight = 41
    end
    object Panel6: TPanel
      Left = 5
      Top = 5
      Width = 42
      Height = 66
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitHeight = 41
    end
    object Panel7: TPanel
      Left = 243
      Top = 5
      Width = 84
      Height = 66
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 235
      ExplicitHeight = 41
    end
  end
  object panButtonBar: TPanel
    Left = 0
    Top = 305
    Width = 332
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitTop = 280
    ExplicitWidth = 324
    object panOKButton: TPanel
      Left = 227
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 219
      object btnOK: TBitBtn
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnOKClick
      end
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 163
    Width = 332
    Height = 142
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    ExplicitTop = 138
    ExplicitWidth = 324
    object Label4: TLabel
      Left = 24
      Top = 16
      Width = 48
      Height = 13
      Caption = #1069#1087#1080#1094#1077#1085#1090#1088
    end
    object Label5: TLabel
      Left = 48
      Top = 40
      Width = 7
      Height = 13
      Caption = 'X'
    end
    object Label6: TLabel
      Left = 128
      Top = 40
      Width = 7
      Height = 13
      Caption = 'Y'
    end
    object Label7: TLabel
      Left = 216
      Top = 40
      Width = 7
      Height = 13
      Caption = 'Z'
    end
    object LabelSize: TLabel
      Left = 16
      Top = 80
      Width = 39
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088
    end
    object LabelDistance: TLabel
      Left = 16
      Top = 108
      Width = 60
      Height = 13
      Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077
    end
    object edX: TEdit
      Left = 64
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object edY: TEdit
      Left = 144
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object edZ: TEdit
      Left = 232
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object edSize: TEdit
      Left = 102
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '2'
    end
    object edDistance: TEdit
      Left = 102
      Top = 99
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '5'
    end
  end
end
