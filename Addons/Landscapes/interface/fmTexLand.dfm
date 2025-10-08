object Form1: TForm1
  Left = 197
  Top = 129
  Caption = 'Form1'
  ClientHeight = 524
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object SceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 811
    Height = 524
    Camera = Camera
    Buffer.ContextOptions = [roDoubleBuffer, roRenderToWindow, roNoColorBufferClear]
    FieldOfView = 142.083633422851600000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 90
    Top = 18
    object GLEarthSkyDome1: TGLEarthSkyDome
      Direction.Coordinates = {000000330000803F0000000000000000}
      RollAngle = -10.000000000000000000
      Up.Coordinates = {D2D0313E990029B25D1C7CBF00000000}
      Bands = <>
      Stars = <>
      SunElevation = 45.000000000000000000
      Turbidity = 10.000000000000000000
      ExtendedOptions = []
      Slices = 48
      Stacks = 24
    end
    object dcCamera: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Camera: TGLCamera
        DepthOfView = 500.000000000000000000
        FocalLength = 90.000000000000000000
        Direction.Coordinates = {00000000000000000000803F00000000}
        object Light: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Position.Coordinates = {000000000000A040000000000000803F}
          SpotCutOff = 180.000000000000000000
        end
      end
    end
    object Terrain: TGLTerrainRenderer
      Direction.Coordinates = {000000000000803F0000000000000000}
      Position.Coordinates = {000040C300000000000040430000803F}
      Scale.Coordinates = {00004040000040400000803F00000000}
      Up.Coordinates = {0000000000000000000080BF00000000}
      HeightDataSource = BitmapHDS
      TileSize = 64
      TilesPerTexture = 2.000000000000000000
      QualityDistance = 1000.000000000000000000
      CLODPrecision = 2000
      OcclusionTesselate = totTesselateAlways
      ContourWidth = 0
    end
  end
  object Cadencer: TGLCadencer
    Scene = GLScene1
    OnProgress = CadencerProgress
    Left = 234
    Top = 18
  end
  object BitmapHDS: TGLBitmapHDS
    InfiniteWrap = False
    MaxPoolSize = 0
    Left = 370
    Top = 18
  end
  object AsyncTimer: TGLAsyncTimer
    Enabled = True
    Interval = 800
    OnTimer = AsyncTimerTimer
    Left = 82
    Top = 98
  end
end
