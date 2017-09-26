unit iORM.MVVM.ViewContextRegister;

interface

uses
  System.Generics.Collections, iORM.MVVM.ViewContextRegisterItem,
  System.Classes, iORM.MVVM.Components.ViewContextProvider,
  iORM.MVVM.Interfaces, System.SysUtils;

type

  TioViewRegister = class(TInterfacedObject, IioViewRegister)
  private
    FInternalContainer: TList<TioViewContextRegisterItem>;
    function FindItemByView(const AView: TComponent): TioViewContextRegisterItem;
    function FindItemByViewContext(const AViewContext: TComponent): TioViewContextRegisterItem;
    function ContainsView(const AView:TComponent): Boolean;
    function ContainsViewContext(const AViewContext:TComponent): Boolean;
    function GetItemByView(const AView: TComponent): TioViewContextRegisterItem;
    function GetItemByViewContext(const AViewContext: TComponent): TioViewContextRegisterItem;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AView, AViewContext: TComponent;
      const AViewContextProvider:TioViewContextProvider;
      const AViewContextFreeMethod:TProc);
    procedure ReleaseAllViewContexts;
    property ItemByView[const AView:TComponent]:TioViewContextRegisterItem read GetItemByView;
    property ItemByViewContext[const AViewContext:TComponent]:TioViewContextRegisterItem read GetItemByViewContext;
  end;

implementation

uses
  iORM.Exceptions;

{ TioViewContextRegister }

procedure TioViewRegister.Add(const AView, AViewContext: TComponent;
  const AViewContextProvider:TioViewContextProvider;
  const AViewContextFreeMethod:TProc);
var
  LItem: TioViewContextRegisterItem;
begin
  // Check parameters validity
  if not Assigned(AView) then
    raise EioException.Create('TioViewContextRegister', 'Add', 'The View must be assigned.');
  if not Assigned(AViewContext) then
    raise EioException.Create('TioViewContextRegister', 'Add', 'The ViewContext must be assigned.');
  // Avoid duplicated Views or ViewContexts
  if ContainsView(Aview) then
    raise EioException.Create('TioViewContextRegister', 'Add', 'Duplicated View.');
  if ContainsViewContext(AViewContext) then
    raise EioException.Create('TioViewContextRegister', 'Add', 'Duplicated ViewContext.');
  // Register
  LItem := TioViewContextRegisterItem.Create(AView, AViewContext, AViewContextProvider, AViewContextFreeMethod, FInternalContainer);
  FInternalContainer.Add(LItem);
end;

function TioViewRegister.ContainsView(const AView: TComponent): Boolean;
begin
  Result := Assigned(FindItemByView(AView));
end;

function TioViewRegister.ContainsViewContext(
  const AViewContext: TComponent): Boolean;
begin
  Result := Assigned(FindItemByViewContext(AViewContext));
end;

constructor TioViewRegister.Create;
begin
  inherited;
  FInternalContainer := TList<TioViewContextRegisterItem>.Create;
end;

destructor TioViewRegister.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioViewRegister.FindItemByView(
  const AView: TComponent): TioViewContextRegisterItem;
var
  LItem: TioViewContextRegisterItem;
begin
  Result := nil;
  for LItem in FInternalContainer do
    if LItem.View = AView then
      Exit(LItem);
end;

function TioViewRegister.FindItemByViewContext(
  const AViewContext: TComponent): TioViewContextRegisterItem;
var
  LItem: TioViewContextRegisterItem;
begin
  Result := nil;
  for LItem in FInternalContainer do
    if LItem.ViewContext = AViewContext then
      Exit(LItem);
end;

function TioViewRegister.GetItemByView(
  const AView: TComponent): TioViewContextRegisterItem;
begin
  Result := FindItemByView(AView);
  if not Assigned(Result) then
    raise EioException.Create('TioViewContextRegister', 'GetItemByView', 'View not found.');
end;

function TioViewRegister.GetItemByViewContext(
  const AViewContext: TComponent): TioViewContextRegisterItem;
begin
  Result := FindItemByViewContext(AViewContext);
  if not Assigned(Result) then
    raise EioException.Create('TioViewContextRegister', 'GetItemByViewContext', 'ViewContext not found.');
end;

procedure TioViewRegister.ReleaseAllViewContexts;
var
  LItem: TioViewContextRegisterItem;
begin
  for LItem in FInternalContainer do
    LItem.ReleaseViewContext;
end;

end.
