unit fbMiniForm_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Mask,
  Vcl.Menus;

// state flags for automatic handling of minimize events
type
  TMiniState = (tmNone, // dont react to the message
    tmWindow, // minimize the window
    tmAll); // minimze all windows of the app

  // the minimize event himself
type
  TMinimizeEvent = procedure(Sender: TObject; var state: TMiniState) of object;

type
  TMiniForm = class(TForm)
  private
    FOnMinimize: TMinimizeEvent;
    FOnMaximize: TMinimizeEvent;
    FOnRestore: TNotifyEvent;
    procedure WMSIZE(Var Msg: TWMSIZE); Message WM_SIZE;
    procedure WinRestore(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnMinimize: TMinimizeEvent read FOnMinimize write FOnMinimize;
    property OnMaximize: TMinimizeEvent read FOnMaximize write FOnMaximize;
  end;

implementation //------------------------------------------------------------

constructor TMiniForm.Create(AOwner: TComponent);
begin
  FOnMinimize := nil;
  inherited;
end;

procedure TMiniForm.WMSIZE(var Msg: TWMSIZE);
// catch the WM_SIZE message to know what happend
var
  status: TMiniState;
begin
  if Msg.SizeType = integer(wsMinimized) then
  begin
    if Assigned(FOnMinimize) then
    begin
      status := tmWindow; // Default action
      FOnMinimize(self, status);
      case status OF
        tmNone: // Tell windows to restore the window immedately
          PostMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
        tmWindow:
          ; // All is done by windows
        tmAll: // Minimize all windows of the app
          begin
            // Store the OnRestore event
            FOnRestore := Application.OnRestore;
            // Replace it with own handler
            Application.OnRestore := WinRestore;
            // Minimize all
            Application.Minimize;
          end;
      end;
    end;
  end;
  inherited; // Call other hanlder of WMSIZE event
end;

procedure TMiniForm.WinRestore(Sender: TObject);
var
  status: TMiniState;
  // handles restoring of the windows
begin
  // made Window normal
  WindowState := wsNormal;
  // Restore other Windows of the app
  Application.Restore;
  // Restore the old Restore handler
  Application.OnRestore := FOnRestore;
  // Call the restore handler
  if Assigned(FOnRestore) then
    FOnRestore(Sender);

  if Assigned(FOnMaximize) then
  begin
    status := tmWindow;
    FOnMaximize(self, status);
  end;
end;

//--------------------------------------------------------------------------
destructor TMiniForm.Destroy;
begin
  inherited
end;

end.
