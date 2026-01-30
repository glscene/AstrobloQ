object FormDrake: TFormDrake
  Left = 0
  Top = 0
  Caption = #1060#1086#1088#1084#1091#1083#1072' '#1044#1088#1077#1081#1082#1072' '#1076#1083#1103' '#1090#1077#1093#1085#1086#1089#1092#1077#1088
  ClientHeight = 515
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 515
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 700
    ExplicitHeight = 490
    object Label2: TLabel
      Left = 234
      Top = 18
      Width = 267
      Height = 23
      Caption = 'Ns, '#1095#1080#1089#1083#1086' '#1079#1074#1105#1079#1076' '#1074' '#1075#1072#1083#1072#1082#1090#1080#1082#1077' MWG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 232
      Top = 67
      Width = 212
      Height = 23
      Caption = 'fp, '#1076#1086#1083#1103' '#1079#1074#1105#1079#1076' '#1089' '#1087#1083#1072#1085#1077#1090#1072#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 234
      Top = 114
      Width = 294
      Height = 23
      Caption = 'fl, '#1080#1079' '#1085#1080#1093' '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1083#1080#1090#1086#1089#1092#1077#1088#1072#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 232
      Top = 163
      Width = 227
      Height = 23
      Caption = 'fb, '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1073#1080#1086#1089#1092#1077#1088#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 232
      Top = 211
      Width = 227
      Height = 23
      Caption = 'fn, '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1085#1086#1086#1089#1092#1077#1088#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 232
      Top = 259
      Width = 237
      Height = 23
      Caption = 'ft, '#1076#1086#1083#1103' '#1087#1083#1072#1085#1077#1090' '#1089' '#1090#1077#1093#1085#1086#1089#1092#1077#1088#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 232
      Top = 307
      Width = 438
      Height = 23
      Caption = 'fh, '#1076#1086#1083#1103' '#1074#1088#1077#1084#1077#1085#1080' '#1089#1091#1097#1077#1089#1090#1074#1086#1074#1072#1085#1080#1103' '#1085#1086#1086#1089#1092#1077#1088#1099' '#1085#1072' '#1087#1083#1072#1085#1077#1090#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 36
      Top = 395
      Width = 592
      Height = 94
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticTextNc: TStaticText
        Left = 152
        Top = 16
        Width = 272
        Height = 32
        Caption = 'Nc = Ns * fp * Ne * fl * fi * fc * L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object EditNc: TEdit
      Left = 272
      Top = 449
      Width = 137
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1'
    end
    object EditNs: TEdit
      Left = 80
      Top = 16
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '400000000'
    end
    object EditFp: TEdit
      Left = 80
      Top = 64
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0.333'
    end
    object EditNe: TEdit
      Left = 80
      Top = 112
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '2'
    end
    object EditFl: TEdit
      Left = 80
      Top = 160
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '0.333'
    end
    object EditFi: TEdit
      Left = 80
      Top = 208
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = '0.1'
    end
    object EditFc: TEdit
      Left = 80
      Top = 256
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = '0.1'
    end
    object ButtonNs: TButton
      Left = 175
      Top = 356
      Width = 273
      Height = 25
      Caption = #1054#1094#1077#1085#1082#1072' '#1095#1080#1089#1083#1072' '#1090#1077#1093#1085#1086#1089#1092#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = ButtonNsClick
    end
    object EditfH: TEdit
      Left = 80
      Top = 304
      Width = 138
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Text = '0.00000001'
    end
  end
end
