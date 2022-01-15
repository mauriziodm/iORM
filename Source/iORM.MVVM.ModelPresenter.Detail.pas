unit iORM.MVVM.ModelPresenter.Detail;

interface

uses
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.Interfaces;

type

  TioModelPresenterDetail = class(TioModelPresenterCustom)
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
  public
    property ItemCount;
  published
    // Published properties
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property MasterPresenter; // published: Detail
    property MasterPropertyName; // published: Detail
    property AutoRefreshOnNotification default TioAutoRefreshType.arEnabledNoReload; // published: Master+Detail
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
