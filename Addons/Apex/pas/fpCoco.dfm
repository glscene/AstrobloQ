object FormCoco: TFormCoco
  Left = 0
  Top = 0
  Caption = 'Coco'
  ClientHeight = 433
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object PanelTitle: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 25
    Align = alTop
    Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077' '#1082#1086#1086#1088#1076#1080#1085#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 570
  end
  object rgInput: TRadioGroup
    Left = 0
    Top = 25
    Width = 578
    Height = 47
    Align = alTop
    Caption = #1042#1074#1086#1076
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Ecliptic cartesian'
      'Ecliptic polar'
      'Equatorial cartesian'
      'Equatorial polar')
    TabOrder = 1
    ExplicitWidth = 570
  end
  object rgOutput: TRadioGroup
    Left = 0
    Top = 225
    Width = 578
    Height = 47
    Hint = 'A E P G H'
    Align = alTop
    Caption = #1042#1099#1074#1086#1076
    Columns = 5
    ItemIndex = 0
    Items.Strings = (
      'Equatorial'
      'Ecliptic'
      'Precession'
      'Geocentric'
      'Heliocentric')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    ExplicitWidth = 570
  end
  object Panel1: TPanel
    Left = 0
    Top = 72
    Width = 578
    Height = 153
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 570
    object LabelEqinox: TLabel
      Left = 51
      Top = 86
      Width = 35
      Height = 15
      Caption = 'Eqinox'
    end
    object LabelRad: TLabel
      Left = 299
      Top = 126
      Width = 16
      Height = 15
      Caption = 'DD'
    end
    object gbXYZ: TGroupBox
      Left = 8
      Top = 6
      Width = 265
      Height = 59
      Caption = #1044#1077#1082#1072#1088#1090#1086#1074#1099' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
      TabOrder = 0
      object LabelZ: TLabel
        Left = 191
        Top = 22
        Width = 7
        Height = 15
        Caption = 'Z'
      end
      object LabelY: TLabel
        Left = 100
        Top = 25
        Width = 7
        Height = 15
        Caption = 'Y'
      end
      object LabelX: TLabel
        Left = 12
        Top = 25
        Width = 7
        Height = 15
        Caption = 'X'
      end
      object nbX: TNumberBox
        Left = 25
        Top = 25
        Width = 46
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 0
        Value = 1.000000000000000000
      end
      object nbY: TNumberBox
        Left = 113
        Top = 25
        Width = 56
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 1
      end
      object nbZ: TNumberBox
        Left = 203
        Top = 25
        Width = 56
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 286
      Top = 6
      Width = 275
      Height = 115
      Caption = 'Polar coordinates'
      TabOrder = 1
      object LabelL: TLabel
        Left = 24
        Top = 32
        Width = 6
        Height = 15
        Caption = 'L'
      end
      object LabelB: TLabel
        Left = 24
        Top = 57
        Width = 7
        Height = 15
        Caption = 'B'
      end
      object LabelR: TLabel
        Left = 24
        Top = 80
        Width = 7
        Height = 15
        Caption = 'R'
      end
      object nbDeg: TNumberBox
        Left = 83
        Top = 25
        Width = 30
        Height = 23
        Alignment = taCenter
        Decimal = 0
        MaxValue = 360.000000000000000000
        TabOrder = 0
        Value = 34.000000000000000000
      end
      object NumberBox7: TNumberBox
        Left = 83
        Top = 80
        Width = 70
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 1
      end
      object nbMin: TNumberBox
        Left = 131
        Top = 25
        Width = 30
        Height = 23
        Alignment = taCenter
        Decimal = 0
        Mode = nbmInt64
        MaxValue = 60.000000000000000000
        TabOrder = 2
        Value = 45.000000000000000000
      end
      object nbSec: TNumberBox
        Left = 179
        Top = 25
        Width = 38
        Height = 23
        Alignment = taCenter
        Mode = nbmFloat
        MaxValue = 360.000000000000000000
        TabOrder = 3
      end
      object NumberBox6: TNumberBox
        Left = 179
        Top = 53
        Width = 38
        Height = 23
        Alignment = taCenter
        Mode = nbmFloat
        MaxValue = 360.000000000000000000
        TabOrder = 4
      end
      object NumberBox9: TNumberBox
        Left = 131
        Top = 53
        Width = 30
        Height = 23
        Alignment = taCenter
        MaxValue = 60.000000000000000000
        TabOrder = 5
      end
      object NumberBox10: TNumberBox
        Left = 83
        Top = 53
        Width = 30
        Height = 23
        Alignment = taCenter
        MaxValue = 360.000000000000000000
        TabOrder = 6
      end
    end
    object DateTimePicker1: TDateTimePicker
      Left = 115
      Top = 86
      Width = 124
      Height = 23
      Date = 45471.000000000000000000
      Time = 0.971897071758576200
      Kind = dtkTime
      TabOrder = 2
    end
    object nbDD: TNumberBox
      Left = 336
      Top = 125
      Width = 95
      Height = 23
      Alignment = taCenter
      Decimal = 5
      Mode = nbmFloat
      TabOrder = 3
    end
    object ButtonCalcDD: TButton
      Left = 453
      Top = 126
      Width = 74
      Height = 21
      Caption = 'CalcDD'
      TabOrder = 4
      OnClick = ButtonCalcDDClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 272
    Width = 578
    Height = 177
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 570
    object GroupBox2: TGroupBox
      Left = 8
      Top = 14
      Width = 329
      Height = 59
      Caption = #1044#1077#1082#1072#1088#1090#1086#1074#1099' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
      TabOrder = 0
      object Label3: TLabel
        Left = 225
        Top = 24
        Width = 7
        Height = 15
        Caption = 'Z'
      end
      object Label4: TLabel
        Left = 116
        Top = 24
        Width = 7
        Height = 15
        Caption = 'Y'
      end
      object Label5: TLabel
        Left = 12
        Top = 24
        Width = 7
        Height = 15
        Caption = 'X'
      end
      object NumberBox3: TNumberBox
        Left = 25
        Top = 22
        Width = 69
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 0
        Value = 1.000000000000000000
      end
      object NumberBox4: TNumberBox
        Left = 129
        Top = 22
        Width = 69
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 1
      end
      object NumberBox5: TNumberBox
        Left = 241
        Top = 22
        Width = 69
        Height = 23
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 2
      end
    end
    object ButtonCalculate: TButton
      Left = 418
      Top = 123
      Width = 112
      Height = 26
      Caption = 'Convert'
      TabOrder = 1
      OnClick = ButtonCalculateClick
    end
  end
end
