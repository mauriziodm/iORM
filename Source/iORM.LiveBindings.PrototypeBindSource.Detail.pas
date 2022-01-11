unit iORM.LiveBindings.PrototypeBindSource.Detail;

interface

uses
  iORM.LiveBindings.PrototypeBindSource, iORM.LiveBindings.Interfaces;

type

  TioPrototypeBindSourceDetail = class(TioCustomPrototypeBindSource)
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
  public
    property ItemCount;
  published
    // Published properties
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property MasterBindSource; // published: Detail
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

{ TioPrototypeBindSourceDetail }

function TioPrototypeBindSourceDetail.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

function TioPrototypeBindSourceDetail.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

end.
