unit iORM.LiveBindings.PrototypeBindSource.Detail;

interface

uses
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.Interfaces;

type

  TioPrototypeBindSourceDetail = class(TioPrototypeBindSourceCustom)
  public
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    property ItemCount;
  published
    // Published properties
    property AsDefault default False;
    property AutoRefreshOnNotification default True; // published: Master+Detail
    property MasterBindSource; // published: Detail
    property MasterPropertyName; // published: Detail
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
    // Events
    property AfterClose;
    property AfterOpen;
    property BeforeClose;
    property BeforeOpen;
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
