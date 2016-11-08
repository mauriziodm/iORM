unit iORM.MVVM.ViewModel.Views;

interface

uses
  System.Classes, System.Generics.Collections, iORM.CommonTypes,
  iORM.MVVM.Interfaces;

type

  TioVMViews = class(TInterfacedObject, IioVMViews)
  private
    FInternalContainer: TioVMViewsInternalContainer;
    FLastViewID: Byte;
  public
    constructor Create;
    destructor Destroy; override;
    function RegisterView(const AView:TComponent): Byte;
    procedure UnregisterView(const AViewID:Byte);
    procedure ReleaseViewContext(const AViewID:Byte);
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
  FLastViewID := 0;
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

function TioVMViews.RegisterView(const AView: TComponent): Byte;
begin
  Inc(FLastViewID);
  FInternalContainer.Add(FLastViewID, AView);
  Result := FLastViewID;
end;

procedure TioVMViews.ReleaseAllViewContexts;
var
  LViewID: Byte;
begin
  for LViewID in FInternalContainer.Keys do
    Self.ReleaseViewContext(LViewID);
end;

procedure TioVMViews.ReleaseViewContext(const AViewID:Byte);
var
  LView: TComponent;
begin
  LView := FInternalContainer.Items[AViewID];
  TioViewContextContainer.ReleaseViewContext(LView);
end;

procedure TioVMViews.UnregisterView(const AViewID:Byte);
begin
  FInternalContainer.Remove(AViewID);
end;

end.
