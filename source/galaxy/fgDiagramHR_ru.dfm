object frmDiagramHR: TfrmDiagramHR
  Left = 0
  Top = 0
  Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072' '#1043#1077#1088#1094#1096#1087#1088#1091#1085#1075#1072'-'#1056#1072#1089#1089#1077#1083#1072
  ClientHeight = 433
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 296
    Height = 433
    Buffer.BackgroundColor = clGray
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object PanelRight: TPanel
    Left = 296
    Top = 0
    Width = 448
    Height = 433
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 288
    ExplicitHeight = 408
    object Chart1: TChart
      Left = 24
      Top = 56
      Width = 400
      Height = 250
      BackWall.Pen.Visible = False
      BottomWall.Brush.Gradient.EndColor = clSilver
      BottomWall.Brush.Gradient.StartColor = clGray
      BottomWall.Brush.Gradient.Visible = True
      BottomWall.Pen.Color = clGray
      BottomWall.Size = 4
      Gradient.Direction = gdFromTopLeft
      Gradient.EndColor = clWhite
      Gradient.StartColor = clSilver
      Gradient.Visible = True
      LeftWall.Brush.Gradient.EndColor = clSilver
      LeftWall.Brush.Gradient.StartColor = clGray
      LeftWall.Brush.Gradient.Visible = True
      LeftWall.Color = clWhite
      LeftWall.Pen.Color = clGray
      LeftWall.Size = 4
      Title.Text.Strings = (
        'TChart')
      BottomAxis.Grid.Color = 14540253
      BottomAxis.LabelsFormat.Font.Color = clGray
      BottomAxis.LabelsFormat.Font.Height = -16
      BottomAxis.LabelStyle = talValue
      Frame.Visible = False
      LeftAxis.Grid.Color = 14540253
      LeftAxis.LabelsFormat.Font.Color = clGray
      LeftAxis.LabelsFormat.Font.Height = -16
      LeftAxis.LabelStyle = talValue
      Zoom.Animated = True
      BevelWidth = 2
      Color = clWhite
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
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
      object Series2: TPointSeries
        ClickableLine = False
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object GLScene1: TGLScene
    Left = 56
    Top = 32
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 50
    Top = 134
  end
  object GLCadencer1: TGLCadencer
    Left = 168
    Top = 32
  end
  object Timer1: TTimer
    Left = 168
    Top = 128
  end
  object SeriesDataSet1: TSeriesDataSet
    Left = 424
    Top = 328
  end
  object ChartDataSet1: TChartDataSet
    Left = 544
    Top = 328
  end
end
