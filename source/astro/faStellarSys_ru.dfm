object frmStellarSys: TfrmStellarSys
  Left = 193
  Top = 128
  Caption = #1055#1083#1072#1085#1077#1090#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
  ClientHeight = 528
  ClientWidth = 971
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object svStarsys: TGLSceneViewer
    Left = 195
    Top = 0
    Width = 629
    Height = 510
    Camera = Camera
    Buffer.FogEnvironment.FogColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
    Buffer.FogEnvironment.FogStart = 10.000000000000000000
    Buffer.FogEnvironment.FogEnd = 1000.000000000000000000
    Buffer.FogEnvironment.FogDistance = fdEyePlane
    Buffer.BackgroundColor = clBackground
    FieldOfView = 137.174057006835900000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = svStarsysMouseDown
    TabOrder = 0
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 195
    Height = 510
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    ExplicitHeight = 485
    object tvStarSys: TTreeView
      Left = 4
      Top = 4
      Width = 187
      Height = 502
      Align = alClient
      BevelKind = bkTile
      BorderStyle = bsNone
      Indent = 19
      TabOrder = 0
      OnChange = tvStarSysChange
      OnClick = tvStarSysClick
      ExplicitHeight = 477
    end
  end
  object PanelRight: TPanel
    Left = 824
    Top = 0
    Width = 147
    Height = 510
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 816
    ExplicitHeight = 485
    object Splitter1: TSplitter
      Left = 1
      Top = 18
      Width = 145
      Height = 20
      Cursor = crVSplit
      Align = alTop
      AutoSnap = False
      MinSize = 120
      ExplicitTop = 81
      ExplicitWidth = 134
    end
    object stPickObject: TStaticText
      Left = 1
      Top = 1
      Width = 145
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'stPickObject'
      TabOrder = 0
    end
    object cbOrbit: TCheckBox
      Left = 29
      Top = 173
      Width = 97
      Height = 17
      Caption = #1054#1088#1073#1080#1090#1099
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbOrbitClick
    end
    object cbStarHZ: TCheckBox
      Left = 29
      Top = 196
      Width = 97
      Height = 17
      Caption = #1047#1086#1085#1072' '#1086#1073#1080#1090#1072#1085#1080#1103
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbStarHZClick
    end
    object MemoInfo: TMemo
      Left = 1
      Top = 379
      Width = 145
      Height = 130
      Align = alBottom
      Lines.Strings = (
        'Memo1')
      TabOrder = 3
      ExplicitTop = 354
    end
    object cbRotation: TCheckBox
      Left = 29
      Top = 224
      Width = 97
      Height = 17
      Caption = #1042#1088#1072#1097#1077#1085#1080#1077
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbRotationClick
    end
    inline FrameParamsR: TFrameParamsR
      Left = 1
      Top = 38
      Width = 145
      Height = 65
      Align = alTop
      TabOrder = 5
      ExplicitLeft = 1
      ExplicitTop = 38
      ExplicitWidth = 145
      ExplicitHeight = 65
    end
    object chbInnerCore: TCheckBox
      Left = 32
      Top = 256
      Width = 97
      Height = 17
      Caption = #1056#1072#1079#1088#1077#1079' '#1085#1077#1076#1088
      TabOrder = 6
      OnClick = chbInnerCoreClick
    end
  end
  object StatusBarSol: TStatusBar
    Left = 0
    Top = 510
    Width = 971
    Height = 18
    Panels = <>
    ExplicitTop = 485
    ExplicitWidth = 963
  end
  object GLSceneStarsys: TGLScene
    Left = 46
    Top = 28
    object SkyDome: TGLSkyDome
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 15.000000000000000000
        end
        item
          StartAngle = 15.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Stacks = 4
        end>
      Stars = <>
    end
    object SolarSystem: TGLDummyCube
      CubeSize = 1000.000000000000000000
      object Camera: TGLCamera
        DepthOfView = 10000.000000000000000000
        FocalLength = 100.000000000000000000
        NearPlaneBias = 0.100000001490116100
        TargetObject = SolarSystem
        CameraStyle = csInfinitePerspective
        Position.Coordinates = {0000204100002041000020410000803F}
        object LightSource: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          SpotCutOff = 180.000000000000000000
        end
      end
      object Sun: TGLSphere
        Material.FrontProperties.Emission.Color = {9A99593F9A99593FCDCCCC3D0000803F}
        Material.Texture.Disabled = False
        Radius = 0.699999988079071000
        Slices = 32
        Stacks = 32
        EffectsData = {
          0458434F4C02010201060A54474C424669726546580201020006064669726546
          5802000200060D4669726546584D616E61676572}
      end
      object StarHZUp: TGLDisk
        Material.BackProperties.Diffuse.Color = {CDCC4C3E0000803FCDCC4C3E9A99993E}
        Material.FrontProperties.Diffuse.Color = {CDCC4C3E0000803FCDCC4C3E9A99993E}
        Material.BlendingMode = bmTransparency
        Material.FaceCulling = fcCull
        Direction.Coordinates = {000000000000803F0000000000000000}
        PitchAngle = 90.000000000000000000
        Up.Coordinates = {0000000000000000000080BF00000000}
        Visible = False
        Pickable = False
        InnerRadius = 4.800000190734863000
        Loops = 1
        OuterRadius = 9.500000000000000000
        Slices = 64
        SweepAngle = 360.000000000000000000
      end
      object StarHZDown: TGLDisk
        Material.BackProperties.Diffuse.Color = {CDCC4C3E0000803FCDCC4C3E9A99993E}
        Material.FrontProperties.Ambient.Color = {000000000000003F000000000000803F}
        Material.FrontProperties.Diffuse.Color = {CDCC4C3E0000803FCDCC4C3E9A99993E}
        Material.BlendingMode = bmTransparency
        Material.FaceCulling = fcCull
        Direction.Coordinates = {00000000000080BF0000000000000000}
        PitchAngle = 90.000000000000000000
        Up.Coordinates = {0000000000000000000080BF00000000}
        Visible = False
        Pickable = False
        InnerRadius = 4.800000190734863000
        Loops = 1
        OuterRadius = 9.500000000000000000
        Slices = 64
        SweepAngle = 360.000000000000000000
      end
      object dcMercury: TGLDummyCube
        Tag = 1
        CubeSize = 1.000000000000000000
        object Mercury: TGLSphere
          Tag = 1
          Material.Texture.Disabled = False
          Position.Coordinates = {0000000000000000000000400000803F}
          Radius = 0.319999992847442600
          Slices = 64
          Stacks = 64
        end
        object MercuryOrbit: TGLTorus
          Tag = 1
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 2.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcVenus: TGLDummyCube
        Tag = 1
        CubeSize = 1.000000000000000000
        object Venus: TGLSphere
          Tag = 1
          Material.Texture.Disabled = False
          Position.Coordinates = {0000000000000000000080400000803F}
          Radius = 0.750000000000000000
          Slices = 64
          Stacks = 64
        end
        object VenusOrbit: TGLTorus
          Tag = 2
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 4.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcEarth: TGLDummyCube
        Tag = 3
        CubeSize = 1.000000000000000000
        object Earth: TGLSphere
          Tag = 3
          Material.Texture.Disabled = False
          Position.Coordinates = {00000000000000000000E0400000803F}
          RollAngle = 23.440000534057620000
          Up.Coordinates = {F0AACBBEC8DF6A3F0000000000000000}
          Radius = 0.800000011920929000
          Slices = 64
          Stacks = 64
          object dcMoon: TGLDummyCube
            Tag = 3
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Moon: TGLSphere
              Tag = 3
              TagFloat = 1.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {00000000000000000000C03F0000803F}
              Radius = 0.200000002980232200
              Slices = 64
              Stacks = 64
            end
          end
        end
        object EarthOrbit: TGLTorus
          Tag = 3
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 7.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcMars: TGLDummyCube
        Tag = 4
        CubeSize = 1.000000000000000000
        object Mars: TGLSphere
          Tag = 4
          Material.Texture.Disabled = False
          Position.Coordinates = {0000000000000000000020C10000803F}
          Radius = 0.400000005960464500
          Slices = 64
          Stacks = 64
          object dcPhobos: TGLDummyCube
            Tag = 4
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Phobos: TGLFreeForm
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000333333BF0000803F}
            end
          end
          object dcDeimos: TGLDummyCube
            Tag = 4
            TagFloat = 2.000000000000000000
            CubeSize = 1.000000000000000000
            object Deimos: TGLFreeForm
              Material.Texture.Disabled = False
              Position.Coordinates = {00000000000000006666663F0000803F}
            end
          end
        end
        object MarsOrbit: TGLTorus
          Tag = 4
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 10.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          Sides = 32
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcJupiter: TGLDummyCube
        Tag = 5
        CubeSize = 1.000000000000000000
        object Jupiter: TGLSphere
          Tag = 5
          Material.Texture.Disabled = False
          Position.Coordinates = {00000000000000000000B0C10000803F}
          Radius = 3.400000095367432000
          Slices = 64
          Stacks = 64
          object dcIo: TGLDummyCube
            Tag = 5
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Io: TGLSphere
              Tag = 5
              TagFloat = 1.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000000080C00000803F}
              Radius = 0.239999994635582000
              Slices = 64
              Stacks = 64
            end
          end
          object dcEuropa: TGLDummyCube
            Tag = 5
            TagFloat = 2.000000000000000000
            CubeSize = 1.000000000000000000
            object Europa: TGLSphere
              Tag = 5
              TagFloat = 2.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {00000000000000000000A0400000803F}
              Radius = 0.239999994635582000
              Slices = 64
              Stacks = 64
            end
          end
          object dcGanymede: TGLDummyCube
            Tag = 5
            TagFloat = 3.000000000000000000
            CubeSize = 1.000000000000000000
            object Ganymede: TGLSphere
              Tag = 5
              TagFloat = 3.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {00000000000000000000C0C00000803F}
              Radius = 0.379999995231628400
              Slices = 64
              Stacks = 64
            end
          end
          object dcCallisto: TGLDummyCube
            Tag = 5
            TagFloat = 4.000000000000000000
            CubeSize = 1.000000000000000000
            object Callisto: TGLSphere
              Tag = 5
              TagFloat = 4.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {00000000000000000000E0400000803F}
              Radius = 0.259999990463256800
              Slices = 64
              Stacks = 64
            end
          end
          object JupiterRing: TGLDisk
            Material.BackProperties.Ambient.Color = {0000803FF8FEFE3E000000000000803F}
            Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Ambient.Color = {0000003F0000003F0000003F0000803F}
            Material.FrontProperties.Diffuse.Color = {0000003F0000003F0000003F0000803F}
            Material.FrontProperties.Emission.Color = {0000003F0000003F0000003F0000803F}
            Material.FrontProperties.Specular.Color = {0000003F0000003F0000003F0000803F}
            Material.BlendingMode = bmTransparency
            Material.FaceCulling = fcNoCull
            ObjectsSorting = osRenderNearestFirst
            Direction.Coordinates = {000000000000803F2EBD3BB300000000}
            PitchAngle = 90.000000000000000000
            Up.Coordinates = {000000002EBD3BB3000080BF00000000}
            Visible = False
            InnerRadius = 5.000000000000000000
            OuterRadius = 6.000000000000000000
            Slices = 64
            SweepAngle = 360.000000000000000000
          end
        end
        object JupiterOrbit: TGLTorus
          Tag = 5
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 22.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcSaturn: TGLDummyCube
        Tag = 6
        CubeSize = 1.000000000000000000
        object Saturn: TGLSphere
          Tag = 6
          Material.Texture.Disabled = False
          Position.Coordinates = {0000000000000000000020420000803F}
          Radius = 3.000000000000000000
          Slices = 64
          Stacks = 64
          object SaturnRing: TGLDisk
            Material.BackProperties.Ambient.Color = {0000803FF8FEFE3E000000000000803F}
            Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
            Material.Texture.Disabled = False
            Material.FaceCulling = fcNoCull
            ObjectsSorting = osRenderNearestFirst
            Direction.Coordinates = {000000000000803F2EBD3BB300000000}
            PitchAngle = 90.000000000000000000
            Up.Coordinates = {000000002EBD3BB3000080BF00000000}
            InnerRadius = 3.200000047683716000
            OuterRadius = 6.000000000000000000
            Slices = 64
            SweepAngle = 360.000000000000000000
          end
          object dcEnceladus: TGLDummyCube
            Tag = 6
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Enceladus: TGLSphere
              Tag = 6
              TagFloat = 1.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000000000410000803F}
              Radius = 0.100000001490116100
              Slices = 64
              Stacks = 64
            end
          end
          object dcTitan: TGLDummyCube
            Tag = 6
            TagFloat = 2.000000000000000000
            CubeSize = 1.000000000000000000
            object Titan: TGLSphere
              Tag = 6
              TagFloat = 2.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000000020410000803F}
              Radius = 0.500000000000000000
              Slices = 64
              Stacks = 64
            end
          end
        end
        object SaturnOrbit: TGLTorus
          Tag = 6
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 40.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcUranus: TGLDummyCube
        Tag = 7
        CubeSize = 1.000000000000000000
        object Uranus: TGLSphere
          Tag = 7
          Material.Texture.Disabled = False
          Position.Coordinates = {0000000000000000000070420000803F}
          RollAngle = 45.000000000000000000
          Up.Coordinates = {F30435BFF304353F0000000000000000}
          Radius = 2.200000047683716000
          Slices = 64
          Stacks = 64
          object UranusRing: TGLDisk
            Material.BackProperties.Ambient.Color = {0000803FF8FEFE3E000000000000803F}
            Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Ambient.Color = {0000003F0000003F0000003F0000803F}
            Material.FrontProperties.Diffuse.Color = {0000003F0000003F0000003F0000803F}
            Material.FrontProperties.Emission.Color = {0000003F0000003F0000003F0000803F}
            Material.FrontProperties.Specular.Color = {0000003F0000003F0000003F0000803F}
            Material.FaceCulling = fcNoCull
            ObjectsSorting = osRenderNearestFirst
            Direction.Coordinates = {000000000000803F2EBD3BB300000000}
            PitchAngle = 90.000000000000000000
            Up.Coordinates = {000000002EBD3BB3000080BF00000000}
            InnerRadius = 2.799999952316284000
            OuterRadius = 3.200000047683716000
            Slices = 64
            SweepAngle = 360.000000000000000000
          end
          object dcTitania: TGLDummyCube
            Tag = 7
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Titania: TGLSphere
              Tag = 7
              TagFloat = 1.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000000080400000803F}
              Radius = 0.250000000000000000
              Slices = 64
              Stacks = 64
            end
          end
          object dcMiranda: TGLDummyCube
            Tag = 7
            TagFloat = 2.000000000000000000
            CubeSize = 1.000000000000000000
            object Miranda: TGLSphere
              Tag = 7
              TagFloat = 2.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000000040C00000803F}
              Radius = 0.200000002980232200
              Slices = 64
              Stacks = 64
            end
          end
        end
        object UranusOrbit: TGLTorus
          Tag = 7
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 60.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcNeptune: TGLDummyCube
        Tag = 8
        CubeSize = 1.000000000000000000
        object Neptune: TGLSphere
          Tag = 8
          Material.Texture.Disabled = False
          Position.Coordinates = {00000000000000000000A0420000803F}
          Radius = 2.099999904632568000
          Slices = 64
          Stacks = 64
          object NeptuneRing: TGLDisk
            Material.BackProperties.Ambient.Color = {0000803FF8FEFE3E000000000000803F}
            Material.BackProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
            Material.BackProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Ambient.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
            Material.FrontProperties.Specular.Color = {0000803F0000803F0000803F0000803F}
            Material.Texture.Disabled = False
            Material.FaceCulling = fcNoCull
            ObjectsSorting = osRenderNearestFirst
            Direction.Coordinates = {000000000000803F2EBD3BB300000000}
            PitchAngle = 90.000000000000000000
            Up.Coordinates = {000000002EBD3BB3000080BF00000000}
            InnerRadius = 4.000000000000000000
            OuterRadius = 4.199999809265137000
            Slices = 64
            SweepAngle = 360.000000000000000000
          end
          object dcTriton: TGLDummyCube
            Tag = 8
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Triton: TGLSphere
              Tag = 8
              TagFloat = 1.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {00000000000000000000A0400000803F}
              Radius = 0.180000007152557400
              Slices = 64
              Stacks = 64
            end
          end
        end
        object NeptuneOrbit: TGLTorus
          Tag = 8
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 80.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
      object dcPluto: TGLDummyCube
        Tag = 9
        CubeSize = 1.000000000000000000
        object Pluto: TGLSphere
          Tag = 9
          Material.Texture.Disabled = False
          Position.Coordinates = {00000000000000000000C8420000803F}
          Radius = 0.300000011920929000
          Slices = 64
          Stacks = 64
          object dcCharon: TGLDummyCube
            Tag = 9
            TagFloat = 1.000000000000000000
            CubeSize = 1.000000000000000000
            object Charon: TGLSphere
              Tag = 9
              TagFloat = 1.000000000000000000
              Material.Texture.Disabled = False
              Position.Coordinates = {0000000000000000000080BF0000803F}
              Radius = 0.100000001490116100
              Slices = 32
              Stacks = 32
            end
          end
        end
        object PlutoOrbit: TGLTorus
          Tag = 9
          Direction.Coordinates = {000000000000803F2EBD3BB300000000}
          PitchAngle = 90.000000000000000000
          Up.Coordinates = {000000002EBD3BB3000080BF00000000}
          Visible = False
          Pickable = False
          MajorRadius = 100.000000000000000000
          MinorRadius = 0.029999999329447750
          Rings = 64
          StopAngle = 360.000000000000000000
          Parts = [toSides, toStartDisk, toStopDisk]
        end
      end
    end
    object sys_dogl: TGLDirectOpenGL
      Visible = False
      UseBuildList = False
      OnRender = sys_doglRender
      Blend = False
      object lineAxis: TGLLines
        LineWidth = 2.000000000000000000
        Nodes = <
          item
            Color.Color = {0000000039B4483F000000000000803F}
          end
          item
            X = 0.500000000000000000
            Color.Color = {0000000039B4483F000000000000803F}
          end
          item
            Color.Color = {39B4483F00000000000000000000803F}
          end
          item
            Y = 0.500000000000000000
            Color.Color = {39B4483F00000000000000000000803F}
          end
          item
            Color.Color = {000000000000000039B4483F0000803F}
          end
          item
            Z = 0.500000000000000000
            Color.Color = {000000000000000039B4483F0000803F}
          end>
        NodesAspect = lnaInvisible
        SplineMode = lsmSegments
        Options = [loUseNodeColorForLines]
      end
      object bb_lines: TGLLines
        Nodes = <>
        NodesAspect = lnaInvisible
        SplineMode = lsmSegments
        Options = []
      end
    end
  end
  object Cadencer: TGLCadencer
    Scene = GLSceneStarsys
    Mode = cmApplicationIdle
    SleepLength = 1
    OnProgress = CadencerProgress
    Left = 40
    Top = 112
  end
  object AsyncTimer: TGLAsyncTimer
    Enabled = True
    Interval = 800
    OnTimer = AsyncTimerTimer
    Left = 128
    Top = 112
  end
  object MatLib: TGLMaterialLibrary
    Left = 128
    Top = 32
  end
  object FireFXManager: TGLFireFXManager
    FireDir.Coordinates = {00000000000000000000000000000000}
    InitialDir.Coordinates = {00000000000000000000000000000000}
    Cadencer = Cadencer
    MaxParticles = 128
    FireDensity = 0.100000001490116100
    FireEvaporation = 0.500000000000000000
    ParticleLife = 1
    FireRadius = 0.500000000000000000
    Disabled = False
    Paused = False
    ParticleInterval = 0.500000000000000000
    UseInterval = False
    Reference = Sun
    Left = 96
    Top = 208
  end
  object MainMenu: TMainMenu
    Left = 278
    Top = 104
    object N2: TMenuItem
      Caption = #1060#1072#1081#1083
      object miOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = miOpenClick
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object Window1: TMenuItem
      Caption = #1042#1080#1076
      object N1: TMenuItem
        Caption = '-'
      end
      object miHidePanels: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1080
        Checked = True
        OnClick = miHidePanelsClick
      end
    end
  end
  object SimpleNavigation: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = svStarsys
    FormCaption = #1069#1082#1079#1086#1087#1083#1072#1085#1077#1090#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
    Options = [snoMouseWheelHandled]
    KeyCombinations = <
      item
        ShiftState = [ssLeft, ssRight]
        Action = snaZoom
      end
      item
        ShiftState = [ssLeft]
        Action = snaMoveAroundTarget
      end
      item
        ShiftState = [ssRight]
        Action = snaMoveAroundTarget
      end>
    Left = 274
    Top = 180
  end
end
