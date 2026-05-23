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
        070400000009540054007200650065004E006F00640065002B00000000000000
        00000000FFFFFFFFFFFFFFFF000000000000000000000000000106270435043B
        043D043E043A0400002F0000000000000000000000FFFFFFFFFFFFFFFF000000
        0000000000000000000001081F043E0434043B043E0434043A04300400002F00
        00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001
        08130440043004320438043B04510442040000310000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000000010924043E0442043E043D04
        3404360435044204}
      ExplicitHeight = 385
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
  end
end
