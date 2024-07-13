object FormDataset: TFormDataset
  Left = 0
  Top = 0
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  Caption = #1050#1072#1090#1072#1083#1086#1075' HYG'
  ClientHeight = 602
  ClientWidth = 1134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  DesignSize = (
    1134
    602)
  TextHeight = 23
  object RadioGroup1: TRadioGroup
    Left = 952
    Top = 14
    Width = 169
    Height = 519
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Anchors = [akTop, akRight]
    Caption = 'Classes'
    Items.Strings = (
      'A_Delaunay'
      'A_Voronoi'
      'B_Delaunay'
      'B_Voronoi'
      'F_Delaunay'
      'F_Voronoi'
      'G_Delaunay'
      'G_Voronoi'
      'K_Delaunay'
      'K_Voronoi'
      'M_Delaunay'
      'M_Voronoi'
      'O_Delaunay'
      'O_Voronoi')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object DBGrid1: TDBGrid
    Left = 14
    Top = 97
    Width = 928
    Height = 491
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RadioGroup2: TRadioGroup
    Left = 14
    Top = 14
    Width = 928
    Height = 71
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Tables'
    Columns = 5
    TabOrder = 2
    OnClick = RadioGroup2Click
  end
  object FDConnection1: TFDConnection
    Left = 224
    Top = 162
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 430
    Top = 260
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 422
    Top = 372
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 436
    Top = 156
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 220
    Top = 268
  end
end
