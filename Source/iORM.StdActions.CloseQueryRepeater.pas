unit iORM.StdActions.CloseQueryRepeater;

interface

uses
  System.Classes, iORM.MVVM.ViewModelBridge, iORM.CommonTypes;

type

  TioCloseQueryRepeater = class (TComponent)
  private
    FOnUpdateScope: TioBSCloseQueryActionUpdateScope;
    procedure _InjectEventHandler;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    // properties
    property OnUpdateScope: TioBSCloseQueryActionUpdateScope read FOnUpdateScope write FOnUpdateScope default usOwnedStrictly;
  end;


implementation

uses
  System.Rtti, iORM.RttiContext.Factory, iORM.Exceptions,
  System.SysUtils, iORM.StdActions.Interfaces;

{ TioCloseQueryRepeater }

constructor TioCloseQueryRepeater.Create(AOwner: TComponent);
begin
  inherited;
  FOnUpdateScope := usOwnedStrictly;
end;

procedure TioCloseQueryRepeater.Loaded;
begin
  inherited;
  _InjectEventHandler;
end;

procedure TioCloseQueryRepeater._InjectEventHandler;
var
  LEventHandlerToInject: TMethod;
begin
  // On runtime only
  if (csDesigning in ComponentState) then
    Exit;
  // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
  LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
  LEventHandlerToInject.Data := Self;
  TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(Owner, LEventHandlerToInject, False);
end;

procedure TioCloseQueryRepeater._OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean);
var
  I: Integer;
  LSenderAsTComponent: TComponent;
begin
  CanClose := True;
  LSenderAsTComponent := Sender as TComponent;
  for I := 0 to LSenderAsTComponent.ComponentCount-1 do
  begin
    if (LSenderAsTComponent.Components[I].ComponentCount > 0) then
    begin
      CanClose := CanClose and TioBSCloseQueryCommonBehaviour.CanClose(nil, LSenderAsTComponent.Components[I], FOnUpdateScope);
      if not CanClose then
        Exit;
    end;
  end;
end;

end.
