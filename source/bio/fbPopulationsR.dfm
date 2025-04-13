object FormPopulations: TFormPopulations
  Left = 338
  Top = 179
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Polulation'
  ClientHeight = 333
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
    Top = 273
    Width = 446
    Height = 60
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 36
      Width = 51
      Height = 13
      Caption = 'Crop Rate:'
    end
    object Label2: TLabel
      Left = 150
      Top = 36
      Width = 66
      Height = 13
      Caption = 'Refresh Rate:'
    end
    object Panel4: TPanel
      Left = 337
      Top = 1
      Width = 108
      Height = 58
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnRun: TBitBtn
        Left = 24
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Close'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnRunClick
      end
    end
    object cb3DGraph: TCheckBox
      Left = 70
      Top = 8
      Width = 77
      Height = 17
      Caption = '3-D Graph'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cb3DGraphClick
    end
    object cbCrop: TCheckBox
      Left = 14
      Top = 8
      Width = 51
      Height = 17
      Caption = 'Crop'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbHiddenRefresh: TCheckBox
      Left = 152
      Top = 8
      Width = 135
      Height = 17
      Caption = 'Refresh When Hidden'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
