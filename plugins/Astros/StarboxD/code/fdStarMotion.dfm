object frmPlanetFF: TfrmPlanetFF
  Left = 0
  Top = 0
  Caption = 'Star motion'
  ClientHeight = 583
  ClientWidth = 853
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object GLSceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 853
    Height = 564
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 159.891326904296900000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 564
    Width = 853
    Height = 19
    Panels = <>
    ExplicitTop = 539
    ExplicitWidth = 845
  end
  object GLScene1: TGLScene
    Left = 146
    Top = 42
    object WhiteLight: TGLLightSource
      Ambient.Color = {0000803F0000803F0000803F0000803F}
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {00007A4400007A4400007A440000803F}
      LightStyle = lsParallel
      SpotCutOff = 180.000000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 10000000000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcSceneAI
      Position.Coordinates = {00007A4400007A4400007A440000803F}
    end
    object dcSceneAI: TGLDummyCube
      ShowAxes = True
      CubeSize = 1000.000000000000000000
      object dcRedLight: TGLDummyCube
        CubeSize = 1000.000000000000000000
        object RedLight: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Diffuse.Color = {0000803F00000000000000000000803F}
          Position.Coordinates = {0000484300000000000000000000803F}
          LightStyle = lsOmni
          SpotCutOff = 180.000000000000000000
          object RedStar: TGLSphere
            Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
            Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
            Material.FrontProperties.Emission.Color = {0000803F00000000000000000000803F}
            Radius = 100.000000000000000000
            Slices = 16
            Stacks = 16
          end
        end
      end
      object dcGreenLight: TGLDummyCube
        CubeSize = 1.000000000000000000
        object GreenLight: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Diffuse.Color = {0AD7A33E48E1FA3E1F85EB3E0000803F}
          Position.Coordinates = {0000000000000000000048430000803F}
          SpotCutOff = 180.000000000000000000
          object GreenStar: TGLSphere
            Material.FrontProperties.Diffuse.Color = {000000000000003F000000000000803F}
            Material.FrontProperties.Emission.Color = {000000000000003F000000000000803F}
            Radius = 100.000000000000000000
            Slices = 16
            Stacks = 16
          end
        end
      end
      object dcBlueLight: TGLDummyCube
        CubeSize = 1.000000000000000000
        object BlueLight: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Diffuse.Color = {00000000000000000000803F0000803F}
          Position.Coordinates = {0000000000004843000000000000803F}
          SpotCutOff = 180.000000000000000000
          object BlueStar: TGLSphere
            Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
            Material.FrontProperties.Emission.Color = {00000000000000000000803F0000803F}
            Radius = 100.000000000000000000
            Slices = 16
            Stacks = 16
          end
        end
      end
      object dcCubeParts: TGLDummyCube
        CubeSize = 1.000000000000000000
        object CubeTop: TGLCube
          NormalDirection = ndInside
          Parts = [cpTop]
          CubeSize = {00007A4400007A4400007A44}
        end
        object CubeBottom: TGLCube
          NormalDirection = ndInside
          Parts = [cpBottom]
          CubeSize = {00007A4400007A4400007A44}
        end
        object CubeFront: TGLCube
          NormalDirection = ndInside
          Parts = [cpFront]
          CubeSize = {00007A4400007A4400007A44}
        end
        object CubeBack: TGLCube
          NormalDirection = ndInside
          Parts = [cpBack]
          CubeSize = {00007A4400007A4400007A44}
        end
        object CubeLeft: TGLCube
          NormalDirection = ndInside
          Parts = [cpLeft]
          CubeSize = {00007A4400007A4400007A44}
        end
        object CubeRight: TGLCube
          NormalDirection = ndInside
          Parts = [cpRight]
          CubeSize = {00007A4400007A4400007A44}
        end
      end
    end
    object ffPlanet: TGLFreeForm
    end
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer
    FormCaption = 'Star motion - %FPS'
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
    Left = 574
    Top = 145
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 628
    Top = 54
  end
end
