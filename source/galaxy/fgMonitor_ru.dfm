inherited FormMonitor: TFormMonitor
  Caption = 'Monitor'
  ClientHeight = 573
  ClientWidth = 854
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 870
  ExplicitHeight = 612
  TextHeight = 30
  object PanelBottom: TPanel
    Left = 0
    Top = 510
    Width = 854
    Height = 63
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 0
    object ButtonOk: TButton
      Left = 687
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
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 183
    Height = 510
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    Indent = 33
    TabOrder = 1
  end
end
