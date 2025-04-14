inherited FormAnalyser: TFormAnalyser
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
    Width = 211
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
      070200000009540054007200650065004E006F00640065002D00000000000000
      0000000000000000FFFFFFFF0000000000000000000000000001075000610074
      006800770061007900000039000000010000000100000001000000FFFFFFFF00
      000000000000000000000000010D4400720061006B006500200066006F007200
      6D0075006C006100}
  end
  object PageControl: TPageControl
    Left = 211
    Top = 0
    Width = 971
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
      Caption = 'Pathway'
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
    object tsDrakeFormula: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Drake formula'
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
