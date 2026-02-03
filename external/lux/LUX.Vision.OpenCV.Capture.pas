unit LUX.Vision.OpenCV.Capture;

interface  

uses 
  OCV.core.types_c, 
  OCV.highgui_c,
  LUX.Vision.OpenCV;

type  
     //  TocvCapture
     TocvCapture = class abstract
     private
     protected
       _Frame :TocvImage3;
       _Core  :pCvCapture;
       
       function GetPosMsec :Double;
       procedure SetPosMsec( const PosMsec_:Double );
       function GetPosFrames :Integer;
       procedure SetPosFrames( const PosFrames_:Integer );
       function GetPosAviRatio :Double;
       procedure SetPosAviRatio( const PosAviRatio_:Double );
       function GetFrameWidth :Integer;
       procedure SetFrameWidth( const FrameWidth_:Integer );
       function GetFrameHeight :Integer;
       procedure SetFrameHeight( const FrameHeight_:Integer );
       function GetFPS :Double;
       procedure SetFPS( const FPS_:Double );
       function GetFourCC :String;
       procedure SetFourCC( const FourCC_:String );
       function GetFrameCount :Integer;
     public
       constructor Create;
       destructor Destroy; override;
       
       property Core        :pCvCapture read _Core;
       property Frame       :TocvImage3 read _Frame;
       property PosMsec     :Double     read GetPosMsec     write SetPosMsec;
       property PosFrames   :Integer    read GetPosFrames   write SetPosFrames;
       property PosAviRatio :Double     read GetPosAviRatio write SetPosAviRatio;
       property FrameWidth  :Integer    read GetFrameWidth  write SetFrameWidth;
       property FrameHeight :Integer    read GetFrameHeight write SetFrameHeight;
       property FPS         :Double     read GetFPS         write SetFPS;
       property FourCC      :String     read GetFourCC      write SetFourCC;
       property FrameCount  :Integer    read GetFrameCount;
       
       procedure QueryFrame;

     //  TocvVideo
     TocvVideo = class( TocvCapture )
     private
     protected
       _FileName :AnsiString;
     public
       constructor Create( const FileName_:AnsiString );
       
       property FileName :AnsiString read _FileName;
     end;

     //  TocvCamera

     TocvCamera = class( TocvCapture )
     private
     protected
       _CameraI :Integer;
     public
       constructor Create( const CameraI_:Integer = 0 );
       
       property CameraI :Integer read _CameraI;
     end;


implementation //=========================================

uses System.SysUtils;

//TocvCapture
//-------------------------------------------------------
function TocvCapture.GetPosMsec :Double;
begin
     Result := cvGetCaptureProperty( _Core, CV_CAP_PROP_POS_MSEC );
end;

procedure TocvCapture.SetPosMsec( const PosMsec_:Double );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_POS_MSEC, PosMsec_ );
end;

function TocvCapture.GetPosFrames :Integer;
begin
     Result := Round( cvGetCaptureProperty( _Core, CV_CAP_PROP_POS_FRAMES ) );
end;

procedure TocvCapture.SetPosFrames( const PosFrames_:Integer );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_POS_FRAMES, PosFrames_ );
end;

function TocvCapture.GetPosAviRatio :Double;
begin
     Result := cvGetCaptureProperty( _Core, CV_CAP_PROP_POS_AVI_RATIO );
end;

procedure TocvCapture.SetPosAviRatio( const PosAviRatio_:Double );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_POS_AVI_RATIO, PosAviRatio_ );
end;

function TocvCapture.GetFrameWidth :Integer;
begin
     Result := Round( cvGetCaptureProperty( _Core, CV_CAP_PROP_FRAME_WIDTH ) );
end;

procedure TocvCapture.SetFrameWidth( const FrameWidth_:Integer );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_FRAME_WIDTH, FrameWidth_ );
end;

function TocvCapture.GetFrameHeight :Integer;
begin
     Result := Round( cvGetCaptureProperty( _Core, CV_CAP_PROP_FRAME_HEIGHT ) );
end;

procedure TocvCapture.SetFrameHeight( const FrameHeight_:Integer );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_FRAME_HEIGHT, FrameHeight_ );
end;

function TocvCapture.GetFPS :Double;
begin
     Result := cvGetCaptureProperty( _Core, CV_CAP_PROP_FPS );
end;

procedure TocvCapture.SetFPS( const FPS_:Double );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_FPS, FPS_ );
end;

function TocvCapture.GetFourCC :String;
begin
     Result := cvGetCaptureProperty( _Core, CV_CAP_PROP_FOURCC ).ToString;
end;

procedure TocvCapture.SetFourCC( const FourCC_:String );
begin
     cvSetCaptureProperty( _Core, CV_CAP_PROP_FOURCC, FourCC_.ToDouble );
end;

function TocvCapture.GetFrameCount :Integer;
begin
     Result := Round( cvGetCaptureProperty( _Core, CV_CAP_PROP_FRAME_COUNT ) );
end;



constructor TocvCapture.Create;
begin
     inherited;

     _Frame := TocvImage3.Create;
end;

destructor TocvCapture.Destroy;
begin
     cvReleaseCapture( _Core );

     _Frame.Free;

     inherited;
end;

//-------------------------------------------------------

procedure TocvCapture.QueryFrame;
begin
     _Frame.Core := cvQueryFrame( _Core );
end;

//TocvVideo







constructor TocvVideo.Create( const FileName_:AnsiString );
begin
     inherited Create;

     _FileName := FileName_;

     _Core := cvCreateFileCapture( PAnsiChar( _FileName ) );
end;

//TocvCamera







constructor TocvCamera.Create( const CameraI_:Integer = 0 );
begin
     inherited Create;

     _CameraI := CameraI_;

     _Core := cvCreateCameraCapture( _CameraI );
end;

initialization //===================== 


finalization // 

end.
