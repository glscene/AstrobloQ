inherited FormStatistics: TFormStatistics
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1043#1072#1083#1072#1082#1090#1080#1082#1077
  ClientHeight = 835
  ClientWidth = 1142
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 4
  ExplicitTop = 4
  ExplicitWidth = 1158
  ExplicitHeight = 874
  TextHeight = 30
  object PanelBottom: TPanel
    Left = 0
    Top = 763
    Width = 1142
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
      Left = 937
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
    object ButtonCalculate: TButton
      Left = 541
      Top = 10
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
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1142
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 1174
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 72
    Width = 1142
    Height = 691
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Caption = 'PanelMiddle'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1174
    ExplicitHeight = 575
    object grbDrakeFormula: TGroupBox
      Left = 1
      Top = 443
      Width = 1140
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' CETI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 32
      ExplicitTop = 510
      ExplicitWidth = 1121
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
      object lbNp: TLabel
        Left = 65
        Top = 54
        Width = 33
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076' CETI'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Nt'
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
        Left = 40
        Top = 170
        Width = 365
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1090#1077#1083#1077#1087#1086#1088#1090#1072#1083#1072#1084#1080', Dt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 1039
        Top = 54
        Width = 28
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'F'#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
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
      object EditNc: TEdit
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
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 4
      end
      object stMult2: TStaticText
        Left = 604
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 5
      end
      object stMult3: TStaticText
        Left = 744
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 6
      end
      object stMult4: TStaticText
        Left = 873
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
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
      object EditDt: TEdit
        Left = 524
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
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
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
      object StaticText13: TStaticText
        Left = 1001
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 14
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1140
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1088#1077#1081#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 32
      ExplicitTop = 10
      ExplicitWidth = 1121
      object Label1: TLabel
        Left = 287
        Top = 54
        Width = 31
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'R*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbNc: TLabel
        Left = 65
        Top = 54
        Width = 35
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076' CETI'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Nc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label3: TLabel
        Left = 417
        Top = 54
        Width = 32
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1087#1083#1072#1085#1077#1090' '#1091' '#1079#1074#1077#1079#1076#1099
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'ne'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 668
        Top = 54
        Width = 20
        Height = 38
        Hint = #1044#1086#1083#1103' '#1073#1080#1086#1089#1092#1077#1088' '#1089#1088#1077#1076#1080' '#1083#1080#1090#1086#1089#1092#1077#1088
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label6: TLabel
        Left = 795
        Top = 54
        Width = 20
        Height = 38
        Hint = #1044#1086#1083#1103' '#1085#1086#1086#1089#1092#1077#1088' '#1074' '#1073#1080#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label7: TLabel
        Left = 935
        Top = 54
        Width = 24
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label8: TLabel
        Left = 547
        Top = 54
        Width = 28
        Height = 38
        Hint = #1044#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label9: TLabel
        Left = 40
        Top = 170
        Width = 375
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1103#1084#1080', Dc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object NumberBox1: TNumberBox
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
      object NumberBox2: TNumberBox
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
      object NumberBox3: TNumberBox
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
      object Edit1: TEdit
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
      object StaticText1: TStaticText
        Left = 360
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 4
      end
      object StaticText2: TStaticText
        Left = 604
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 5
      end
      object StaticText3: TStaticText
        Left = 744
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 6
      end
      object StaticText4: TStaticText
        Left = 873
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 7
      end
      object StaticText5: TStaticText
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
      object NumberBox4: TNumberBox
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
      object Edit2: TEdit
        Left = 524
        Top = 172
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
      object NumberBox5: TNumberBox
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
      object StaticText6: TStaticText
        Left = 493
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 12
      end
      object NumberBox6: TNumberBox
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
        Value = 10.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 222
      Width = 1140
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1086#1081#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 66
      ExplicitTop = 250
      ExplicitWidth = 1121
      object Label10: TLabel
        Left = 287
        Top = 54
        Width = 31
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'R*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object lbNh: TLabel
        Left = 65
        Top = 54
        Width = 39
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1079#1074#1105#1079#1076' CETI'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Nh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label12: TLabel
        Left = 417
        Top = 54
        Width = 32
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1087#1083#1072#1085#1077#1090' '#1091' '#1079#1074#1077#1079#1076#1099
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'ne'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label13: TLabel
        Left = 668
        Top = 54
        Width = 20
        Height = 38
        Hint = #1044#1086#1083#1103' '#1073#1080#1086#1089#1092#1077#1088' '#1089#1088#1077#1076#1080' '#1083#1080#1090#1086#1089#1092#1077#1088
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label14: TLabel
        Left = 795
        Top = 54
        Width = 20
        Height = 38
        Hint = #1044#1086#1083#1103' '#1085#1086#1086#1089#1092#1077#1088' '#1074' '#1073#1080#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label15: TLabel
        Left = 935
        Top = 54
        Width = 24
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label16: TLabel
        Left = 547
        Top = 54
        Width = 28
        Height = 38
        Hint = #1044#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label17: TLabel
        Left = 40
        Top = 170
        Width = 457
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1086#1073#1080#1090#1072#1077#1084#1099#1084#1080' '#1087#1083#1072#1085#1077#1090#1072#1084#1080', Dh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object NumberBox7: TNumberBox
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
      object NumberBox8: TNumberBox
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
      object NumberBox9: TNumberBox
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
      object Edit3: TEdit
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
      object StaticText7: TStaticText
        Left = 360
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 4
      end
      object StaticText8: TStaticText
        Left = 604
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 5
      end
      object StaticText9: TStaticText
        Left = 744
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 6
      end
      object StaticText10: TStaticText
        Left = 873
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 7
      end
      object StaticText11: TStaticText
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
      object NumberBox10: TNumberBox
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
      object Edit4: TEdit
        Left = 524
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
      object NumberBox11: TNumberBox
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
      object StaticText12: TStaticText
        Left = 493
        Top = 52
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 12
      end
      object NumberBox12: TNumberBox
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
  end
end
