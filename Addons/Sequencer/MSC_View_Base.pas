unit MSC_View_Base;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Publish_Subscribe;

type
   TView_Base = class (TFrame, ISubscribe)
   private
      FSubscriber: TSubscriber;  // Implement a subscriber
      FMax_Time: Int32;          // Maximum time for displaying results
      FColor_Even: TColor;       // Color for even rows
      FColor_Odd: TColor;        // Color for odd rows

      procedure set_max_time (max_time: Int32);
      procedure set_color_even (color: TColor);
      procedure set_color_odd (color: TColor);

   public
      constructor Create (aOwner: TComponent); override;
      destructor Destroy; override;
      procedure Reset; virtual;

      procedure Alert (Sender: Tobject); virtual; abstract;

      property Subscriber: TSubscriber read FSubscriber implements ISubscribe;
      property Max_Time: Int32 read FMax_Time write set_max_time;
      property Color_Even: TColor read FColor_Even write set_color_even;
      property Color_Odd:  TColor read FColor_Odd  write set_color_odd;
   end; // Class: TTMSC_View_Base //

implementation //=============================================================

{$R *.dfm}

constructor TView_Base.Create (aOwner: TComponent);
begin
   inherited Create (aOwner);

// Statements to unlock subscriber functionality
   FSubscriber         := TSubscriber.Create;
   Subscriber.OnUpdate := Alert;

   FMax_Time          := -1;
   FColor_Even        := clGradientActiveCaption;
   FColor_Odd         := clGradientInactiveCaption;
end; // Create //

destructor TView_Base.Destroy;
begin
   inherited Destroy;

   FSubscriber.Free;
end; // Destroy //

procedure TView_Base.Reset;
begin
// Just empty
end; // Reset //

procedure TView_Base.set_max_time (max_time: Int32);
begin
   FMax_Time := max_time;
end; // set_max_time //

procedure TView_Base.set_color_even (color: TColor);
begin
   FColor_Even := color;
end; // set_color_even //

procedure TView_Base.set_color_odd (color: TColor);
begin
   FColor_Odd := color;
end; // set_color_odd //

end. // Unit: MSC_View_Base //
