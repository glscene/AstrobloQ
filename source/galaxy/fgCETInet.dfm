inherited FormCETInet: TFormCETInet
  Caption = 'CETI net'
  ClientHeight = 744
  ClientWidth = 1182
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 4
  ExplicitTop = 4
  ExplicitWidth = 1198
  ExplicitHeight = 783
  TextHeight = 30
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 1182
    Height = 672
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 211
    ExplicitWidth = 971
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
    TabOrder = 1
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
