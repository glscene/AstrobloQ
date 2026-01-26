object FormHercrussel: TFormHercrussel
  Left = 0
  Top = 0
  Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072' '#1043#1077#1088#1094#1096#1087#1088#1091#1085#1075#1072'-'#1056#1072#1089#1089#1077#1083#1072
  ClientHeight = 433
  ClientWidth = 630
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
    Width = 496
    Height = 433
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 504
  end
  object PanelRight: TPanel
    Left = 496
    Top = 0
    Width = 134
    Height = 433
    Align = alRight
    TabOrder = 1
  end
  object GLScene1: TGLScene
    Left = 56
    Top = 32
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 50
    Top = 134
  end
end
