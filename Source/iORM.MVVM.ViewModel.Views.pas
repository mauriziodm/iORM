unit iORM.MVVM.ViewModel.Views;

interface

uses
  System.Classes, System.Generics.Collections, iORM.CommonTypes,
  iORM.MVVM.Interfaces;

type

  TioVMViews = class(TInterfacedObject, IioVMViews)
  private
    FInternalContainer: TioVMViewsInternalContainer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterView(const AView:TComponent);
    procedure UnregisterView(const AView:TComponent);
    procedure ReleaseViewContext(const AView:TComponent);
    procedure ReleaseAllViewContexts;
    function _InternalContainer: TioVMViewsInternalContainer;
  end;

implementation

uses
  iORM, iORM.MVVM.ViewContextContainer;

{ TioVMViews }

constructor TioVMViews.Create;
begin
  inherited;
  FInternalContainer := TioVMViewsInternalContainer.Create;
end;

destructor TioVMViews.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioVMViews._InternalContainer: TioVMViewsInternalContainer;
begin
  Result := FInternalContainer;
end;

procedure TioVMViews.RegisterView(const AView: TComponent);
begin
  if FInternalContainer.Contains(Aview) then
    Exit;
  FInternalContainer.Add(AView);
end;

procedure TioVMViews.ReleaseAllViewContexts;
var
  LView: TComponent;
begin
  for LView in FInternalContainer do
    Self.RegisterView(LView);
end;

procedure TioVMViews.ReleaseViewContext(const AView: TComponent);
begin
  TioViewContextContainer.ReleaseViewContext(AView);
end;

procedure TioVMViews.UnregisterView(const AView: TComponent);
begin
  FInternalContainer.Remove(Aview);
end;

end.
