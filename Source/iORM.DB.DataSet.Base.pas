unit iORM.DB.DataSet.Base;

interface

uses
  Data.DB, iORM.LiveBindings.Interfaces, Data.Bind.ObjectScope,
  iORM.Context.Map.Interfaces, System.Classes, System.Rtti, Data.SqlTimSt,
  iORM.CommonTypes, iORM.Context.Properties.Interfaces;

const

  NULL_RECORD_BUFFER: TRecordBuffer = nil; // 0; // Before XE4 use "NullBuffer := nil"

type

  TSqlTimeStampUtils = class
  public
    class function DateTimeToSqlTimeStamp(const ADateTime: TDateTime): TSqlTimeStamp; static;
    class function SqlTimeStampToTValue(const ASqlTimeStamp: TSqlTimeStamp): TValue; static;
  end;

  TioRecInfo = record
    Bookmark: Longint;
    BookmarkFlag: TBookmarkFlag;
  end;

  PioRecInfo = ^TioRecInfo;

  PValueBuffer = ^TValueBuffer;

  TioBaseDataSet = class(TDataSet)
  protected
    // status
    FIsTableOpen: Boolean;

    // record data
    FRecordSize, // the size of the actual data
    FRecordBufferSize, // data + housekeeping (TRecInfo)
    FCurrentRecord, // current record (0 to FRecordCount - 1)
    BofCrack, // before the first record (crack)
    EofCrack: Integer; // after the last record (crack)

    // create, close, and so on
    procedure InternalOpen; override;
    procedure InternalClose; override;
    function IsCursorOpen: Boolean; override;

    // custom functions
    function InternalRecordCount: Integer; virtual; abstract;
    procedure InternalPreOpen; virtual;
    procedure InternalAfterOpen; virtual;
    procedure InternalLoadCurrentRecord(Buffer: TRecordBuffer); virtual; abstract;

    // memory management
    function AllocRecordBuffer: TRecordBuffer; override;
    procedure InternalInitRecord(Buffer: TRecordBuffer); override;
    procedure FreeRecordBuffer(var Buffer: TRecordBuffer); override;
    function GetRecordSize: Word; override;

    // movement and optional navigation (used by grids)
    function GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
    procedure InternalFirst; override;
    procedure InternalLast; override;
    function GetRecNo: Longint; override;
    function GetRecordCount: Longint; override;
    procedure SetRecNo(Value: Integer); override;

    // bookmarks
    procedure InternalGotoBookmark(Bookmark: Pointer); override; deprecated 'Use overloaded method instead';
    procedure InternalGotoBookmark(Bookmark: TBookmark); override;
    procedure InternalSetToRecord(Buffer: TRecordBuffer); override; deprecated 'Use overloaded method instead';
    procedure InternalSetToRecord(Buffer: TRecBuf); override;
    procedure SetBookmarkData(Buffer: TRecBuf; Data: TBookmark); override;
    procedure SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override; deprecated 'Use overloaded method instead';
    procedure GetBookmarkData(Buffer: TRecBuf; Data: TBookmark); override;
    procedure GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override; deprecated 'Use overloaded method instead';
    procedure SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag); override; deprecated 'Use overloaded method instead';
    procedure SetBookmarkFlag(Buffer: TRecBuf; AValue: TBookmarkFlag); override;
    function GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag; override; deprecated 'Use overloaded method instead';
    function GetBookmarkFlag(Buffer: TRecBuf): TBookmarkFlag; override;

    // editing (dummy vesions)
    procedure InternalDelete; override;
    procedure InternalAddRecord(Buffer: TRecBuf; Append: Boolean); override;
    procedure InternalPost; override;

    // other
    procedure InternalHandleException; override;
    function GetRecordInfo: TioRecInfo;
  public
    // redeclared data set properties
    property Active;
  published
    // redeclared data set properties
//    property BeforeOpen;
//    property AfterOpen;
//    property BeforeClose;
//    property AfterClose;
//    property BeforeInsert;
//    property AfterInsert;
//    property BeforeEdit;
//    property AfterEdit;
//    property BeforePost;
//    property AfterPost;
//    property BeforeCancel;
//    property AfterCancel;
//    property BeforeDelete;
//    property AfterDelete;
//    property BeforeScroll;
//    property AfterScroll;
    property OnCalcFields;
//    property OnDeleteError;
//    property OnEditError;
//    property OnFilterRecord;
//    property OnNewRecord;
//    property OnPostError;
  end;

  TioBSABaseDataSet = class(TioBaseDataSet)
  private
    // Map of the base class
    FMap: IioMap;
    // the bind source adapter holding the data
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    // Methods
    procedure ValueToBuffer<T>(var AValue: TValue; const AField: TField; var ABuffer: TArray<System.Byte>; const ANativeFormat: Boolean);
  protected
    function CheckAdapter: Boolean;
    procedure SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter); virtual;
    // dataset virtual methods
    procedure InternalPreOpen; override;
    // custom dataset virtual methods
    function InternalRecordCount: Integer; override;
    procedure InternalLoadCurrentRecord(Buffer: TRecordBuffer); override;
    // Others
    procedure InternalInitFieldDefs; override;
    procedure InternalPost; override;
    procedure InternalInsert; override;
    procedure InternalCancel; override;
    procedure InternalEdit; override;
    procedure InternalDelete; override;
    procedure SetFieldData(Field: TField; Buffer: TValueBuffer); override;
    function GetCanModify: Boolean; override;
    procedure DoAfterScroll; override;
    function GetRecordIdx: Integer;
  public
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetFieldData(Field: TField; var Buffer: TValueBuffer; NativeFormat: Boolean): Boolean; override;
    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;
    procedure Append(AObject: TObject); reintroduce; overload;
    procedure Append(AObject: IInterface); reintroduce; overload;
    procedure Insert(AObject: TObject); reintroduce; overload;
    procedure Insert(AObject: IInterface); reintroduce; overload;
    property Map: IioMap read FMap;
  end;

  TioAbstractBlobStream = class(TMemoryStream)
  strict protected
    FField: TBlobField;
    FDataset: TioBSABaseDataSet;
    FModified: Boolean;
    FIsReadingBlobData: Boolean;
    procedure ReadBlobData; virtual; abstract;
    procedure WriteBlobData; virtual; abstract;
  public
    constructor Create(const AField: TBlobField; const AMode: TBlobStreamMode);
    destructor Destroy; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    procedure Truncate;
  end;

  TioWideMemoBlobStream = class(TioAbstractBlobStream)
  strict protected
    procedure ReadBlobData; override;
    procedure WriteBlobData; override;
  public
    constructor Create(const AField: TWideMemoField; const AMode: TBlobStreamMode);
  end;

  TioStreamableObjBlobStream = class(TioAbstractBlobStream)
  strict protected
    procedure ReadBlobData; override;
    procedure WriteBlobData; override;
  public
    constructor Create(const AField: TBlobField; const AMode: TBlobStreamMode);
  end;

  TioFullPathPropertyReadWrite = class
  strict private
    class function _ExtractPropName(var AFullPathPropName: String): String;
    class function _ResolvePath(var AOutObj: TObject; var AOutRttiProperty: TRttiProperty; AFullPathPropName: String): Boolean;
    class function _GetValueForBSProp(const ADataSet: TioBSABaseDataSet; APropName: String): TValue;
  public
    class function GetValue(const ADataSet: TioBSABaseDataSet; AObj: TObject; const AFullPathPropName: String): TValue;
    class procedure SetValue(AObj: TObject; const AFullPathPropName: String; const AValue: TValue);
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Attributes,
  iORM.Context.Container, System.Types, Data.FmtBcd, Data.DBConsts, System.DateUtils,
  iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory, iORM.Utilities, System.StrUtils,
  iORM.RttiContext.Factory;

/// //////////////////////////////////////////////
/// /// Part I:
/// /// Initialization, opening, and closing
/// //////////////////////////////////////////////

// I: open the dataset
procedure TioBaseDataSet.InternalOpen;
begin
  InternalPreOpen; // custom method for subclasses

  // initialize the field definitions
  // (another virtual abstract method of TDataSet)
  InternalInitFieldDefs;

  // if there are no persistent field objects,
  // create the fields dynamically
  // if DefaultFields then NB: Deprecated
  if not(lcPersistent in Fields.LifeCycles) then
    CreateFields;
  // connect the TField objects with the actual fields
  BindFields(True);

  InternalAfterOpen; // custom method for subclasses

  // sets cracks and record position and size
  BofCrack := -1;
  EofCrack := InternalRecordCount;
  FCurrentRecord := BofCrack;
  FRecordBufferSize := FRecordSize + sizeof(TioRecInfo);
  BookmarkSize := sizeof(Integer);

  // everything OK: table is now open
  FIsTableOpen := True;
end;

procedure TioBaseDataSet.InternalClose;
begin
  // disconnet field objects
  BindFields(False);
  // destroy field object (if not persistent)
  // if DefaultFields then NB: Deprecated
  if not(lcPersistent in Fields.LifeCycles) then
    DestroyFields;

  // close the file
  FIsTableOpen := False;
end;

// I: is table open
function TioBaseDataSet.IsCursorOpen: Boolean;
begin
  Result := FIsTableOpen;
end;

/// /////////////////////////////////////
/// /// Part II:
/// /// Bookmarks management and movement
/// /////////////////////////////////////

// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// II: set the requested bookmark as current record
// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TioBaseDataSet.InternalGotoBookmark(Bookmark: Pointer);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := PInteger(Bookmark)^;
  if (ReqBookmark >= BofCrack) and (ReqBookmark <= InternalRecordCount) then
    FCurrentRecord := ReqBookmark
  else
    raise EioException.Create(Self.ClassName, 'InternalGotoBookmark', 'Bookmark ' + ReqBookmark.ToString + ' not found');
end;

procedure TioBaseDataSet.InternalGotoBookmark(Bookmark: TBookmark);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := PInteger(Bookmark)^;
  if (ReqBookmark >= BofCrack) and (ReqBookmark <= InternalRecordCount) then
    FCurrentRecord := ReqBookmark
  else
    raise EioException.Create(Self.ClassName, 'InternalGotoBookmark', 'Bookmark ' + ReqBookmark.ToString + ' not found');
end;

// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// II: same as above (but passes a buffer)
// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TioBaseDataSet.InternalSetToRecord(Buffer: TRecordBuffer);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := PioRecInfo(Buffer + FRecordSize).Bookmark;
  InternalGotoBookmark(@ReqBookmark); // NB: Deprecated
end;

procedure TioBaseDataSet.InternalSetToRecord(Buffer: TRecBuf);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := PioRecInfo(Buffer + FRecordSize)^.Bookmark;
  InternalGotoBookmark(@ReqBookmark); // NB: Deprecated
end;

// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function TioBaseDataSet.GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag;
begin
  Result := PioRecInfo(Buffer + FRecordSize).BookmarkFlag;
end;

function TioBaseDataSet.GetBookmarkFlag(Buffer: TRecBuf): TBookmarkFlag;
begin
  Result := PioRecInfo(Buffer + FRecordSize)^.BookmarkFlag;
end;

// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TioBaseDataSet.SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag);
begin
  PioRecInfo(Buffer + FRecordSize).BookmarkFlag := Value;
end;

procedure TioBaseDataSet.SetBookmarkFlag(Buffer: TRecBuf; AValue: TBookmarkFlag);
begin
  PioRecInfo(Buffer + FRecordSize)^.BookmarkFlag := AValue;
end;

// II: Go to a special position before the first record
procedure TioBaseDataSet.InternalFirst;
begin
  FCurrentRecord := BofCrack;
end;

// II: Go to a special position after the last record
procedure TioBaseDataSet.InternalLast;
begin
  EofCrack := InternalRecordCount;
  FCurrentRecord := EofCrack;
end;

// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// II: read the bookmark data from record buffer
// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TioBaseDataSet.GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  Integer(Data^) := PioRecInfo(Buffer + FRecordSize).Bookmark;
end;

// II: retrieve bookmarks flags from buffer
procedure TioBaseDataSet.GetBookmarkData(Buffer: TRecBuf; Data: TBookmark);
begin
  PInteger(Data)^ := PioRecInfo(Buffer + FRecordSize)^.Bookmark;
end;

// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// II: set the bookmark data in the buffer
// NB: DEPRECATED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TioBaseDataSet.SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  PioRecInfo(Buffer + FRecordSize).Bookmark := Integer(Data^);
end;

// II: change the bookmark flags in the buffer
procedure TioBaseDataSet.SetBookmarkData(Buffer: TRecBuf; Data: TBookmark);
begin
  PioRecInfo(Buffer + FRecordSize)^.Bookmark := PInteger(Data)^;
end;

// II (optional): Record count
function TioBaseDataSet.GetRecordCount: Longint;
begin
  CheckActive;
  Result := InternalRecordCount;
end;

function TioBaseDataSet.GetRecordInfo: TioRecInfo;
begin
  Result := PioRecInfo(ActiveBuffer)^;
end;

// II (optional): Get the number of the current record
function TioBaseDataSet.GetRecNo: Longint;
begin
  UpdateCursorPos;
  if FCurrentRecord < 0 then
    Result := 1
  else
    Result := FCurrentRecord + 1;
end;

// II (optional): Move to the given record number
procedure TioBaseDataSet.SetRecNo(Value: Integer);
begin
  CheckBrowseMode;
  if (Value >= 1) and (Value <= InternalRecordCount) then
  begin
    FCurrentRecord := Value - 1;
    Resync([]);
  end;
end;

/// ///////////////////////////////////////
/// /// Part III:
/// /// Record buffers and field management
/// ///////////////////////////////////////

// III: Retrieve data for current, previous, or next record
// (eventually moving to it) and return the status
function TioBaseDataSet.GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode; DoCheck: Boolean): TGetResult;
begin
  Result := grOK; // default
  case GetMode of
    gmNext: // move on
      if FCurrentRecord < InternalRecordCount - 1 then
        Inc(FCurrentRecord)
      else
        Result := grEOF; // end of file
    gmPrior: // move back
      if FCurrentRecord > 0 then
        Dec(FCurrentRecord)
      else
        Result := grBOF; // begin of file
    gmCurrent: // check if empty
      if (FCurrentRecord >= InternalRecordCount) or (FCurrentRecord < 0) then
        Result := grError;
  end;
  // load the data
  if Result = grOK then
    InternalLoadCurrentRecord(Buffer)
  else if (Result = grError) and DoCheck then
    raise EioException.Create(Self.ClassName, 'GetRecord', 'Invalid record');
end;

// III: Initialize the record (set to 0)
procedure TioBaseDataSet.InternalInitRecord(Buffer: TRecordBuffer);
begin
  FillChar(Buffer^, FRecordBufferSize, 0);
end;

// III: Free the buffer
procedure TioBaseDataSet.FreeRecordBuffer(var Buffer: TRecordBuffer);
begin
  FreeMem(Buffer);
end;

/// III: Determine the size of each record buffer in memory
function TioBaseDataSet.GetRecordSize: Word;
begin
  Result := FRecordSize; // data only
end;

/// III: Allocate a buffer for the record
function TioBaseDataSet.AllocRecordBuffer: TRecordBuffer;
begin
  GetMem(Result, FRecordBufferSize);
end;

// III: Delete the current record
procedure TioBaseDataSet.InternalDelete;
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalDelete', 'Operation not supported');
end;

// default exception handling

procedure TioBaseDataSet.InternalHandleException;
begin
  // special purpose exception handling
  // do nothing
end;

procedure TioBaseDataSet.InternalAddRecord(Buffer: TRecBuf; Append: Boolean);
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalAddRecord', 'Operation not supported');
end;

procedure TioBaseDataSet.InternalPost;
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalPost', 'Operation not supported');
end;

procedure TioBaseDataSet.InternalAfterOpen;
begin
  // nothing to do: subclasses can hook in here
end;

procedure TioBaseDataSet.InternalPreOpen;
begin
  // nothing to do: subclasses can hook in here
end;

{ TMdListDataSet }

procedure TioBSABaseDataSet.Append(AObject: IInterface);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckAdapter and Supports(FBindSourceAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Append(IInterface)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

procedure TioBSABaseDataSet.Append(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckAdapter and Supports(FBindSourceAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Append(TObject)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

function TioBSABaseDataSet.CheckAdapter: Boolean;
begin
  Result := (FBindSourceAdapter <> nil) and FBindSourceAdapter.CanActivate;
end;

function TioBSABaseDataSet.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
var
  LProperty: IioProperty;
begin
  Result := nil;
  // Get Property, Object, Value
  LProperty := FMap.GetProperties.GetPropertyByName(Field.FieldName);
  // Create the right blob stream by DataType
  case Field.DataType of
    TFieldType.ftMemo:
      ;
    TFieldType.ftWideMemo:
      Result := TioWideMemoBlobStream.Create(Field as TWideMemoField, Mode);
    TFieldType.ftGraphic:
      Result := TioStreamableObjBlobStream.Create(Field as TGraphicField, Mode);
    TFieldType.ftBlob:
      Result := TioStreamableObjBlobStream.Create(Field as TBlobField, Mode);
  else
    raise EioException.Create(Self.ClassName, '.CreateBlobStream: Invalid FieldType (blob)');
  end;
end;

procedure TioBSABaseDataSet.DoAfterScroll;
begin
  inherited;
  // Propagate the operation to the linked BindSourceAdapter
  if Self.State = dsInsert then
    Exit;
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    FBindSourceAdapter.ItemIndex := Self.RecNo - 1;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

function TioBSABaseDataSet.GetCanModify: Boolean;
begin
  Result := True; // read-write
end;

function TioBSABaseDataSet.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := FBindSourceAdapter;
end;

procedure TioBSABaseDataSet.Insert(AObject: IInterface);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckAdapter and Supports(FBindSourceAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Insert(IInterface)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

procedure TioBSABaseDataSet.Insert(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckAdapter and Supports(FBindSourceAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Insert(TObject)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

procedure TioBSABaseDataSet.InternalCancel;
begin
  // If destroying then exit
  if csDestroying in ComponentState then
    Exit;
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    FBindSourceAdapter.Cancel;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

procedure TioBSABaseDataSet.InternalDelete;
begin
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    FBindSourceAdapter.Delete;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

procedure TioBSABaseDataSet.InternalEdit;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    FBindSourceAdapter.Edit;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

// -----------------------------------------------------------------------------
procedure TioBSABaseDataSet.InternalInitFieldDefs;
// InitFieldDefsByProperties
  procedure InitFieldDefsByProperties;
  var
    LProperty: IioProperty;
  begin
    for LProperty in FMap.GetProperties do
    begin
      case LProperty.GetRttiType.TypeKind of
        tkInteger, tkEnumeration, tkSet:
          FieldDefs.Add(LProperty.GetName, TFieldType.ftInteger, 0);
        tkChar:
          FieldDefs.Add(LProperty.GetName, TFieldType.ftFixedChar, 0);
        tkFloat:
          FieldDefs.Add(LProperty.GetName, TFieldType.ftFloat, 0);
        tkString, tkLString:
          FieldDefs.Add(LProperty.GetName, TFieldType.ftString, 250);
        tkWString, tkUString:
          FieldDefs.Add(LProperty.GetName, TFieldType.ftWideString, 250);
        // tkClass, tkMethod, tkWChar
        // tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray
      end;
    end;
  end;

begin
  if not Assigned(FMap) then
    raise EioException.Create(Self.ClassName, 'InternalInitFieldDefs', 'Unassigned class map.');
  // Clear field definitions
  FieldDefs.Clear;
  // If some field is specified in the FieldsEditor then create che InternalFieldDefs
  // from their's definitions else from the class properties in the IioMap
  if Fields.Count > 0 then
    InitFieldDefsFromFields
  else
    InitFieldDefsByProperties;
end;

procedure TioBSABaseDataSet.InternalInsert;
begin
  // Disable all the DataSetLinks on the BindSourceAdapter
  // NB: DataSetLink is used to propagate the operation (insert, post,
  // delete, next etc.) from the BindSourceAdapter to all datasets linked
  // to BSA itself).
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    // Strange behavior if not present with empty and just opened dataset
    // (displays the new record twice)
    if FCurrentRecord = -1 then
      Self.First;
    // If EOF then performs an append on the linked BindSourceAdapter else
    // an insert.
    // (If EOF it means that the user has requested ad append, key down
    // pressed when on the last row)
    if Self.Eof then
      FBindSourceAdapter.Append
    else
      FBindSourceAdapter.Insert;
    // Put the current record index in the record buffer
    PInteger(ActiveBuffer)^ := FBindSourceAdapter.ItemIndex;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

// -----------------------------------------------------------------------------

procedure TioBSABaseDataSet.SetFieldData(Field: TField; Buffer: TValueBuffer);
var
  LValue: TValue;
  LDateTime: TDateTime;
  LDateTimeRec: TDateTimeRec;
  LTimeStamp: TSqlTimeStamp;
  LTempValueBuffer: TValueBuffer;
begin
  // If empty then exit
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Move the buffer to the value
  case Field.DataType of
    // Integer
    TFieldType.ftInteger:
      LValue := TBitConverter.UnsafeInTo<Integer>(Buffer);
    TFieldType.ftAutoInc:
      LValue := TBitConverter.UnsafeInTo<Integer>(Buffer);
    TFieldType.ftShortint:
      LValue := TBitConverter.UnsafeInTo<ShortInt>(Buffer);
    TFieldType.ftByte:
      LValue := TBitConverter.UnsafeInTo<Byte>(Buffer);
    TFieldType.ftSmallint:
      LValue := TBitConverter.UnsafeInTo<SmallInt>(Buffer);
    TFieldType.ftLargeint:
      LValue := TBitConverter.UnsafeInTo<Largeint>(Buffer);
    TFieldType.ftWord:
      LValue := TBitConverter.UnsafeInTo<Word>(Buffer);
    TFieldType.ftLongWord:
      LValue := TBitConverter.UnsafeInTo<LongWord>(Buffer);
    // Float
    TFieldType.ftFloat:
      LValue := TBitConverter.UnsafeInTo<Double>(Buffer);
    TFieldType.ftCurrency:
      LValue := TBitConverter.UnsafeInTo<Double>(Buffer);
    TFieldType.ftBCD:
      LValue := TBitConverter.UnsafeInTo<Currency>(Buffer);
    TFieldType.ftFMTBcd:
      LValue := TValue.From<TBCD>(TBitConverter.UnsafeInTo<TBCD>(Buffer));
    TFieldType.ftSingle:
      LValue := TBitConverter.UnsafeInTo<Single>(Buffer);
    TFieldType.ftExtended:
      LValue := TBitConverter.UnsafeInTo<Extended>(Buffer);
    // Boolean
    TFieldType.ftBoolean:
      LValue := TBitConverter.UnsafeInTo<WordBool>(Buffer);
    // Date & Time
    TFieldType.ftDateTime, TFieldType.ftDate, TFieldType.ftTime:
      begin
        // If the buffer is not assigned then the value is NULL
        if not Assigned(Buffer) then
          LValue := TValue.From<TDateTime>(0)
        else
        begin
          SetLength(LTempValueBuffer, sizeof(TDateTimeRec));
          DataConvert(Field, Buffer, LTempValueBuffer, False);
          LDateTimeRec := TBitConverter.UnsafeInTo<TDateTimeRec>(LTempValueBuffer);
          LDateTime := LDateTimeRec.DateTime;
          LValue := TValue.From<TDateTime>(LDateTime);
        end;
      end;
    TFieldType.ftTimeStamp:
      begin
        // If the buffer is not assigned then the value is NULL
        if not Assigned(Buffer) then
          LValue := TValue.From<TDateTime>(0)
        else
        begin
          LTimeStamp := TBitConverter.UnsafeInTo<TSqlTimeStamp>(Buffer);
          LValue := TSqlTimeStampUtils.SqlTimeStampToTValue(LTimeStamp);
        end;
      end;
    // AnsiString è GUID
    TFieldType.ftString, TFieldType.ftFixedChar, TFieldType.ftGuid:
      LValue := PChar(TEncoding.ANSI.GetString(Buffer).TrimRight);
    // LValue := AnsiString(PAnsiChar(Buffer));
    // WideString/Unicode
    TFieldType.ftWideString, TFieldType.ftFixedWideChar:
      LValue := TEncoding.Unicode.GetString(Buffer).TrimRight;
    // LValue := WideString(pWideChar(Buffer));
  end;
  // Set Property, Object, Value:
  // Even if the property is of a child object, even multilevel, it resolves the path and set the value
  TioFullPathPropertyReadWrite.SetValue(FBindSourceAdapter.Current, Field.FieldName, LValue);
  // Set modified
  SetModified(True);
  // NB: Mauri 03/03/2020 - Aggiungendo queste due righe, oltre ad aver eliminato la condizione
  // in ActiveBindSourceAdapter.DoAfterPost e ActiveBindSourceAdapter.DoAfterPostFields,
  // sono riuscito a dare un comportamente corretto anche al DataSet in caso AutoPost=true
  // (precedentemente invece in pratica non faceva mai il post)
  // Mauri 19/04/2020: Ho aggiunto questa condizione perchè mi capitava che quando
  // il Dataset si muoveva su un altro record e quindi faceva il post (se era in editing)
  // che il dataset faceva il post perchè era ancora in editing/insert mentre il BindSourceAdapter
  // invece era già con stato seBrowse quindi, senza condizione, mi dava un errore di record not
  // in edit or insert mode. Non so perchè si verificava questo disallineamento, cmq così
  // sembra non dare problemi.
  if GetActiveBindSourceAdapter.ioAutoPost and (FBindSourceAdapter.State in seEditModes) then
    GetActiveBindSourceAdapter.Post;
end;

procedure TioBSABaseDataSet.SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter);
begin
  if not Assigned(AActiveBindSourceAdpter) then
    raise EioException.Create(ClassName, 'SetInternalAdapter', 'Invalid BindSourceAdapter (nil).');
  if AActiveBindSourceAdpter = FBindSourceAdapter then
    Exit;
  // Set the Map of the BaseObject of the ActiveBindSourceAdapter
  FMap := TioMapContainer.GetMap(AActiveBindSourceAdpter.GetBaseObjectClassName);
  // Set the BindSourceAdapter
  FBindSourceAdapter := AActiveBindSourceAdpter;
  // Register itself (the DataSet) into the DataSetLinkContainer of the BindSourceAdapter
  // NB: DataSetLink is used to propagate the operation (insert, post,
  // delete, next etc.) from the BindSourceAdapter to all datasets linked
  // to BSA itself).
  FBindSourceAdapter.GetDataSetLinkContainer.RegisterDataSet(Self);
end;

// Calc the record index for all possibles situations
function TioBSABaseDataSet.GetRecordIdx: Integer;
var
  LBookmarkFlag: TBookmarkFlag;
begin
  // Get the current record index
  Result := PInteger(ActiveBuffer)^;
  // Get the bookmark flag for current record
  LBookmarkFlag := GetBookmarkFlag(ActiveBuffer);
  // Increments the index in some specific cases.
  // (If we are in an insert operation it adds one to all of the subsequent records
  // indices to what has just been inserted)
  // NB: Not for append
  // -------------------------------------------
  if (State = dsInsert)
  // ... when a new record is inserted (not appended) the relative BookmarkFlag is set to bfInserted
    and (LBookmarkFlag <> TBookmarkFlag.bfInserted)
  // ... when a new record is appended (not inserted) the relative BookmarkFlag is set to bfEOF
    and (LBookmarkFlag <> TBookmarkFlag.bfEOF)
  // ... when a new record is inserted (not appended) only records after the inserted record
  // must be incremented by one (the index is contained in the ActiveBuffer)
    and (Result >= FBindSourceAdapter.ItemIndex)
  // ... when a new record is inserted/appended in empty DataSet then BOF and EOF properties is both setted to True
    and not(BOF and Eof) then
    Inc(Result);
  // -------------------------------------------
end;

// Convert and load Data into the buffer (GetFieldData)
procedure TioBSABaseDataSet.ValueToBuffer<T>(var AValue: TValue; const AField: TField; var ABuffer: TArray<System.Byte>; const ANativeFormat: Boolean);
var
  LTempValueBuffer: TValueBuffer;
begin
  // Set the length of the temporary value buffer
  SetLength(LTempValueBuffer, sizeof(T));
  // If the buffer size is less than the size of the data type then set it to the correct size
  if Length(ABuffer) < sizeof(T) then
    SetLength(ABuffer, sizeof(T));
  // Bit conversion into the temporary value buffer
  TBitConverter.UnsafeFrom<T>(AValue.AsType<T>, LTempValueBuffer);
  DataConvert(AField, LTempValueBuffer, ABuffer, ANativeFormat);
end;

function TioBSABaseDataSet.GetFieldData(Field: TField; var Buffer: TValueBuffer; NativeFormat: Boolean): Boolean;
var
  LValue: TValue;
  LRecordIndex: Integer;
  LDateTime: TDateTime;
  LDateTimeRec: TDateTimeRec;
  LTempValueBuffer: TValueBuffer;
  // Return true if the record is inserted/appended
  function IsInsertingRecord: Boolean;
  var
    LBookmarkFlag: TBookmarkFlag;
  begin
    // Get the bookmark flag for current record
    LBookmarkFlag := GetBookmarkFlag(ActiveBuffer);
    Result := (State = dsInsert) and ((LBookmarkFlag = TBookmarkFlag.bfInserted) or (LBookmarkFlag = TBookmarkFlag.bfEOF));
  end;

begin
  Result := False;
  // If empty then exit
  // if (FBindSourceAdapter.ItemCount = 0) or IsInsertingRecord then
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Get the current record index (corrected by the situations)
  LRecordIndex := GetRecordIdx;
  Result := (LRecordIndex >= -1) and (LRecordIndex <= FBindSourceAdapter.ItemCount - 1);
  // Result := Result and (Length(Buffer) > 0);
  if not Result then
    Exit;
  // Get Property, Object, Value:
  // Even if the property is of a child object, even multilevel, it resolves the path and returns the value
  LValue := TioFullPathPropertyReadWrite.GetValue(Self, FBindSourceAdapter.Items[LRecordIndex], Field.FieldName);
  // ---------- DATA FROM THE OBJECTS ----------
  // Move the value to the buffer
  case Field.DataType of
    // Integer
    // TFieldType.ftInteger:   TBitConverter.UnsafeFrom<Integer>(LValue.AsType<Integer>, Buffer);
    TFieldType.ftInteger:
      ValueToBuffer<Integer>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftAutoInc:
      ValueToBuffer<Integer>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftShortint:
      ValueToBuffer<ShortInt>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftByte:
      ValueToBuffer<Byte>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftSmallint:
      ValueToBuffer<SmallInt>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftLargeint:
      ValueToBuffer<Largeint>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftWord:
      ValueToBuffer<Word>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftLongWord:
      ValueToBuffer<LongWord>(LValue, Field, Buffer, NativeFormat);
    // Float
    TFieldType.ftFloat:
      ValueToBuffer<Double>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftCurrency:
      ValueToBuffer<Double>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftBCD:
      ValueToBuffer<Currency>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftFMTBcd:
      ValueToBuffer<TBCD>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftSingle:
      ValueToBuffer<Single>(LValue, Field, Buffer, NativeFormat);
    TFieldType.ftExtended:
      ValueToBuffer<Extended>(LValue, Field, Buffer, NativeFormat);
    // Boolean
    TFieldType.ftBoolean:
      ValueToBuffer<WordBool>(LValue, Field, Buffer, NativeFormat);
    // Date & Time
    TFieldType.ftDateTime, TFieldType.ftDate, TFieldType.ftTime:
      begin
        LDateTime := LValue.AsType<TDateTime>;
        Result := (LDateTime > 0);
        if Result then
        begin
          if NativeFormat then
          begin
            SetLength(LTempValueBuffer, sizeof(TDateTime));
            TBitConverter.UnsafeFrom<TDateTime>(LDateTime, LTempValueBuffer);
            DataConvert(Field, LTempValueBuffer, Buffer, NativeFormat);
          end
          else
          begin
            LDateTimeRec.DateTime := LDateTime;
            TBitConverter.UnsafeFrom<TDateTimeRec>(LDateTimeRec, Buffer);
          end;
        end;
      end;
    TFieldType.ftTimeStamp:
      // NB: Per questo tipo non ho verificato la compatibilità con DevExpress (NativeFormat = True e Buffer con dimensione zero)
      begin
        LDateTime := LValue.AsType<TDateTime>;
        Result := (LDateTime > 0);
        if Result then
        begin
          SetLength(Buffer, sizeof(TSqlTimeStamp));
          TBitConverter.From<TSqlTimeStamp>(TSqlTimeStampUtils.DateTimeToSqlTimeStamp(LDateTime), Buffer);
        end;
      end;
    // AnsiString + GUID
    TFieldType.ftString, TFieldType.ftFixedChar, TFieldType.ftGuid:
      begin
        if Length(Buffer) < (Field.DataSize) then
          // If the buffer size is less than the size of the data type then set it to the correct size (for DevExpress compatibility (NativeFormat=True and buffer size equals to zero)
          SetLength(Buffer, Field.DataSize);
        FillChar(Buffer[0], Field.DataSize, 0); // Clean the buffer (previous record value presents)
        TEncoding.ANSI.GetBytes(LValue.AsString, 1, LValue.AsString.Length, Buffer, 0);
      end;
    // WideString/Unicode
    TFieldType.ftWideString, TFieldType.ftFixedWideChar:
      begin
        if Length(Buffer) < (Field.DataSize) then
          // If the buffer size is less than the size of the data type then set it to the correct size (for DevExpress compatibility (NativeFormat=True and buffer size equals to zero)
          SetLength(Buffer, Field.DataSize);
        FillChar(Buffer[0], Field.DataSize, 0); // Clean the buffer (previous record value presents)
        TEncoding.Unicode.GetBytes(LValue.AsString, 1, LValue.AsString.Length, Buffer, 0);
      end;
  end;
end;

procedure TioBSABaseDataSet.InternalLoadCurrentRecord(Buffer: TRecordBuffer);
// var
// LBookmarkFlag: TBookmarkFlag;
begin
  // Put the current record index in the record buffer
  PInteger(Buffer)^ := FCurrentRecord;
  with PioRecInfo(Buffer + FRecordSize)^ do
  begin
    BookmarkFlag := bfCurrent;
    Bookmark := FCurrentRecord;
  end;
end;

procedure TioBSABaseDataSet.InternalPost;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    // Mauri 19/04/2020: Ho aggiunto questa condizione perchè mi capitava che quando
    // il Dataset si muoveva su un altro record e quindi faceva il post (se era in editing)
    // che il dataset faceva il post perchè era ancora in editing/insert mentre il BindSourceAdapter
    // invece era già con stato seBrowse quindi, senza condizione, mi dava un errore di record not
    // in edit or insert mode. Non so perchè si verificava questo disallineamento, cmq così
    // sembra non dare problemi.
    if FBindSourceAdapter.State in seEditModes then
      FBindSourceAdapter.Post;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

procedure TioBSABaseDataSet.InternalPreOpen;
begin
  // The buffer of the record contains the index of the current
  // record/object on the BindSourceAdapter
  FRecordSize := sizeof(Integer); // Integer size (4 or 8?)
end;

function TioBSABaseDataSet.InternalRecordCount: Integer;
begin
  // Get the RecordCount from the linked BindSourceAdapter
  Result := FBindSourceAdapter.ItemCount;
end;

{ TSqlTimeStampUtils }

class function TSqlTimeStampUtils.DateTimeToSqlTimeStamp(const ADateTime: TDateTime): TSqlTimeStamp;
var
  LYY, LMM, LDD, LHH, LNN, LSS, LMS: Word;
begin
  DecodeDateTime(ADateTime, LYY, LMM, LDD, LHH, LNN, LSS, LMS);
  Result.Year := LYY;
  Result.Month := LMM;
  Result.Day := LDD;
  Result.Hour := LHH;
  Result.Minute := LNN;
  Result.Second := LSS;
  Result.Fractions := LMS;
end;

class function TSqlTimeStampUtils.SqlTimeStampToTValue(const ASqlTimeStamp: TSqlTimeStamp): TValue;
var
  LDateTime: TDateTime;
begin
  LDateTime := EncodeDateTime(ASqlTimeStamp.Year, ASqlTimeStamp.Month, ASqlTimeStamp.Day, ASqlTimeStamp.Hour, ASqlTimeStamp.Minute, ASqlTimeStamp.Second,
    ASqlTimeStamp.Fractions);
  Result := TValue.From<TDateTime>(LDateTime);
end;

{ TioAbstractMemoryStream }

constructor TioAbstractBlobStream.Create(const AField: TBlobField; const AMode: TBlobStreamMode);
begin
  inherited Create;
  FIsReadingBlobData := False;
  FModified := False;
  FField := AField;
  FDataset := (AField.DataSet as TioBSABaseDataSet);
  if AMode <> TBlobStreamMode.bmRead then
  begin
    if AField.ReadOnly or not AField.DataSet.CanModify then
      DatabaseErrorFmt(SFieldReadOnly, [AField.DisplayName], AField.DataSet);
    if not(AField.DataSet.State in [dsEdit, dsInsert, dsNewValue]) then
      DatabaseError(SNotEditing, AField.DataSet);
  end;
  if AMode = bmWrite then
    Truncate
  else
    ReadBlobData;
end;

destructor TioAbstractBlobStream.Destroy;
begin
  if FModified then
    try
      WriteBlobData;
      FField.Modified := True;
      FDataset.DataEvent(deFieldChange, IntPtr(FField));
    except
      if Assigned(System.Classes.ApplicationHandleException) then
        ApplicationHandleException(Self);
    end;
  inherited Destroy;
end;

procedure TioAbstractBlobStream.Truncate;
begin
  Clear;
  // Se non siamo in fase di lettura dei dati del blob allora
  // imposta il flag MOdified = True, ho aggiunto il flag IsreadingBlobData
  // perchè altrimenti nel caso dei BLOB grafici (o cmq non i Memo) durante
  // il caricaemtneo dello stream veniva eseguito anche questo metodo e quindi
  // si ritrovava in un loop infinito.
  FModified := not FIsReadingBlobData;
end;

function TioAbstractBlobStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result := inherited Write(Buffer, Count);
  // Se non siamo in fase di lettura dei dati del blob allora
  // imposta il flag MOdified = True, ho aggiunto il flag IsreadingBlobData
  // perchè altrimenti nel caso dei BLOB grafici (o cmq non i Memo) durante
  // il caricaemtneo dello stream veniva eseguito anche questo metodo e quindi
  // si ritrovava in un loop infinito.
  FModified := not FIsReadingBlobData;
end;

{ TioWideMemoBlobStream }

constructor TioWideMemoBlobStream.Create(const AField: TWideMemoField; const AMode: TBlobStreamMode);
begin
  inherited Create(AField, AMode);
end;

procedure TioWideMemoBlobStream.ReadBlobData;
var
  LRecordIndex: Integer;
  LProperty: IioProperty;
  LObj: TObject;
  LStrings: TStrings;
  LBytes: TBytes;
  LValue: TValue;
begin
  FIsReadingBlobData := True;
  try
    // Get the current record index (corrected by the situations)
    LRecordIndex := FDataset.GetRecordIdx;
    // Get Property, Object, Value
    LProperty := FDataset.Map.GetProperties.GetPropertyByName(FField.FieldName);
    LObj := FDataset.GetActiveBindSourceAdapter.Items[LRecordIndex];
    LValue := LProperty.GetValue(LObj);
    // Get value as TStrings
    LStrings := LValue.AsType<TStrings>;
    // Encode
    LBytes := TEncoding.Unicode.GetBytes(LStrings.Text);
    // Write data from the record data to the stream
    Self.Position := 0;
    Self.WriteData(LBytes, Length(LBytes));
    Self.Position := 0;
  finally
    FIsReadingBlobData := False;
  end;
end;

procedure TioWideMemoBlobStream.WriteBlobData;
var
  LRecordIndex: Integer;
  LProperty: IioProperty;
  LObj: TObject;
  LValue: TValue;
  LStrings: TStrings;
  LBytes: TBytes;
  LLen: Integer;
begin
  // Get the current record index (corrected by the situations)
  LRecordIndex := FDataset.GetRecordIdx;
  // Get Property, Object, Value
  LProperty := FDataset.Map.GetProperties.GetPropertyByName(FField.FieldName);
  LObj := FDataset.GetActiveBindSourceAdapter.Items[LRecordIndex];
  LValue := LProperty.GetValue(LObj);
  // Get value as TStrings
  LStrings := LValue.AsType<TStrings>;
  // Read data to the record from the stream
  Self.Position := 0;
  LLen := Self.Size;
  SetLength(LBytes, LLen);
  Self.ReadData(LBytes, LLen);
  // Decode
  LStrings.Text := TEncoding.Unicode.GetString(LBytes);
end;

{ TioStreamableObjBlobStream }

constructor TioStreamableObjBlobStream.Create(const AField: TBlobField; const AMode: TBlobStreamMode);
begin
  inherited Create(AField, AMode);
end;

procedure TioStreamableObjBlobStream.ReadBlobData;
var
  LRecordIndex: Integer;
  LProperty: IioProperty;
  LCurrRecObj, LStreamableObj: TObject;
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
begin
  FIsReadingBlobData := True;
  try
    // Get the current record index (corrected by the situations)
    LRecordIndex := FDataset.GetRecordIdx;
    // Get Property, Object, Value (Value as StremableObj instance)
    LProperty := FDataset.Map.GetProperties.GetPropertyByName(FField.FieldName);
    LCurrRecObj := FDataset.GetActiveBindSourceAdapter.Items[LRecordIndex];
    // At this point the property refer to a blob field (and to an Object) type then
    // check if the Object is assigned and if it isn't clear
    // the parameter
    LStreamableObj := LProperty.GetValueAsObject(LCurrRecObj);
    if Assigned(LStreamableObj) then
    begin
      // Wrap the object into a DuckTypedStreamObject
      ADuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(LStreamableObj);
      // If the wrapped object IsEmpty then clear the BlobDataStream also
      // else load data from the object to the stream
      if ADuckTypedStreamObject.IsEmpty then
        Self.Clear
      else
      begin
        Self.Position := 0;
        ADuckTypedStreamObject.SaveToStream(Self);
      end;
    end
    else
      Self.Clear;
    // At the top of the stream
    Self.Position := 0;
  finally
    FIsReadingBlobData := False;
  end;
end;

procedure TioStreamableObjBlobStream.WriteBlobData;
var
  LRecordIndex: Integer;
  LProperty: IioProperty;
  LCurrRecObj, LStreamableObj: TObject;
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
begin
  // Get the current record index (corrected by the situations)
  LRecordIndex := FDataset.GetRecordIdx;
  // Get Property, Object, Value (Value as StremableObj instance)
  LProperty := FDataset.Map.GetProperties.GetPropertyByName(FField.FieldName);
  LCurrRecObj := FDataset.GetActiveBindSourceAdapter.Items[LRecordIndex];
  // At this point the property refer to a blob field (and to an Object) type then
  // check if the Object is assigned and if it isn't clear
  // the parameter
  LStreamableObj := LProperty.GetValueAsObject(LCurrRecObj);
  if Assigned(LStreamableObj) then
  begin
    // Wrap the object into a DuckTypedStreamObject
    ADuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(LStreamableObj);
    // Save the data from the stream to the object
    Self.Position := 0;
    ADuckTypedStreamObject.LoadFromStream(Self);
    Self.Position := 0;
  end
  else
    raise EioException.Create(Self.ClassName, 'WriteBlobData', 'Streamable object not assigned.');
end;

{ TioFullPathPropertyReadWrite }

class function TioFullPathPropertyReadWrite._ExtractPropName(var AFullPathPropName: String): String;
var
  LPos: Integer;
begin
  LPos := Pos('.', AFullPathPropName);
  if LPos = 0 then
  begin
    Result := AFullPathPropName;
    AFullPathPropName := '';
  end
  else
  begin
    Result := LeftStr(AFullPathPropName, LPos - 1);
    AFullPathPropName := AFullPathPropName.Remove(0, LPos);
  end;
end;

//class function TioFullPathPropertyReadWrite._ResolvePath(var AOutObj: TObject; var AOutProperty: IioProperty; AFullPathPropName: String): Boolean;
//var
//  LPropName: String;
//begin
//  Result := False;
//  LPropName := _ExtractPropName(AFullPathPropName);
//  AOutProperty := TioMapContainer.GetMap(AOutObj.ClassName).GetProperties.GetPropertyByName(LPropName);
//  if not AFullPathPropName.IsEmpty then
//  begin
//    // If it is not the last property of the path then it must have a BelongsTo, HasOne or EmbeddedHasOne relationship
//    if not(AOutProperty.GetRelationType in [rtBelongsTo, rtHasOne, rtEmbeddedHasOne]) then
//      raise EioException.Create(ClassName, '_ResolvePath', Format('Property "%s.%s" must have a BelongsTo, HasOne or EmbeddedHasOne relationship.',
//        [AOutObj.ClassName, LPropName]));
//    AOutObj := AOutProperty.GetRelationChildObject(AOutObj);
//    // Recursion: If the child object is not assigned, the recursion stops and the function returns false
//    if Assigned(AOutObj) then
//      Result := _ResolvePath(AOutObj, AOutProperty, AFullPathPropName); // Recursion
//  end
//  else
//    Result := True;
//end;
class function TioFullPathPropertyReadWrite._ResolvePath(var AOutObj: TObject; var AOutRttiProperty: TRttiProperty; AFullPathPropName: String): Boolean;
var
  LPropName: String;
  LMidPathProperty: IioProperty;
begin
  Result := False;
  LPropName := _ExtractPropName(AFullPathPropName);
  // If we are in the middle of the path (we are not at the final leaf property)
  //  then it recursively calls itself by continuing in the path through the mapped prop/fields...
  if not AFullPathPropName.IsEmpty then
  begin
    LMidPathProperty := TioMapContainer.GetMap(AOutObj.ClassName).GetProperties.GetPropertyByName(LPropName);
    // If it is not the last property of the path then it must have a BelongsTo, HasOne or EmbeddedHasOne relationship
    if not(LMidPathProperty.GetRelationType in [rtBelongsTo, rtHasOne, rtEmbeddedHasOne]) then
      raise EioException.Create(ClassName, '_ResolvePath', Format('Property "%s.%s" must have a BelongsTo, HasOne or EmbeddedHasOne relationship.',
        [AOutObj.ClassName, LPropName]));
    AOutObj := LMidPathProperty.GetRelationChildObject(AOutObj);
    // Recursion: If the child object is not assigned, the recursion stops and the function returns false
    if Assigned(AOutObj) then
      Result := _ResolvePath(AOutObj, AOutRttiProperty, AFullPathPropName); // Recursion
  end
  // ...instead if we are in a final leaf property then look for the RttiProperty to be returned
  //  in the RttiType of the final leaf object (not the mapped properties) because otherwise
  //  if it has been mapped for private fields it would not pass through the possible set method.
  else
  begin
    AOutRttiProperty := TioRttiFactory.GetRttiPropertyByClass(AOutObj.ClassType, LPropName);
    Result := True;
  end;
end;

//class function TioFullPathPropertyReadWrite.GetValue(AObj: TObject; const AFullPathPropName: String): TValue;
//var
//  LProperty: IioProperty;
//begin
//  if _ResolvePath(AObj, LProperty, AFullPathPropName) then
//    Result := LProperty.GetValue(AObj)
//  else
//    Result := TValue.Empty;
//end;
class function TioFullPathPropertyReadWrite.GetValue(const ADataSet: TioBSABaseDataSet; AObj: TObject; const AFullPathPropName: String): TValue;
var
  LProperty: TRttiProperty;
begin
  // In case of special bind source related property
  if AFullPathPropName.StartsWith('%') then
    Result := _GetValueForBSProp(ADataSet, AFullPathPropName)
  // In case of normal property of the current object (cirrent record)
  else
  if _ResolvePath(AObj, LProperty, AFullPathPropName) then
    Result := LProperty.GetValue(AObj)
  // Else return an empty value
  else
    Result := TValue.Empty;
end;

class function TioFullPathPropertyReadWrite._GetValueForBSProp(const ADataSet: TioBSABaseDataSet; APropName: String): TValue;
var
  LProperty: TRttiProperty;
  LBindSource: IioNotifiableBindSource;
  LInstance: TObject;
begin
  LInstance := nil;
  // Get the bind source as IioNotifiableBindSource (return an empty value if ADataSet don't implement the interface)
  if not Supports(ADataSet, IioNotifiableBindSource, LBindSource) then
    Result := TValue.Empty;
  // Check if the VirtualFields are enabled
  if not LBindSource.VirtualFields then
    raise EioException.Create(Self.ClassName, '_GetValueForBSProp',
      Format('iORM trying to read the value of the "%s" virtual field declared in the component "%s".' +
      #13#13'I''m sorry but the "VirtualFields" property of that component is set to "False" so they are disabled.' +
      #13#13'Set the property to "True" and try again, it will work.', [APropName, LBindSource.GetName]));
  // In case of paging related property
  if APropName.StartsWith('%Paging.') then
  begin
    APropName := APropName.Replace('%Paging.', '');
    LInstance := LBindSource.Paging as TObject;
  end
  else
  // In case of bind source related property
  if APropName.StartsWith('%') then
  begin
    APropName := APropName.Replace('%', '');
    LInstance := LBindSource as TObject;
  end
  // Else return an empty value
  else
    Result := TValue.Empty;
  // Extract the value for the specified property and instance
  LProperty := TioUtilities.GetRttiProperty(LInstance.ClassType, APropName);
  if Assigned(LProperty) then
    Result := LProperty.GetValue(LInstance)
  else
    Result := TValue.Empty;
end;

//class procedure TioFullPathPropertyReadWrite.SetValue(AObj: TObject; const AFullPathPropName: String; const AValue: TValue);
//var
//  LProperty: IioProperty;
//begin
//  if _ResolvePath(AObj, LProperty, AFullPathPropName) then
//    LProperty.SetValue(AObj, AValue)
//  else
//    raise EioException.Create(Self.ClassName, 'SetValue',
//      Format('I am unable to resolve the property path "%s".'#13#13'It could be that one of the objects along the way is nil.', [AFullPathPropName]));
//end;
class procedure TioFullPathPropertyReadWrite.SetValue(AObj: TObject; const AFullPathPropName: String; const AValue: TValue);
var
  LProperty: TRttiProperty;
begin
  // NB: If it's a property relative to the BindSource then raise an exception because
  //      these type of properties are ReadOnly
  if AFullPathPropName.StartsWith('%') then
    raise EioException.Create(Self.ClassName, 'SetValue',
      Format('Ooops, I see you have set some virtual fields in some BindSource or DataSet (FieldDefs property), they are the ones whose name starts with the character "%%".' +
      #13#13'Note that these type of virtual fields are read-only by design; iORM cannot assign the new value to the field named "%s".' +
      #13#13'Please, try to Assign the value to the DataSet property directly by code.', [AFullPathPropName]));

  if _ResolvePath(AObj, LProperty, AFullPathPropName) then
    LProperty.SetValue(AObj, AValue)
  else
    raise EioException.Create(Self.ClassName, 'SetValue',
      Format('I am unable to resolve the property path "%s".'#13#13'It could be that one of the objects along the way is nil.', [AFullPathPropName]));
end;

end.
