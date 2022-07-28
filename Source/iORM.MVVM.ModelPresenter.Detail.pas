unit iORM.MVVM.ModelPresenter.Detail;

interface

uses
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.Interfaces;

type

  TioModelPresenterDetail = class(TioModelPresenterCustom)
  public
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    property Active;
    property ItemCount;
  published
    // Published properties
    property MasterBindSource; // published: Detail
    property MasterPropertyName; // published: Detail
    property AutoRefreshOnNotification default True; // published: Master+Detail
    property TypeOfCollection; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    // Published properties: selectors
    property SelectorFor;
    // Published Events: selectors
    property OnBeforeSelectionObject;
    property OnSelectionObject;
    property OnAfterSelectionObject;
    property OnBeforeSelectionInterface;
    property OnSelectionInterface;
    property OnAfterSelectionInterface;
    // Published properties: selectors
    property OnReceiveSelectionCloneObject;
    property OnReceiveSelectionFreeObject;
  end;


implementation

{ TioModelPresenterDetail }

function TioModelPresenterDetail.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

function TioModelPresenterDetail.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

end.
