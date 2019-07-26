unit iORM.MVVM.ViewRegisterItem;

interface

uses
  System.Classes, iORM.MVVM.Components.ViewContextProvider,
  System.Generics.Collections, System.SysUtils;

type

  TioViewContextRegisterItem = class(TComponent)
  private
    FView: TComponent;
    FViewContext: TComponent;
    FViewContextProvider: TioViewContextProvider;
    FViewContextFreeMethod: TProc;
    FReleasingViewContext: Boolean;
    procedure SetView(const AView:TComponent);
    procedure SetViewContext(const AViewContext:TComponent);
    procedure SetViewContextProvider(const AViewContextProvider:TioViewContextProvider);
    procedure CheckForLife;
    function GetView: TComponent;
    function GetViewContext: TComponent;
    function GetViewContextProvider: TioViewContextProvider;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(const AView, AViewContext: TComponent;
      const AViewContextProvider:TioViewContextProvider;
      const AViewContextFreeMethod:TProc); reintroduce; overload;
    procedure ReleaseViewContext;
    procedure ShowViewContext;
    procedure HideViewContext;
    property View:TComponent read FView;
    property ViewContext:TComponent read FViewContext;
    property ViewContextProvider:TioViewContextProvider read FViewContextProvider;
  end;

implementation

{ TioViewContextRegisterItem }

procedure TioViewContextRegisterItem.CheckForLife;
begin
  if (not Assigned(FView)) and (not FReleasingViewContext) then
    ReleaseViewContext;
  if (not Assigned(FView)) and (not Assigned(FViewContext)) then
    DisposeOf;
end;

constructor TioViewContextRegisterItem.Create(const AView, AViewContext: TComponent;
      const AViewContextProvider:TioViewContextProvider;
      const AViewContextFreeMethod:TProc);
begin
  inherited Create(nil);
  FReleasingViewContext := False;
  SetView(AView);
  SetViewContext(AViewContext);
  SetViewContextProvider(AViewContextProvider);
  FViewContextFreeMethod := AViewContextFreeMethod;
end;

function TioViewContextRegisterItem.GetView: TComponent;
begin
  Result := FView;
end;

function TioViewContextRegisterItem.GetViewContext: TComponent;
begin
  Result := FViewContext;
end;

function TioViewContextRegisterItem.GetViewContextProvider: TioViewContextProvider;
begin
  Result := FViewContextProvider;
end;

procedure TioViewContextRegisterItem.HideViewContext;
begin
  if not Assigned(FViewContext) then
    Exit;
  if Assigned(FViewContextProvider) then
    FViewContextProvider.HideViewContext(FView, FViewContext);
end;

procedure TioViewContextRegisterItem.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  // If AComponent is the View or the ViewContext then clear the proper field
  if AComponent = FView then
    SetView(nil)
  else if AComponent = FViewContext then
    SetViewContext(nil)
  else if AComponent = FViewContextProvider then
    SetViewContextProvider(nil);
end;

procedure TioViewContextRegisterItem.ReleaseViewContext;
begin
  // If already destroyed then exit
  FReleasingViewContext := True;
  if not Assigned(FViewContext) then
    Exit;
  if Assigned(FViewContextProvider) then
    FViewContextProvider.ReleaseViewContext(FView, FViewContext);
  if Assigned(FViewContextFreeMethod) then
    FViewContextFreeMethod;
end;

procedure TioViewContextRegisterItem.SetView(const AView: TComponent);
begin
  if AView = FView then
    Exit;
  FView := AView;
  if Assigned(FView) then
    FView.FreeNotification(Self);
  CheckForLife;
end;

procedure TioViewContextRegisterItem.SetViewContext(
  const AViewContext: TComponent);
begin
  if AViewContext = FViewContext then
    Exit;
  FViewContext := AViewContext;
  if Assigned(FViewContext) then
    FViewContext.FreeNotification(Self);
  CheckForLife;
end;

procedure TioViewContextRegisterItem.SetViewContextProvider(
  const AViewContextProvider: TioViewContextProvider);
begin
  if AViewContextProvider = FViewContextProvider then
    Exit;
  FViewContextProvider := AViewContextProvider;
  if Assigned(FViewContextProvider) then
    FViewContextProvider.FreeNotification(Self);
end;

procedure TioViewContextRegisterItem.ShowViewContext;
begin
  if not Assigned(FViewContext) then
    Exit;
  if Assigned(FViewContextProvider) then
    FViewContextProvider.ShowViewContext(FView, FViewContext);
end;

end.
