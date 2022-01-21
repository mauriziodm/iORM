unit iORM.DB.DataSet.Detail;

interface

uses
  iORM.DB.DataSet.Custom, iORM.LiveBindings.Interfaces,
  System.Classes;

type

  TioDataSetDetail = class(TioDataSetCustom)
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
  public
    property ItemCount;
  published
    // Published properties
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property MasterDataSet; // published: Detail
    property MasterPropertyName; // published: Detail
    property AutoRefreshOnNotification default True; // published: Master+Detail
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

{ TioDataSetDetail }

function TioDataSetDetail.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

function TioDataSetDetail.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

end.
