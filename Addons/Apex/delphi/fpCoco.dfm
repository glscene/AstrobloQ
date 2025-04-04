object FormCoco: TFormCoco
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Coco'
  ClientHeight = 758
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 168
  TextHeight = 30
  object PanelTitle: TPanel
    Left = 0
    Top = 0
    Width = 1012
    Height = 43
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Coordinate conversion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1110
  end
  object rgInput: TRadioGroup
    Left = 0
    Top = 43
    Width = 1012
    Height = 83
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Input'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Ecliptic cartesian'
      'Ecliptic polar'
      'Equatorial cartesian'
      'Equatorial polar')
    TabOrder = 1
    ExplicitWidth = 1110
  end
  object rgOutput: TRadioGroup
    Left = 0
    Top = 393
    Width = 1012
    Height = 83
    Hint = 'A E P G H'
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Output'
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
    ExplicitWidth = 1110
  end
  object Panel1: TPanel
    Left = 0
    Top = 126
    Width = 1012
    Height = 267
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 1110
    object LabelEqinox: TLabel
      Left = 90
      Top = 150
      Width = 62
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Eqinox'
    end
    object LabelRad: TLabel
      Left = 523
      Top = 221
      Width = 30
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'DD'
    end
    object gbXYZ: TGroupBox
      Left = 14
      Top = 10
      Width = 463
      Height = 103
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cartesian coordinates'
      TabOrder = 0
      object LabelZ: TLabel
        Left = 334
        Top = 38
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Z'
      end
      object LabelY: TLabel
        Left = 175
        Top = 44
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Y'
      end
      object LabelX: TLabel
        Left = 21
        Top = 44
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'X'
      end
      object nbX: TNumberBox
        Left = 43
        Top = 44
        Width = 82
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 0
        Value = 1.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object nbY: TNumberBox
        Left = 197
        Top = 44
        Width = 98
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 1
        SpinButtonOptions.ButtonWidth = 30
      end
      object nbZ: TNumberBox
        Left = 356
        Top = 44
        Width = 98
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 2
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object GroupBox1: TGroupBox
      Left = 501
      Top = 10
      Width = 480
      Height = 201
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Polar coordinates'
      TabOrder = 1
      object LabelL: TLabel
        Left = 42
        Top = 56
        Width = 10
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'L'
      end
      object LabelB: TLabel
        Left = 42
        Top = 100
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'B'
      end
      object LabelR: TLabel
        Left = 42
        Top = 140
        Width = 13
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'R'
      end
      object nbDeg: TNumberBox
        Left = 146
        Top = 44
        Width = 51
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 0
        MaxValue = 360.000000000000000000
        TabOrder = 0
        Value = 34.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox7: TNumberBox
        Left = 146
        Top = 140
        Width = 121
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 1
        SpinButtonOptions.ButtonWidth = 30
      end
      object nbMin: TNumberBox
        Left = 230
        Top = 44
        Width = 51
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 0
        Mode = nbmInt64
        MaxValue = 60.000000000000000000
        TabOrder = 2
        Value = 45.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object nbSec: TNumberBox
        Left = 314
        Top = 44
        Width = 65
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Mode = nbmFloat
        MaxValue = 360.000000000000000000
        TabOrder = 3
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox6: TNumberBox
        Left = 314
        Top = 92
        Width = 65
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Mode = nbmFloat
        MaxValue = 360.000000000000000000
        TabOrder = 4
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox9: TNumberBox
        Left = 230
        Top = 92
        Width = 51
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        MaxValue = 60.000000000000000000
        TabOrder = 5
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox10: TNumberBox
        Left = 146
        Top = 92
        Width = 51
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        MaxValue = 360.000000000000000000
        TabOrder = 6
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object DateTimePicker1: TDateTimePicker
      Left = 202
      Top = 150
      Width = 217
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Date = 45471.000000000000000000
      Time = 0.971897071758576200
      Kind = dtkTime
      TabOrder = 2
    end
    object nbDD: TNumberBox
      Left = 588
      Top = 219
      Width = 166
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      Decimal = 5
      Mode = nbmFloat
      TabOrder = 3
      SpinButtonOptions.ButtonWidth = 30
    end
    object ButtonCalcDD: TButton
      Left = 792
      Top = 221
      Width = 131
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'CalcDD'
      TabOrder = 4
      OnClick = ButtonCalcDDClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 476
    Width = 1012
    Height = 309
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 1110
    object GroupBox2: TGroupBox
      Left = 14
      Top = 24
      Width = 575
      Height = 103
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cartesian coordinates'
      TabOrder = 0
      object Label3: TLabel
        Left = 393
        Top = 42
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Z'
      end
      object Label4: TLabel
        Left = 203
        Top = 42
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Y'
      end
      object Label5: TLabel
        Left = 21
        Top = 42
        Width = 12
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'X'
      end
      object NumberBox3: TNumberBox
        Left = 43
        Top = 38
        Width = 121
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 0
        Value = 1.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox4: TNumberBox
        Left = 225
        Top = 38
        Width = 121
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 1
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox5: TNumberBox
        Left = 421
        Top = 38
        Width = 121
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Mode = nbmFloat
        TabOrder = 2
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object ButtonCalculate: TButton
      Left = 731
      Top = 216
      Width = 197
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Convert'
      TabOrder = 1
      OnClick = ButtonCalculateClick
    end
  end
end
