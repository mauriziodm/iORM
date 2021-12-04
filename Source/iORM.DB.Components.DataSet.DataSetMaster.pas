unit iORM.DB.Components.DataSet.DataSetMaster;

interface

uses
  iORM.DB.Components.DataSet.DataSet, iORM.LiveBindings.Interfaces;

type

  TioDataSetMaster = class(TioDataSet)
  public
    property Where;
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
  end;

implementation

end.
