object FormPopulations: TFormPopulations
  Left = 338
  Top = 179
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1077
  ClientHeight = 582
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object PopGraph: TChart
    Left = 0
    Top = 0
    Width = 780
    Height = 477
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    BackWall.Brush.Style = bsClear
    LeftWall.Color = clWhite
    Legend.LegendStyle = lsSeries
    Title.Text.Strings = (
      'Populations')
    Title.Visible = False
    Chart3DPercent = 10
    View3DOptions.FontZoom = 140
    View3DOptions.Perspective = 0
    Align = alClient
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      19
      15
      19)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      HoverElement = [heCurrent]
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
    Top = 477
    Width = 780
    Height = 105
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 28
      Top = 63
      Width = 89
      Height = 24
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Crop Rate:'
    end
    object Label2: TLabel
      Left = 263
      Top = 63
      Width = 113
      Height = 24
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Refresh Rate:'
    end
    object Panel4: TPanel
      Left = 589
      Top = 1
      Width = 190
      Height = 103
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnRun: TBitBtn
        Left = 42
        Top = 42
        Width = 132
        Height = 43
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnRunClick
      end
    end
    object cb3DGraph: TCheckBox
      Left = 123
      Top = 14
      Width = 135
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = '3-D Graph'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cb3DGraphClick
    end
    object cbCrop: TCheckBox
      Left = 25
      Top = 14
      Width = 88
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Crop'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbHiddenRefresh: TCheckBox
      Left = 266
      Top = 14
      Width = 237
      Height = 29
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Refresh When Hidden'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
