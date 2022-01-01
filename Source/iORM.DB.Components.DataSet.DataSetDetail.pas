unit iORM.DB.Components.DataSet.DataSetDetail;

interface

uses
  iORM.DB.Components.DataSet.DataSet, iORM.LiveBindings.Interfaces,
  System.Classes;

type

  TioDataSetDetail = class(TioCustomDataSet)
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
  published
    // Published properties
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property MasterDataSet; // published: Detail
    property MasterPropertyName; // published: Detail
    property AutoRefreshOnNotification default TioAutoRefreshType.arEnabledNoReload; // published: Master+Detail
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
