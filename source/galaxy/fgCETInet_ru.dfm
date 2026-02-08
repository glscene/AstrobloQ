inherited FormCETInet: TFormCETInet
  Caption = #1057#1077#1090#1100' CETI'
  ClientHeight = 744
  ClientWidth = 1182
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1198
  ExplicitHeight = 783
  TextHeight = 30
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
    TabOrder = 0
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
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOkClick
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1182
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 1174
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 72
    Width = 1182
    Height = 600
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Caption = 'PanelMiddle'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1174
    ExplicitHeight = 575
  end
end
