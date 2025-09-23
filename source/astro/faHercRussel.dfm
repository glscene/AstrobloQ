object FormHercrussel: TFormHercrussel
  Left = 0
  Top = 0
  Caption = 'Hercshprung-Russel Diagram'
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
