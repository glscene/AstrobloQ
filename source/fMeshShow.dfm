object FormMeshShow: TFormMeshShow
  Left = 122
  Top = 59
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Mesh Show'
  ClientHeight = 697
  ClientWidth = 1183
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0009999999999999999999999999000000999999999999999999999999990000
    0991111111111111111111111111000099111111111111111111111111110009
    9111111111111111111111111111999911111111111111111111111111119991
    1111111111111111111111111111991EE11EE11EEE11EEEEE11EEE111111991E
    E11EE1EEEEE1EEEEE1EEEEE11111991EE11EE1EE1EE1EE1111EE1EE11111991E
    E11EE1EE1EE1EE1111EE1EE11111991EEEEEE1EE1EE1EE1111EE1EE11111991E
    EEEEE1EE1EE1EE1111EE1EE11111991EE11EE1EE1EE1EE1111EE1EE11111991E
    E11EE1EEEEE1EE1111EEEEE11111991EE11EE11EEE11EE11111EEE1111119911
    1111111111111111111111111111991EEEE1111111111111111EEE1E1111991E
    EEE111EE111111EE1E1E1E1E11EE991EE1EEE1E11E1E11EEEE1E1E1E11E1991E
    E1E1E1E11E1E11EE1E1EEE1E11EE991EE1E1E1EE1EEE11E1E11E111E11E1991E
    E1EEE1111E1E11E1111E111E11EE991EE111111111E11EEE111E111E11119911
    1111111111111111111111111111991EE1E111E1E11E11EEE11EEEE11111991E
    E1E111E1E11E1E11E11E11111111991EE1E111E1E11E1E11E11E11111111991E
    E1E111E1E11E1E11111EEE111111991EE1E1E1E11EE11E11111E11111111991E
    E1EEEEE11EE11E11E11E11111111991EE1EE1EE11EE11EEE111EEEE11111FE00
    0000FC000000F8000000F0000000E00000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu1
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object Splitter1: TSplitter
    Left = 366
    Top = 0
    Width = 5
    Height = 663
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    MinSize = 53
  end
  object Scn: TGLSceneViewer
    Left = 371
    Top = 0
    Width = 812
    Height = 663
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = GLCamera1
    BeforeRender = ScnBeforeRender
    FieldOfView = 162.845504760742200000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = ScnMouseDown
    OnMouseMove = ScnMouseMove
    OnMouseUp = ScnMouseUp
    TabOrder = 0
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 663
    Width = 1183
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <
      item
        Width = 350
      end
      item
        Width = 175
      end
      item
        Width = 175
      end
      item
        Width = 175
      end
      item
        Width = 88
      end>
  end
  object ControlPanel: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 663
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 362
      Height = 659
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Control'
        object Label6: TLabel
          Left = 14
          Top = 336
          Width = 156
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Camera X Position'
        end
        object Label2: TLabel
          Left = 14
          Top = 14
          Width = 123
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Polygon Mode'
        end
        object GroupBox2: TGroupBox
          Left = 14
          Top = 434
          Width = 296
          Height = 114
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Movement Direction'
          TabOrder = 0
          object rbXY: TRadioButton
            Left = 14
            Top = 42
            Width = 198
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Move on X, Y axis'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbZY: TRadioButton
            Left = 14
            Top = 70
            Width = 198
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Move on Z, Y axis'
            TabOrder = 1
          end
        end
        object tbPos: TTrackBar
          Left = 14
          Top = 364
          Width = 296
          Height = 58
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Max = 20
          Position = 5
          TabOrder = 1
          ThumbLength = 35
          OnChange = tbPosChange
        end
        object GroupBox1: TGroupBox
          Left = 14
          Top = 140
          Width = 296
          Height = 184
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Axis'
          TabOrder = 2
          object Bevel1: TBevel
            Left = 14
            Top = 70
            Width = 268
            Height = 4
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Shape = bsBottomLine
          end
          object Label3: TLabel
            Left = 14
            Top = 84
            Width = 106
            Height = 24
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Axis Legend'
          end
          object Label4: TLabel
            Left = 14
            Top = 126
            Width = 55
            Height = 24
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'X Axis'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label5: TLabel
            Left = 84
            Top = 126
            Width = 53
            Height = 24
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Y Axis'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 154
            Top = 126
            Width = 53
            Height = 24
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Z Axis'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chbShowAxis: TCheckBox
            Left = 14
            Top = 28
            Width = 268
            Height = 30
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Show central axis'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chbShowAxisClick
          end
        end
        object chbViewPoints: TCheckBox
          Left = 14
          Top = 98
          Width = 212
          Height = 30
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'View vertex points'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chbViewPointsClick
        end
        object cbPolygonMode: TComboBox
          Left = 14
          Top = 42
          Width = 254
          Height = 32
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csDropDownList
          TabOrder = 4
          OnChange = cbPolygonModeChange
          Items.Strings = (
            'Fill'
            'Lines / mesh'
            'Points')
        end
      end
      object TabSheet2: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Attributes'
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Data'
        ImageIndex = 2
        object Label1: TLabel
          Left = 28
          Top = 158
          Width = 176
          Height = 24
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Subdivision Iterations'
        end
        object TrackBar1: TTrackBar
          Left = 28
          Top = 182
          Width = 198
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Max = 5
          Position = 3
          TabOrder = 0
          ThumbLength = 18
          OnChange = TrackBar1Change
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 14
          Width = 296
          Height = 142
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Mesh Data'
          TabOrder = 1
          object btnVertex: TBitBtn
            Left = 7
            Top = 28
            Width = 131
            Height = 44
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Vertex'
            TabOrder = 0
            OnClick = btnVertexClick
          end
          object btnNormals: TBitBtn
            Left = 7
            Top = 84
            Width = 131
            Height = 44
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Normals'
            TabOrder = 1
            OnClick = btnNormalsClick
          end
          object btnTextcoords: TBitBtn
            Left = 138
            Top = 28
            Width = 151
            Height = 44
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Tex-Coords'
            TabOrder = 2
            OnClick = btnTextcoordsClick
          end
          object btnGroups: TBitBtn
            Left = 138
            Top = 84
            Width = 151
            Height = 44
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Triangle Count'
            TabOrder = 3
            OnClick = btnGroupsClick
          end
        end
      end
    end
  end
  object GLScene1: TGLScene
    Left = 264
    Top = 16
    object GLFreeForm1: TGLFreeForm
      object GLCamera1: TGLCamera
        DepthOfView = 100.000000000000000000
        FocalLength = 50.000000000000000000
        TargetObject = GLFreeForm1
        Position.Coordinates = {0000803F00000040000040400000803F}
        object GLLightSource1: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          SpotCutOff = 180.000000000000000000
        end
      end
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object dcModifiers: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open...'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save...'
        OnClick = Save1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object ViewControlPanel: TMenuItem
        Caption = 'View Control Panel'
        Checked = True
        OnClick = ViewControlPanelClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Holographics|*.hgx'
    Left = 264
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Holographics|*.hgx'
    Left = 360
    Top = 80
  end
end
