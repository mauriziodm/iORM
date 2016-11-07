unit iORM.MVVM.ViewModel.Views;

interface

uses
  System.Classes, System.Generics.Collections, iORM.CommonTypes;

type

  TioVMViewsInternalContainer = TList<TComponent>;

  TioVMViews = class
  private
    FInternalContainer: IioThreadSafe<TioVMViewsInternalContainer>;
  public
    constructor Create;
    procedure RegisterView(const AView:TComponent);
    procedure UnregisterView(const AView:TComponent);
    procedure KillView(const AView:TComponent; const AReleaseViewContext:Boolean=True);
    procedure KillAll(const AReleaseViewContext:Boolean=True);
  end;

implementation

uses
  iORM;

{ TioVMViews }

constructor TioVMViews.Create;
begin
  inherited;
  FInternalContainer := io.NewThreadSafe(TioVMViewsInternalContainer.Create);
end;

procedure TioVMViews.KillAll(const AReleaseViewContext:Boolean=True);
begin

end;

procedure TioVMViews.KillView(const AView: TComponent; const AReleaseViewContext:Boolean=True);
begin

end;

procedure TioVMViews.RegisterView(const AView: TComponent);
begin
  if FInternalContainer.Contains(Aview) then
    Exit;
  FInternalContainer.Add(AView);
end;

procedure TioVMViews.UnregisterView(const AView: TComponent);
begin
  FInternalContainer.Remove(Aview);
end;

end.
