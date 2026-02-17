object Form1: TForm1
  Left = 192
  Top = 107
  Caption = 'GrassLan'
  ClientHeight = 453
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object SceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 620
    Height = 453
    Camera = cam
    Buffer.FogEnvironment.FogColor.Color = {BEC0403FBEC0403FBEC0403F0000803F}
    Buffer.FogEnvironment.FogStart = 20.000000000000000000
    Buffer.FogEnvironment.FogEnd = 30.000000000000000000
    Buffer.FogEnvironment.FogDistance = fdEyePlane
    Buffer.BackgroundColor = clTan
    Buffer.ContextOptions = [roDoubleBuffer, roStencilBuffer, roRenderToWindow]
    Buffer.FogEnable = True
    Buffer.AntiAliasing = aa4xHQ
    FieldOfView = 132.356979370117200000
    PenAsTouch = False
    Align = alClient
    OnMouseMove = SceneViewerMouseMove
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 8
    Top = 8
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {000000000000F041000000000000803F}
      SpotCutOff = 180.000000000000000000
      SpotDirection.Coordinates = {00000000000080BF0000000000000000}
    end
    object focus: TGLDummyCube
      Position.Coordinates = {000000000000A040000000000000803F}
      CubeSize = 1.000000000000000000
    end
    object grassland: TGLDummyCube
      CubeSize = 1.000000000000000000
      object grass: TGLActor
        Material.FrontProperties.Diffuse.Color = {000000001283003F000000000000803F}
        Material.FaceCulling = fcNoCull
        Direction.Coordinates = {000000000000803F2EBD3BB300000000}
        PitchAngle = 90.000000000000000000
        Scale.Coordinates = {6F12833B6F12833B6F12833B00000000}
        Up.Coordinates = {000000002EBD3BB3000080BF00000000}
        Reference = aarSkeleton
        AnimationMode = aamBounceForward
        Interval = 1000
        UseMeshMaterials = False
        object grass_90: TGLProxyObject
          MasterObject = grass
          ProxyOptions = [pooEffects, pooObjects]
          Direction.Coordinates = {2CBDBBB300000000FFFF7F3F00000000}
          RollAngle = 90.000000000000000000
          Up.Coordinates = {000080BF2EBD3BB32DBDBBB300000000}
        end
      end
    end
    object grassland_90: TGLProxyObject
      MasterObject = grassland
      Direction.Coordinates = {0000803F000000002EBD3BB300000000}
      TurnAngle = 90.000000000000000000
      Up.Coordinates = {00000000FFFF7F3F0000000000000000}
    end
    object grassland_180: TGLProxyObject
      MasterObject = grassland
      Direction.Coordinates = {2EBDBBB300000000000080BF00000000}
      TurnAngle = 180.000000000000000000
    end
    object grassland_270: TGLProxyObject
      MasterObject = grassland
      Direction.Coordinates = {000080BF000000002EDE4C3200000000}
      TurnAngle = -90.000000000000000000
    end
    object shadows: TGLShadowPlane
      Material.FrontProperties.Diffuse.Color = {BE9F3A3F77BE1F3FCBA1053F0000803F}
      Direction.Coordinates = {000000000000803F2EBD3BB300000000}
      PitchAngle = 90.000000000000000000
      Up.Coordinates = {000000002EBD3BB3000080BF00000000}
      Height = 50.000000000000000000
      Width = 50.000000000000000000
      ShadowedLight = GLLightSource1
      ShadowOptions = [spoUseStencil, spoScissor, spoTransparent]
    end
    object cam: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 100.000000000000000000
      TargetObject = focus
      Position.Coordinates = {0000C0400000C0400000C0400000803F}
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 40
    Top = 8
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 8
    Top = 40
  end
end
