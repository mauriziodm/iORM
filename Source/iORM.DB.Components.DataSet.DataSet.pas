unit iORM.DB.Components.DataSet.DataSet;

interface

uses
  iORM.DB.Components.DataSet.Base, iORM.CommonTypes, System.Classes,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging, iORM.Where.Interfaces,
  Data.Bind.ObjectScope;

type

  TioDataSet = class;

  TioMasterDataSet = TioDataSet;

  TioDataSet = class(TioBSADataSet)
  private
    FTypeName: String;
    FTypeAlias: String;
    FAutoLoadData: Boolean;
    FAsync: Boolean;
    FAutoPersist: Boolean;
    FViewDataType: TioViewDataType;
    FMasterDataSet: TioMasterDataSet;
    FMasterPropertyName: String;
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FAutoRefreshOnNotification: TioAutoRefreshType;
    FonNotify: TioBSANotificationEvent;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioDataSet;
    FOnReceiveSelectionAutoEdit: Boolean;
    FOnReceiveSelectionAutoPost: Boolean;
    FOnReceiveSelectionAutoPersist: Boolean;
    // Edit/Insert/Post/Cancel propagation
    FPropagateEdit: Boolean;
    FPropagatePost: Boolean;
    FPropagatePersist: Boolean;
    // FLoaded flag for iORM DoCreateAdapter internal use only just before
    // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FLoaded: Boolean;
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
  protected
  public
    // ----------------------------------------------------------------------------------------------------------------------------
    // Properties
    // property Where: IioWhere read GetWhere write SetWhere;
    // property State: TBindSourceAdapterState read GetState;
    // property ItemCount: Integer read GetCount;
    // property IsDetail: Boolean read GetIsDetail;
    // property IsInterfacePresenting: Boolean read GetIsInterfacePresenting;
  published
    // Events
    property OnNotify: TioBSANotificationEvent read FonNotify write FonNotify;
    property OnBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property OnSelectionObject: TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property OnAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property OnBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property OnSelectionInterface: TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property OnAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
    // Properties
//    property TypeName: String read FTypeName write SetTypeName;
//    property TypeAlias: String read FTypeAlias write SetTypeAlias;
//    property Async: Boolean read FAsync write SetAsync;
//    property AutoLoadData: Boolean read FAutoLoadData write SetAutoLoadData;
//    property AutoPersist: Boolean read FAutoPersist write SetAutoPersist;
    property ViewDataType: TioViewDataType read FViewDataType write FViewDataType;
//    property WhereStr: TStrings read FWhereStr write SetWhereStr;
//    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters;
//    property OrderBy: String read FOrderBy Write SetOrderBy;
    property MasterDataSet: TioMasterDataSet read FMasterDataSet write FMasterDataSet;
    property MasterPropertyName: String read FMasterPropertyName write FMasterPropertyName;
    property AutoRefreshOnNotification: TioAutoRefreshType read FAutoRefreshOnNotification write FAutoRefreshOnNotification;
//    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    // Selectors
    property SelectorFor: TioDataSet read FSelectorFor write FSelectorFor;
    property OnReceiveSelectionAutoEdit: Boolean read FOnReceiveSelectionAutoEdit write FOnReceiveSelectionAutoEdit;
    property OnReceiveSelectionAutoPost: Boolean read FOnReceiveSelectionAutoPost write FOnReceiveSelectionAutoPost;
    property OnReceiveSelectionAutoPersist: Boolean read FOnReceiveSelectionAutoPersist write FOnReceiveSelectionAutoPersist;
    // Edit/Insert/Post/Cancel propagation
    property PropagateEdit: Boolean read FPropagateEdit write FPropagateEdit;
    property PropagatePost: Boolean read FPropagatePost write FPropagatePost;
    property PropagatePersist: Boolean read FPropagatePersist write FPropagatePersist;
    // Paging
    property Paging: TioCommonBSAPageManager read FPaging write FPaging;
  end;

implementation

end.
