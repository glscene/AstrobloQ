inherited FormDrakeQuation: TFormDrakeQuation
  Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1088#1077#1081#1082#1072
  ClientHeight = 744
  ClientWidth = 1182
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1198
  ExplicitHeight = 783
  TextHeight = 30
  object PanelBottom: TPanel
    Left = 0
    Top = 672
    Width = 1182
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 647
    ExplicitWidth = 1174
    object ButtonOk: TButton
      Left = 981
      Top = 10
      Width = 131
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOkClick
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1182
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 250
    ExplicitTop = 202
    ExplicitWidth = 324
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 72
    Width = 1182
    Height = 600
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Caption = 'PanelMiddle'
    ShowCaption = False
    TabOrder = 2
    ExplicitLeft = 268
    ExplicitTop = 304
    ExplicitWidth = 324
    ExplicitHeight = 72
    object grbDrakeFormula: TGroupBox
      Left = 93
      Top = 48
      Width = 1019
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1088#1077#1081#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lbNs: TLabel
        Left = 287
        Top = 54
        Width = 34
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Ns'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbNt: TLabel
        Left = 65
        Top = 54
        Width = 22
        Height = 38
        Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1083#1072#1085#1077#1090' '#1074' '#1043#1072#1083#1072#1082#1090#1080#1082#1077
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbFl: TLabel
        Left = 417
        Top = 54
        Width = 39
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1087#1083#1072#1085#1077#1090' '#1091' '#1079#1074#1077#1079#1076#1099
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Np'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbFb: TLabel
        Left = 668
        Top = 54
        Width = 32
        Height = 38
        Hint = #1044#1086#1083#1103' '#1073#1080#1086#1089#1092#1077#1088' '#1089#1088#1077#1076#1080' '#1083#1080#1090#1086#1089#1092#1077#1088
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Fb'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbFn: TLabel
        Left = 795
        Top = 54
        Width = 32
        Height = 38
        Hint = #1044#1086#1083#1103' '#1085#1086#1086#1089#1092#1077#1088' '#1074' '#1073#1080#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Fn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbFt: TLabel
        Left = 935
        Top = 54
        Width = 26
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Ft'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbFp: TLabel
        Left = 547
        Top = 54
        Width = 24
        Height = 38
        Hint = #1044#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Fl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 80
        Top = 170
        Width = 541
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1087#1083#1072#1085#1077#1090#1085#1099#1084#1080' '#1089#1080#1089#1090#1077#1084#1072#1084#1080', Dp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object nbFn: TNumberBox
        Left = 771
        Top = 102
        Width = 92
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        Mode = nbmFloat
        MaxValue = 1.000000000000000000
        ParentFont = False
        TabOrder = 0
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object nbFb: TNumberBox
        Left = 645
        Top = 100
        Width = 89
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        Mode = nbmFloat
        MaxValue = 1.000000000000000000
        ParentFont = False
        TabOrder = 1
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object nbNl: TNumberBox
        Left = 417
        Top = 102
        Width = 76
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        Mode = nbmInt64
        MinValue = 1.000000000000000000
        MaxValue = 100.000000000000000000
        ParentFont = False
        TabOrder = 2
        Value = 3.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object EditNt: TEdit
        Left = 0
        Top = 102
        Width = 193
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '1'
      end
      object stMult1: TStaticText
        Left = 360
        Top = 52
        Width = 17
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '*'
        TabOrder = 4
      end
      object stMult2: TStaticText
        Left = 604
        Top = 52
        Width = 17
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '*'
        TabOrder = 5
      end
      object stMult3: TStaticText
        Left = 744
        Top = 52
        Width = 17
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '*'
        TabOrder = 6
      end
      object stMult4: TStaticText
        Left = 873
        Top = 52
        Width = 17
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '*'
        TabOrder = 7
      end
      object stEqual: TStaticText
        Left = 193
        Top = 52
        Width = 24
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '='
        TabOrder = 8
      end
      object nbFt: TNumberBox
        Left = 900
        Top = 98
        Width = 102
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        Mode = nbmFloat
        MaxValue = 1.000000000000000000
        ParentFont = False
        TabOrder = 9
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object EditDp: TEdit
        Left = 645
        Top = 160
        Width = 164
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = '1'
      end
      object nbFp: TNumberBox
        Left = 532
        Top = 102
        Width = 76
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        Mode = nbmFloat
        MaxValue = 1.000000000000000000
        ParentFont = False
        TabOrder = 11
        Value = 0.333000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object stMult5: TStaticText
        Left = 493
        Top = 52
        Width = 17
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '*'
        TabOrder = 12
      end
      object nbNs: TNumberBox
        Left = 213
        Top = 102
        Width = 172
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Alignment = taCenter
        Decimal = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        Mode = nbmInt64
        MinValue = 1.000000000000000000
        MaxValue = 1000000000000.000000000000000000
        ParentFont = False
        TabOrder = 13
        Value = 400000000000.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object ButtonCalculate: TButton
      Left = 525
      Top = 341
      Width = 164
      Height = 43
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonCalculateClick
    end
  end
end
