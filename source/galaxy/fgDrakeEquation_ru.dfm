inherited FormDrakeQuation: TFormDrakeQuation
  Caption = 'Analyser'
  ClientHeight = 744
  ClientWidth = 1182
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1198
  ExplicitHeight = 783
  TextHeight = 30
  object tvAnalyzer: TTreeView
    Left = 0
    Top = 0
    Width = 257
    Height = 672
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    AutoExpand = True
    Indent = 33
    TabOrder = 0
    OnClick = tvAnalyzerClick
    Items.NodeData = {
      070200000009540054007200650065004E006F00640065003F00000001000000
      0100000001000000FFFFFFFF0000000000000000000000000001102304400430
      0432043D0435043D0438043504200014044004350439043A04300400003D0000
      00000000000000000000000000FFFFFFFF00000000000000000000000000010F
      1A0440043004420447043004390448043804390420003F04430442044C04}
  end
  object PageControl: TPageControl
    Left = 257
    Top = 0
    Width = 925
    Height = 672
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = tsAverageDistance
    Align = alClient
    TabOrder = 1
    object tsAverageDistance: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #1050#1088#1072#1090#1095#1072#1081#1096#1080#1081' '#1087#1091#1090#1100
      object NumberBox1: TNumberBox
        Left = 404
        Top = 101
        Width = 237
        Height = 39
        Hint = 'Distance'
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
        Mode = nbmInt64
        MaxValue = 100000.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 100000.000000000000000000
        SpinButtonOptions.ButtonWidth = 30
      end
      object StaticText1: TStaticText
        Left = 335
        Top = 101
        Width = 18
        Height = 34
        Hint = 'Number of noospheres'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = '='
        TabOrder = 1
      end
      object StaticText3: TStaticText
        Left = 263
        Top = 101
        Width = 29
        Height = 34
        Hint = 'Number of noospheres'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Dc'
        TabOrder = 2
      end
    end
    object tsDrakeEquation: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #1059#1088#1072#1074#1085#1077#1085#1080#1077' '#1044#1088#1077#1081#1082#1072
      ImageIndex = 1
    end
  end
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
    TabOrder = 2
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
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOkClick
    end
  end
end
