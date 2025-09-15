object FormDataset: TFormDataset
  Left = 0
  Top = 0
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = #1050#1072#1090#1072#1083#1086#1075' HYG'
  ClientHeight = 344
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    648
    344)
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 536
    Top = 8
    Width = 97
    Height = 297
    Anchors = [akTop, akRight]
    Caption = #1050#1083#1072#1089#1089#1099
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
    ExplicitLeft = 528
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 55
    Width = 522
    Height = 281
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 8
    Width = 522
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1072#1073#1083#1080#1094#1099
    Columns = 5
    TabOrder = 2
    OnClick = RadioGroup2Click
    ExplicitWidth = 514
  end
  object FDConnection1: TFDConnection
    Left = 208
    Top = 98
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 422
    Top = 188
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 422
    Top = 372
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 420
    Top = 92
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 212
    Top = 196
  end
end
