object FormCrafts: TFormCrafts
  Left = 0
  Top = 0
  Caption = 'SpaceCrafts'
  ClientHeight = 412
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 412
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 387
    object tvCraft: TTreeView
      Left = 1
      Top = 1
      Width = 127
      Height = 410
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tvCraftClick
      Items.NodeData = {
        070400000009540054007200650065004E006F00640065003100000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001092104430431
        043C043004400438043D0430040000290000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000000000000010528043004420442043B0400002F00
        00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001
        08130440043004320438043B04510442040000350000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000000010B10043D043D0438043304
        38043B044F0442043E044004}
      ExplicitHeight = 385
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
  end
end
