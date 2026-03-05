inherited frmEquations: TfrmEquations
  Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1103
  ClientHeight = 835
  ClientWidth = 1211
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1227
  ExplicitHeight = 874
  TextHeight = 30
  object PanelBottom: TPanel
    Left = 0
    Top = 763
    Width = 1211
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 738
    ExplicitWidth = 1203
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
    Width = 1211
    Height = 113
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1080' '#1052#1083#1077#1095#1085#1086#1075#1086' '#1055#1091#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 1203
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 113
    Width = 1211
    Height = 650
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Caption = 'PanelMiddle'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1203
    ExplicitHeight = 625
    object grbDrakeFormula: TGroupBox
      Left = 1
      Top = 443
      Width = 1209
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 
        #1059#1088#1072#1074#1085#1077#1085#1080#1077' CETI '#1086#1094#1077#1085#1082#1080' '#1095#1080#1089#1083#1072' '#1087#1083#1072#1085#1077#1090' '#1089' '#1090#1077#1093#1085#1086#1089#1092#1077#1088#1072#1084#1080' '#1079#1072' '#1074#1088#1077#1084#1103' '#1101#1074#1086#1083#1102 +
        #1094#1080#1080' '#1043#1072#1083#1072#1082#1090#1080#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 1201
      object lbNs: TLabel
        Left = 300
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
        Left = 432
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
        Width = 570
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1087#1083#1072#1085#1077#1090#1072#1084#1080' '#1089' '#1090#1077#1093#1085#1086#1089#1092#1077#1088#1072#1084#1080', Dt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 1056
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
        Left = 373
        Top = 50
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
        Left = 618
        Top = 50
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
        Top = 102
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
        Value = 0.500000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object stMult5: TStaticText
        Left = 510
        Top = 50
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
        Width = 184
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
        Value = 1000000000000.000000000000000000
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
      object NumberBox5: TNumberBox
        Left = 1034
        Top = 102
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
        TabOrder = 15
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1209
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1088#1077#1081#1082#1072' '#1086#1094#1077#1085#1082#1080' '#1095#1080#1089#1083#1072' '#1082#1086#1084#1084#1091#1085#1080#1082#1072#1094#1080#1086#1085#1085#1099#1093' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 1201
      object LabelNs: TLabel
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
      object LabelNc: TLabel
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
      object Labelne: TLabel
        Left = 547
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
      object Labelfl: TLabel
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
      object Labelfi: TLabel
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
      object Labelfc: TLabel
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
      object Labelfp: TLabel
        Left = 443
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
        Width = 451
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1057#1088#1077#1076#1085#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1094#1080#1074#1080#1083#1080#1079#1072#1094#1080#1103#1084#1080', Dc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object LabelL: TLabel
        Left = 1095
        Top = 50
        Width = 25
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'fL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object NumberBox_fi: TNumberBox
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
      object NumberBox_fl: TNumberBox
        Left = 645
        Top = 102
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
      object NumberBox_fp: TNumberBox
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
      object Edit_Nc: TEdit
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
        Left = 393
        Top = 50
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
      object NumberBox_fc: TNumberBox
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
        Left = 645
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
      object NumberBox_ne: TNumberBox
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
      object NumberBox_Ns: TNumberBox
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
      object StaticText14: TStaticText
        Left = 1025
        Top = 50
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 14
      end
      object NumberBox_L: TNumberBox
        Left = 1056
        Top = 98
        Width = 122
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
        TabOrder = 15
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 222
      Width = 1209
      Height = 221
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1086#1081#1083#1072' '#1086#1094#1077#1085#1082#1080' '#1095#1080#1089#1083#1072' '#1087#1083#1072#1085#1077#1090' '#1089' '#1073#1080#1086#1089#1092#1077#1088#1072#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      ExplicitWidth = 1201
      object Label10: TLabel
        Left = 236
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
      object lbNh: TLabel
        Left = 59
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
        Left = 347
        Top = 54
        Width = 35
        Height = 38
        Hint = #1063#1080#1089#1083#1086' '#1087#1083#1072#1085#1077#1090' '#1091' '#1079#1074#1077#1079#1076#1099
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Pp'
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
        Left = 550
        Top = 54
        Width = 29
        Height = 38
        Hint = #1044#1086#1083#1103' '#1073#1080#1086#1089#1092#1077#1088' '#1089#1088#1077#1076#1080' '#1083#1080#1090#1086#1089#1092#1077#1088
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Pr'
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
        Left = 661
        Top = 54
        Width = 44
        Height = 38
        Hint = #1044#1086#1083#1103' '#1085#1086#1086#1089#1092#1077#1088' '#1074' '#1073#1080#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Pm'
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
        Left = 758
        Top = 54
        Width = 33
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Pe'
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
        Left = 456
        Top = 54
        Width = 27
        Height = 38
        Hint = #1044#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Pi'
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
        Width = 557
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1057#1088#1077#1076#1085#1077#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1087#1083#1072#1085#1077#1090#1072#1084#1080' '#1089' '#1073#1080#1086#1089#1092#1077#1088#1072#1084#1080', Dh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 852
        Top = 54
        Width = 38
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'PA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label2: TLabel
        Left = 942
        Top = 54
        Width = 36
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'PB'
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
        Left = 1034
        Top = 54
        Width = 39
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'PD'
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
        Left = 1126
        Top = 54
        Width = 32
        Height = 38
        Hint = #1044#1086#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088' '#1074' '#1085#1086#1086#1089#1092#1077#1088#1072#1093
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'PL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object NumberBox7: TNumberBox
        Left = 605
        Top = 102
        Width = 89
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
        Left = 503
        Top = 102
        Width = 79
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
        Left = 329
        Top = 102
        Width = 62
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
        Width = 137
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
        Left = 307
        Top = 50
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
        Left = 516
        Top = 50
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
        Left = 627
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
        Left = 726
        Top = 50
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
        Left = 142
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
        Left = 715
        Top = 102
        Width = 97
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
        Left = 645
        Top = 159
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
        Left = 407
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
        Left = 401
        Top = 50
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
        Left = 147
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
      object NumberBox1: TNumberBox
        Left = 822
        Top = 102
        Width = 86
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
        TabOrder = 14
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox2: TNumberBox
        Left = 918
        Top = 102
        Width = 88
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
        TabOrder = 15
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox3: TNumberBox
        Left = 1016
        Top = 102
        Width = 84
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
        TabOrder = 16
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object NumberBox4: TNumberBox
        Left = 1110
        Top = 102
        Width = 83
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
        TabOrder = 17
        Value = 0.001000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object StaticText15: TStaticText
        Left = 818
        Top = 50
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 18
      end
      object StaticText16: TStaticText
        Left = 906
        Top = 50
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 19
      end
      object StaticText17: TStaticText
        Left = 1006
        Top = 50
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 20
      end
      object StaticText18: TStaticText
        Left = 1094
        Top = 50
        Width = 12
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '.'
        TabOrder = 21
      end
    end
  end
end
