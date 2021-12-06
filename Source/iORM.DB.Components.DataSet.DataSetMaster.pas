unit iORM.DB.Components.DataSet.DataSetMaster;

interface

uses
  iORM.DB.Components.DataSet.DataSet, iORM.LiveBindings.Interfaces,
  iORM.DB.Components.BindSourceObjState, System.Classes;

type

  TioDataSetMaster = class(TioDataSet, IioBindSourceObjStateClient)
  private
    FObjState: TioBindSourceObjState;
    function GetSourceDataSet: TioDataSet;
    procedure SetSourceDataSet(const Value: TioDataSet);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Where;
    // Added properties
    property ObjState: TioBindSourceObjState read FObjState;
  published
    property TypeName;
    property TypeAlias;
    property Async default False;
    property AutoLoadData default True;
//    property AutoPersist default True; // published: Master (però cambiarlo in modo che, se true, persiste al cambio di record)
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr; // published: Master
    property OrderBy;
    property AutoRefreshOnNotification default TioAutoRefreshType.arEnabledNoReload;
    // Published properties: selectors
    property SelectorFor;
    // Published properties: paging
    property Paging;
    // Added properties
    property SourceDataSet: TioDataSet read GetSourceDataSet write SetSourceDataSet;
  end;

implementation

{ TioDataSetMaster }

constructor TioDataSetMaster.Create(AOwner: TComponent);
begin
  inherited;
  FObjState := TioBindSourceObjState.Create(Self);
end;

destructor TioDataSetMaster.Destroy;
begin
  FObjState.Free;
  inherited;
end;

function TioDataSetMaster.GetSourceDataSet: TioDataSet;
begin
  Result := MasterDataSet;
end;

procedure TioDataSetMaster.SetSourceDataSet(const Value: TioDataSet);
begin
  MasterDataSet := Value;
end;

end.
