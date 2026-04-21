object FormPopulations: TFormPopulations
  Left = 338
  Top = 179
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1055#1086#1087#1091#1083#1103#1094#1080#1103
  ClientHeight = 333
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object PopGraph: TChart
    Left = 0
    Top = 0
    Width = 446
    Height = 273
    BackWall.Brush.Style = bsClear
    LeftWall.Color = clWhite
    Legend.LegendStyle = lsSeries
    Title.Text.Strings = (
      'Populations')
    Title.Visible = False
    Chart3DPercent = 10
    View3DOptions.FontZoom = 80
    View3DOptions.Perspective = 0
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 438
    ExplicitHeight = 248
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      19
      15
      19)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 273
    Width = 446
    Height = 60
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 248
    ExplicitWidth = 438
    object Label1: TLabel
      Left = 32
      Top = 36
      Width = 81
      Height = 13
      Caption = #1042#1099#1078#1080#1074#1072#1077#1084#1086#1089#1090#1100':'
    end
    object Label2: TLabel
      Left = 184
      Top = 36
      Width = 108
      Height = 13
      Caption = #1063#1072#1089#1090#1086#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
    end
    object Panel4: TPanel
      Left = 337
      Top = 1
      Width = 108
      Height = 58
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 329
      object btnRun: TBitBtn
        Left = 24
        Top = 24
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnRunClick
      end
    end
    object cb3DGraph: TCheckBox
      Left = 86
      Top = 6
      Width = 77
      Height = 17
      Caption = #1043#1088#1072#1092#1080#1082' 3D'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cb3DGraphClick
    end
    object cbCrop: TCheckBox
      Left = 16
      Top = 6
      Width = 51
      Height = 17
      Caption = #1055#1086#1089#1077#1074
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbHiddenRefresh: TCheckBox
      Left = 184
      Top = 6
      Width = 135
      Height = 17
      Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1087#1088#1080' '#1089#1082#1088#1099#1090#1080#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
