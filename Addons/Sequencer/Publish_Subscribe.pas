unit Publish_Subscribe;

interface

uses
  SysUtils,
  Classes;

type
   TPublicationNotice = (pnUpdate, pnDestroy);

   TSimpleInterfacedObject = class (TPersistent, IInterface)
   protected
      function QueryInterface (const IID: TGUID; out Obj): HResult; stdcall;
      function _AddRef: Integer; stdcall;
      function _Release: Integer; stdcall;
   end; // TSimpleInterfacedObject //

   IAXObserver = interface
      procedure sbUpdate;
   end; // IAXObserver //

   EAXSystemError = class (Exception);

   ISubscribe = interface
      ['{00B94D44-B38D-4CA6-8288-1C63191F6D11}']
      procedure sbUpdate (Publication: TPublicationNotice);
   end; // ISubscribe //

   IPublish = interface
      ['{653B3244-C428-404C-956E-A8ADF34FF53A}']
      procedure Subscribe (Subscriber: ISubscribe);
      procedure Unsubscribe (Subscriber: ISubscribe);
      procedure Publish;
   end; // IPublish //

  TPublisher = class (TSimpleInterfacedObject, IPublish)
  private
    FUpdates: Integer;
    FSubscribers: TList;

  public
    constructor Create;
    destructor Destroy; override;
    procedure pbBeginUpdate;
    procedure pbEndUpdate;

// Implementation if publiser interface
    procedure Subscribe (Subscriber: ISubscribe);
    procedure Unsubscribe (Subscriber: ISubscribe);
    procedure Publish;
  end; // Class: TPublisher //

  TSubscriber = class (TSimpleInterfacedObject, ISubscribe)
  private
    FPublisher: TSimpleInterfacedObject;
    FOnUpdate: TNotifyEvent;

    procedure SetPublisher (Publisher: TSimpleInterfacedObject);
    procedure DoUpdate; virtual;

  protected
// Implemenatation of subscriber interface
    procedure sbUpdate (Publication: TPublicationNotice);

  public
    constructor Create;
    destructor Destroy; override;

    property Publisher: TSimpleInterfacedObject read FPublisher write SetPublisher;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end; // Class: TSubscriber //

resourcestring
  // exceptions
  S_UNKNOWNERROR = 'An unknown error has occurred. Please note the message below and notify your system administrator '#13#10#13#10'[%s]';

implementation //==============================================================

{*******************************************************************
*                                                                  *
* Class TSimpleInterfacedObject                                    *
*                                                                  *
********************************************************************}

function TSimpleInterfacedObject.QueryInterface (const IID: TGUID; out Obj): HResult;
begin
   if GetInterface(IID, Obj)
      then Result := 0
      else Result := E_NOINTERFACE;
end;

function TSimpleInterfacedObject._AddRef: Integer;
begin
   Result := -1;
end;

function TSimpleInterfacedObject._Release: Integer;
begin
   Result := -1
end;

{*******************************************************************
*                                                                  *
* Class TPublisher                                                 *
*                                                                  *
********************************************************************}

constructor TPublisher.Create;
begin
  inherited Create;

  FSubscribers := TList.Create;
end; // Create //

destructor TPublisher.Destroy;
var i: Integer;
begin
   for i := FSubscribers.Count - 1 downto 0 do
   begin
      ISubscribe (FSubscribers[i]).sbUpdate (pnDestroy);
   end;
   FSubscribers.Free;

   inherited Destroy;
end; // Destroy //

procedure TPublisher.pbBeginUpdate;
begin
   Inc (FUpdates);
end; // pbBeginUpdate //

procedure TPublisher.pbEndUpdate;
begin
   Dec (FUpdates);
   if FUpdates = 0 then
   begin
      Publish;
   end;
end; // pbEndUpdate //

procedure TPublisher.Subscribe (Subscriber: ISubscribe);
begin
   FSubscribers.Add (Pointer (Subscriber));
   Subscriber.sbUpdate (pnUpdate);
end; // Subscribe //

procedure TPublisher.Unsubscribe (Subscriber: ISubscribe);
begin
   FSubscribers.Remove (Pointer(Subscriber));
end; // Unsubscribe //

procedure TPublisher.Publish;
var i: Integer;
begin
   for i := FSubscribers.Count - 1 downto 0 do
   begin
      ISubscribe (FSubscribers [i]).sbUpdate (pnUpdate);
   end;
end; // Publish //

{*******************************************************************
*                                                                  *
* Class TSubscriber                                                *
*                                                                  *
********************************************************************}

constructor TSubscriber.Create;
begin
   inherited Create;
end; // Create //

destructor TSubscriber.Destroy;
begin
   if Assigned (FPublisher) then
   begin
      (FPublisher as IPublish).Unsubscribe (Self);
   end;

   inherited Destroy;
end; // Destroy //

procedure TSubscriber.SetPublisher (Publisher: TSimpleInterfacedObject);
begin
   if Publisher <> FPublisher then
   begin
      if Assigned (FPublisher) then
      begin
         (FPublisher as IPublish).Unsubscribe (Self);
      end; // if
      if Assigned (Publisher) then
      begin
      // set attribute first, because subscribe causes a callback
         FPublisher := Publisher;
         (Publisher as IPublish).Subscribe (Self);
      end else
      begin
         FPublisher := nil;
         DoUpdate;
      end; // if
   end; // if
end; // SetPublisher //

procedure TSubscriber.sbUpdate (Publication: TPublicationNotice);
begin
   if Assigned (FPublisher) then
   begin
      case Publication of
         pnUpdate:  DoUpdate;
         pnDestroy: FPublisher := nil;
      end; // case
   end; // if
end; // sbUpdate //

procedure TSubscriber.DoUpdate;
begin
   if Assigned (FOnUpdate) then OnUpdate (Self);
end; // DoUpdate //

end. // Unit: Publish_Subscribe //
