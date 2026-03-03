inherited FormStatistics: TFormStatistics
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1043#1072#1083#1072#1082#1090#1080#1082#1077
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
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 1203
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 72
    Width = 1211
    Height = 691
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Caption = 'PanelMiddle'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1203
    ExplicitHeight = 666
    object TeePreviewPanel1: TTeePreviewPanel
      Left = 88
      Top = -18
      Width = 1040
      Height = 726
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
    end
  end
  object TeeGDIPlus1: TTeeGDIPlus
    Left = 592
    Top = 336
  end
end
