unit iORM.DB.Components.DataSet.Base;

interface

uses
  Data.DB, iORM.LiveBindings.Interfaces, Data.Bind.ObjectScope,
  iORM.Context.Map.Interfaces, System.Classes, System.Rtti, Data.SqlTimSt;

const

  NULL_RECORD_BUFFER: TRecordBuffer = 0; // Before XE4 use "NullBuffer := nil"

type

  TSqlTimeStampUtils = class
  public
    class function DateTimeToSqlTimeStamp(const ADateTime:TDateTime): TSqlTimeStamp; static;
    class function SqlTimeStampToTValue(const ASqlTimeStamp:TSqlTimeStamp): TValue; static;
  end;

  TioRecInfo = record
    Bookmark: Longint;
    BookmarkFlag: TBookmarkFlag;
  end;
  PioRecInfo = ^TioRecInfo;

  PValueBuffer = ^TValueBuffer;

  TioCustomDataSet = class(TDataSet)
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
    function GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode;
      DoCheck: Boolean): TGetResult; override;
    procedure InternalFirst; override;
    procedure InternalLast; override;
    function GetRecNo: Longint; override;
    function GetRecordCount: Longint; override;
    procedure SetRecNo(Value: Integer); override;

    // bookmarks
    procedure InternalGotoBookmark(Bookmark: Pointer); override;
    procedure InternalSetToRecord(Buffer: TRecordBuffer); override;
    procedure SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    procedure GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    procedure SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag); override;
    function GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag; override;

    // editing (dummy vesions)
    procedure InternalDelete; override;
    procedure InternalAddRecord(Buffer: TRecBuf; Append: Boolean); override;
    procedure InternalPost; override;

    // other
    procedure InternalHandleException; override;
  published
    // redeclared data set properties
    property Active;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
  end;

  TioBSADataSet = class (TioCustomDataSet)
  private
    // Map of the base class
    FMap: IioMap;
    // the bind source adapter holding the data
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    // Before edit data buffer
    FBeforeEditValues: String;
    // Methods
    procedure SaveBeforeEditValues;
    procedure RestoreBeforeEditValues;
  protected
    // InternalAdapter (there is a setter but the property must be ReadOnly)
    function GetInternalAdapter: TBindSourceAdapter;
    procedure SetInternalAdapter(const AActiveBindSourceAdpter:IioActiveBindSourceAdapter);
    // dataset virtual methods
    procedure InternalPreOpen; override;
    // custom dataset virtual methods
    function InternalRecordCount: Integer; override;
    procedure InternalLoadCurrentRecord (Buffer: TRecordBuffer); override;
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
    function GetRecordInfo: TioRecInfo;
    function GetRecordIdx: Integer;
  public
    function GetFieldData(Field: TField; var Buffer: TValueBuffer; NativeFormat: Boolean): Boolean; override;
    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;
    property InternalAdapter: TBindSourceAdapter read GetInternalAdapter;  // Must be ReadOnly
    property InternalActiveAdapter: IioActiveBindSourceAdapter read FBindSourceAdapter;  // Must be ReadOnly
    property Map:IioMap read FMap;
  end;

  TioAbstractBlobStream = class(TMemoryStream)
  strict protected
    FField: TBlobField;
    FDataset: TioBSADataSet;
    FModified: Boolean;
    FIsReadingBlobData: Boolean;
    procedure ReadBlobData; virtual; abstract;
    procedure WriteBlobData; virtual; abstract;
  public
    constructor Create(
      const AField: TBlobField;
      const AMode: TBlobStreamMode);
    destructor Destroy; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    procedure Truncate;
  end;

  TioWideMemoBlobStream = class(TioAbstractBlobStream)
  strict protected
    procedure ReadBlobData; override;
    procedure WriteBlobData; override;
  public
    constructor Create(
      const AField: TWideMemoField;
      const AMode: TBlobStreamMode);
  end;

  TioStreamableObjBlobStream = class(TioAbstractBlobStream)
  strict protected
    procedure ReadBlobData; override;
    procedure WriteBlobData; override;
  public
    constructor Create(
      const AField: TBlobField;
      const AMode: TBlobStreamMode);
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Context.Properties.Interfaces,
  iORM.Context.Container, System.Types, Data.FmtBcd, Data.DBConsts, System.DateUtils,
  iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory, ObjMapper;

/////////////////////////////////////////////////
////// Part I:
////// Initialization, opening, and closing
/////////////////////////////////////////////////

// I: open the dataset
procedure TioCustomDataSet.InternalOpen;
begin
  InternalPreOpen; // custom method for subclasses

  // initialize the field definitions
  // (another virtual abstract method of TDataSet)
  InternalInitFieldDefs;

  // if there are no persistent field objects,
  // create the fields dynamically
  if DefaultFields then
    CreateFields;
  // connect the TField objects with the actual fields
  BindFields (True);

  InternalAfterOpen; // custom method for subclasses

  // sets cracks and record position and size
  BofCrack := -1;
  EofCrack := InternalRecordCount;
  FCurrentRecord := BofCrack;
  FRecordBufferSize := FRecordSize + sizeof (TioRecInfo);
  BookmarkSize := sizeOf (Integer);

  // everything OK: table is now open
  FIsTableOpen := True;
end;

procedure TioCustomDataSet.InternalClose;
begin
  // disconnet field objects
  BindFields (False);
  // destroy field object (if not persistent)
  if DefaultFields then
    DestroyFields;

  // close the file
  FIsTableOpen := False;
end;

// I: is table open
function TioCustomDataSet.IsCursorOpen: Boolean;
begin
  Result := FIsTableOpen;
end;

////////////////////////////////////////
////// Part II:
////// Bookmarks management and movement
////////////////////////////////////////

// II: set the requested bookmark as current record
procedure TioCustomDataSet.InternalGotoBookmark (Bookmark: Pointer);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := Integer (Bookmark^);
  if (ReqBookmark >= BofCrack) and (ReqBookmark <= InternalRecordCount) then
    FCurrentRecord := ReqBookmark
  else
    raise EioException.Create(Self.ClassName, 'InternalGotoBookmark', 'Bookmark ' + ReqBookmark.ToString + ' not found');
end;

// II: same as above (but passes a buffer)
procedure TioCustomDataSet.InternalSetToRecord (Buffer: TRecordBuffer);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := PioRecInfo(Buffer + FRecordSize).Bookmark;
  InternalGotoBookmark (@ReqBookmark);
end;

// II: retrieve bookmarks flags from buffer
function TioCustomDataSet.GetBookmarkFlag (
  Buffer: TRecordBuffer): TBookmarkFlag;
begin
  Result := PioRecInfo(Buffer + FRecordSize).BookmarkFlag;
end;

// II: change the bookmark flags in the buffer
procedure TioCustomDataSet.SetBookmarkFlag (Buffer: TRecordBuffer;
  Value: TBookmarkFlag);
begin
  PioRecInfo(Buffer + FRecordSize).BookmarkFlag := Value;
end;

// II: Go to a special position before the first record
procedure TioCustomDataSet.InternalFirst;
begin
  FCurrentRecord := BofCrack;
end;

// II: Go to a special position after the last record
procedure TioCustomDataSet.InternalLast;
begin
  EofCrack := InternalRecordCount;
  FCurrentRecord := EofCrack;
end;

// II: read the bookmark data from record buffer
procedure TioCustomDataSet.GetBookmarkData (
  Buffer: TRecordBuffer; Data: Pointer);
begin
  Integer(Data^) :=
    PioRecInfo(Buffer + FRecordSize).Bookmark;
end;

// II: set the bookmark data in the buffer
procedure TioCustomDataSet.SetBookmarkData (
  Buffer: TRecordBuffer; Data: Pointer);
begin
  PioRecInfo(Buffer + FRecordSize).Bookmark :=
    Integer(Data^);
end;

// II (optional): Record count
function TioCustomDataSet.GetRecordCount: Longint;
begin
  CheckActive;
  Result := InternalRecordCount;
end;

// II (optional): Get the number of the current record
function TioCustomDataSet.GetRecNo: Longint;
begin
  UpdateCursorPos;
  if FCurrentRecord < 0 then
    Result := 1
  else
    Result := FCurrentRecord + 1;
end;

// II (optional): Move to the given record number
procedure TioCustomDataSet.SetRecNo(Value: Integer);
begin
  CheckBrowseMode;
  if (Value >= 1) and (Value <= InternalRecordCount) then
  begin
    FCurrentRecord := Value - 1;
    Resync([]);
  end;
end;

//////////////////////////////////////////
////// Part III:
////// Record buffers and field management
//////////////////////////////////////////

// III: Retrieve data for current, previous, or next record
// (eventually moving to it) and return the status
function TioCustomDataSet.GetRecord(Buffer: TRecordBuffer;
  GetMode: TGetMode; DoCheck: Boolean): TGetResult;
begin
  Result := grOK; // default
  case GetMode of
    gmNext: // move on
      if FCurrentRecord < InternalRecordCount - 1 then
        Inc (FCurrentRecord)
      else
        Result := grEOF; // end of file
    gmPrior: // move back
      if FCurrentRecord > 0 then
        Dec (FCurrentRecord)
      else
        Result := grBOF; // begin of file
    gmCurrent: // check if empty
      if (FCurrentRecord >= InternalRecordCount) or
          (FCurrentRecord < 0) then
        Result := grError;
  end;
  // load the data
  if Result = grOK then
    InternalLoadCurrentRecord(Buffer)
  else
    if (Result = grError) and DoCheck then
      raise EioException.Create (Self.ClassName, 'GetRecord', 'Invalid record');
end;

// III: Initialize the record (set to 0)
procedure TioCustomDataSet.InternalInitRecord(Buffer: TRecordBuffer);
begin
  FillChar(Buffer^, FRecordBufferSize, 0);
end;

// III: Free the buffer
procedure TioCustomDataSet.FreeRecordBuffer (var Buffer: TRecordBuffer);
begin
  FreeMem (Buffer);
end;

/// III: Determine the size of each record buffer in memory
function TioCustomDataSet.GetRecordSize: Word;
begin
  Result := FRecordSize; // data only
end;

/// III: Allocate a buffer for the record
function TioCustomDataSet.AllocRecordBuffer: TRecordBuffer;
begin
  GetMem (Result, FRecordBufferSize);
end;

// III: Delete the current record
procedure TioCustomDataSet.InternalDelete;
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalDelete', 'Operation not supported');
end;

// default exception handling

procedure TioCustomDataSet.InternalHandleException;
begin
  // special purpose exception handling
  // do nothing
end;

procedure TioCustomDataSet.InternalAddRecord(Buffer: TRecBuf;
  Append: Boolean);
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalAddRecord', 'Operation not supported');
end;

procedure TioCustomDataSet.InternalPost;
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalPost', 'Operation not supported');
end;

procedure TioCustomDataSet.InternalAfterOpen;
begin
  // nothing to do: subclasses can hook in here
end;

procedure TioCustomDataSet.InternalPreOpen;
begin
  // nothing to do: subclasses can hook in here
end;

{ TMdListDataSet }

function TioBSADataSet.CreateBlobStream(Field: TField;
  Mode: TBlobStreamMode): TStream;
var
  LProperty: IioContextProperty;
begin
  // Get Property, Object, Value
  LProperty := FMap.GetProperties.GetPropertyByName(Field.FieldName);
  // Create the right blob stream by DataType
  case Field.DataType of
    TFieldType.ftMemo:;
    TFieldType.ftWideMemo:
      Result := TioWideMemoBlobStream.Create(Field as TWideMemoField, Mode);
    TFieldType.ftGraphic:
      Result := TioStreamableObjBlobStream.Create(Field as TGraphicField, Mode);
    TFieldType.ftBlob:
      Result := TioStreamableObjBlobStream.Create(Field as TBlobField, Mode);
  end;
end;

procedure TioBSADataSet.DoAfterScroll;
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

function TioBSADataSet.GetCanModify: Boolean;
begin
  Result := True; // read-write
end;

function TioBSADataSet.GetInternalAdapter: TBindSourceAdapter;
begin
  if Assigned(FBindSourceAdapter) then
    Result := FBindSourceAdapter as TBindSourceAdapter
  else
    Result := nil;
end;

function TioBSADataSet.GetRecordInfo: TioRecInfo;
begin
  Result := PioRecInfo(ActiveBuffer)^;
end;

procedure TioBSADataSet.InternalCancel;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    RestoreBeforeEditValues;
    FBindSourceAdapter.Cancel;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

procedure TioBSADataSet.InternalDelete;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    FBindSourceAdapter.Delete;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

procedure TioBSADataSet.InternalEdit;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    SaveBeforeEditValues;
    FBindSourceAdapter.Edit;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

// -----------------------------------------------------------------------------
procedure TioBSADataSet.InternalInitFieldDefs;
  // InitFieldDefsByProperties
  procedure InitFieldDefsByProperties;
  var
    LProperty: IioContextProperty;
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
          FieldDefs.Add(LProperty.GetName, TFieldType.ftString, 250); // TODO: fix size
        tkWString, tkUString:
          FieldDefs.Add(LProperty.GetName, TFieldType.ftWideString, 250); // TODO: fix size
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
  //  from their's definitions else from the class properties in the IioMap
  if Fields.Count > 0 then
    InitFieldDefsFromFields
  else
    InitFieldDefsByProperties;
end;

procedure TioBSADataSet.InternalInsert;
begin
  // Disable all the DataSetLinks on the BindSourceAdapter
  //  NB: DataSetLink is used to propagate the operation (insert, post,
  //       delete, next etc.) from the BindSourceAdapter to all datasets linked
  //       to BSA itself).
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    // Strange behavior if not present with empty and just opened dataset
    //  (displays the new record twice)
    if FCurrentRecord = -1 then
      Self.First;
    // If EOF then performs an append on the linked BindSourceAdapter else
    //  an insert.
    //  (If EOF it means that the user has requested ad append, key down
    //   pressed when on the last row)
    if Self.Eof then
      FBindSourceAdapter.Append
    else
      FBindSourceAdapter.Insert;
    // Put the current record index in the record buffer
    PInteger(ActiveBuffer)^ := FBindSourceAdapter.ItemIndex;
    SaveBeforeEditValues;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

// -----------------------------------------------------------------------------

procedure TioBSADataSet.SaveBeforeEditValues;
var
  LObj: TObject;
begin
  // Get the current object
  LObj := FBindSourceAdapter.Current;
  // Save object status
  FBeforeEditValues := om.From(LObj).TypeAnnotationsON.ToString;
end;

procedure TioBSADataSet.SetFieldData(Field: TField; Buffer: TValueBuffer);
var
  LValue: TValue;
  LProperty: IioContextProperty;
  LDateTime: TDateTime;
  LDateTimeRec: TDateTimeRec;
  LTimeStamp: TSQLTimeStamp;
  LTempValueBuffer: TValueBuffer;
begin
  // If empty then exit
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Move the buffer to the value
  case Field.DataType of
    // Integer
    TFieldType.ftInteger:   LValue := TBitConverter.UnsafeInTo<Integer>(Buffer);
    TFieldType.ftAutoInc:   LValue := TBitConverter.UnsafeInTo<Integer>(Buffer);
    TFieldType.ftShortint:  LValue := TBitConverter.UnsafeInTo<ShortInt>(Buffer);
    TFieldType.ftByte:      LValue := TBitConverter.UnsafeInTo<Byte>(Buffer);
    TFieldType.ftSmallint:  LValue := TBitConverter.UnsafeInTo<SmallInt>(Buffer);
    TFieldType.ftLargeint:  LValue := TBitConverter.UnsafeInTo<Largeint>(Buffer);
    TFieldType.ftWord:      LValue := TBitConverter.UnsafeInTo<Word>(Buffer);
    TFieldType.ftLongWord:  LValue := TBitConverter.UnsafeInTo<LongWord>(Buffer);
    // Float
    TFieldType.ftFloat:     LValue := TBitConverter.UnsafeInTo<Double>(Buffer);
    TFieldType.ftCurrency:  LValue := TBitConverter.UnsafeInTo<Double>(Buffer);
    TFieldType.ftBCD:       LValue := TBitConverter.UnsafeInTo<Currency>(Buffer);
    TFieldType.ftFMTBcd:    LValue := TValue.From<TBCD>(   TBitConverter.UnsafeInTo<TBCD>(Buffer)   );
    TFieldType.ftSingle:    LValue := TBitConverter.UnsafeInTo<Single>(Buffer);
    TFieldType.ftExtended:  LValue := TBitConverter.UnsafeInTo<Extended>(Buffer);
    // Boolean
    TFieldType.ftBoolean:   LValue := TBitConverter.UnsafeInTo<WordBool>(Buffer);
    // Date & Time
    TFieldType.ftDateTime, TFieldType.ftDate, TFieldType.ftTime:
    begin
      // If the buffer is not assigned then the value is NULL
      if not Assigned(Buffer) then
        LValue := TValue.From<TDateTime>(0)
      else
      begin
        SetLength(LTempValueBuffer, SizeOf(TDateTimeRec));
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
        LTimeStamp := TBitConverter.UnsafeInTo<TSQLTimeStamp>(Buffer);
        LValue := TSqlTimeStampUtils.SqlTimeStampToTValue(LTimeStamp);
      end;
    end;
    // AnsiString è GUID
    TFieldType.ftString, TFieldType.ftFixedChar, TFieldType.ftGuid:
      LValue := PChar(TEncoding.ANSI.GetString(Buffer).TrimRight);
//      LValue := AnsiString(PAnsiChar(Buffer));
    // WideString/Unicode
    TFieldType.ftWideString, TFieldType.ftFixedWideChar:
      LValue := TEncoding.Unicode.GetString(Buffer).TrimRight;
//      LValue := WideString(pWideChar(Buffer));
  end;
  // Set the value into the object
  LProperty := FMap.GetProperties.GetPropertyByName(Field.FieldName);
  LProperty.SetValue(FBindSourceAdapter.Current, LValue);
  // Set modified
  SetModified(True);
end;

procedure TioBSADataSet.SetInternalAdapter(
  const AActiveBindSourceAdpter: IioActiveBindSourceAdapter);
begin
  if not Assigned(AActiveBindSourceAdpter) then
    raise EioException.Create(Self.ClassName, 'SetInternalAdapter', 'Invalid BindSourceAdapter (nil).');
  // Set the Map of the BaseObject of the ActiveBindSourceAdapter
  FMap := TioMapContainer.GetMap(AActiveBindSourceAdpter.GetBaseObjectClassName);
  //  Set the BindSourceAdapter
  FBindSourceAdapter := AActiveBindSourceAdpter;
  // Register itself (the DataSet) into the DataSetLinkContainer of the BindSourceAdapter
  //  NB: DataSetLink is used to propagate the operation (insert, post,
  //       delete, next etc.) from the BindSourceAdapter to all datasets linked
  //       to BSA itself).
  FBindSourceAdapter.GetDataSetLinkContainer.RegisterDataSet(Self);
end;

// Calc the record index for all possibles situations
function TioBSADataSet.GetRecordIdx: Integer;
var
  LBookmarkFlag: TBookmarkFlag;
begin
  // Get the current record index
  Result := PInteger(ActiveBuffer)^;
  // Get the bookmark flag for current record
  LBookmarkFlag := GetBookmarkFlag(ActiveBuffer);
  // Increments the index in some specific cases.
  //  (If we are in an insert operation it adds one to all of the subsequent records
  //   indices to what has just been inserted)
  //  NB: Not for append
  // -------------------------------------------
  if  (State = dsInsert)
  // ... when a new record is inserted (not appended) the relative BookmarkFlag is set to bfInserted
  and (LBookmarkFlag <> TBookmarkFlag.bfInserted)
  // ... when a new record is appended (not inserted) the relative BookmarkFlag is set to bfEOF
  and (LBookmarkFlag <> TBookmarkFlag.bfEOF)
  // ... when a new record is inserted (not appended) only records after the inserted record
  //      must be incremented by one (the index is contained in the ActiveBuffer)
  and (Result >= FBindSourceAdapter.ItemIndex)
  // ... when a new record is inserted/appended in empty DataSet then BOF and EOF properties is both setted to True
  and not (BOF and EOF)
  then
    Inc(Result);
  // -------------------------------------------
end;

function TioBSADataSet.GetFieldData(Field: TField; var Buffer: TValueBuffer; NativeFormat: Boolean): Boolean;
var
  LValue: TValue;
  LRecordIndex: Integer;
  LObj: TObject;
  LProperty: IioContextProperty;
  LDateTime: TDateTime;
  LDateTimeRec: TDateTimeRec;
  // Return true if the record is inserted/appended
  function IsInsertingRecord: Boolean;
  var
    LBookmarkFlag: TBookmarkFlag;
  begin
    // Get the bookmark flag for current record
    LBookmarkFlag := GetBookmarkFlag(ActiveBuffer);
    Result := (State = dsInsert)
      and ((LBookmarkFlag = TBookmarkFlag.bfInserted) or (LBookmarkFlag = TBookmarkFlag.bfEOF));
  end;
begin
  Result := False;
  // If empty then exit
//  if (FBindSourceAdapter.ItemCount = 0) or IsInsertingRecord then
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Get the current record index (corrected by the situations)
  LRecordIndex := GetRecordIdx;
  Result := (LRecordIndex >= -1) and (LRecordIndex <= FBindSourceAdapter.ItemCount - 1);
  if not Result then
    Exit;
  // Get Property, Object, Value
  LProperty := FMap.GetProperties.GetPropertyByName(Field.FieldName);
  LObj := FBindSourceAdapter.Items[LRecordIndex];
  LValue := LProperty.GetValue(LObj);
  // ---------- DATA FROM THE OBJECTS ----------
  // Move the value to the buffer
  case Field.DataType of
    // Integer
    TFieldType.ftInteger:   TBitConverter.UnsafeFrom<Integer>(LValue.AsType<Integer>, Buffer);
    TFieldType.ftAutoInc:   TBitConverter.UnsafeFrom<Integer>(LValue.AsType<Integer>, Buffer);
    TFieldType.ftShortint:  TBitConverter.UnsafeFrom<ShortInt>(LValue.AsType<ShortInt>, Buffer);
    TFieldType.ftByte:      TBitConverter.UnsafeFrom<Byte>(LValue.AsType<Byte>, Buffer);
    TFieldType.ftSmallint:  TBitConverter.UnsafeFrom<SmallInt>(LValue.AsType<SmallInt>, Buffer);
    TFieldType.ftLargeint:  TBitConverter.UnsafeFrom<Largeint>(LValue.AsType<Largeint>, Buffer);
    TFieldType.ftWord:      TBitConverter.UnsafeFrom<Word>(LValue.AsType<Word>, Buffer);
    TFieldType.ftLongWord:  TBitConverter.UnsafeFrom<LongWord>(LValue.AsType<LongWord>, Buffer);
    // Float
    TFieldType.ftFloat:     TBitConverter.UnsafeFrom<Double>(LValue.AsType<Double>, Buffer);
    TFieldType.ftCurrency:  TBitConverter.UnsafeFrom<Double>(LValue.AsType<Double>, Buffer);
    TFieldType.ftBCD:       TBitConverter.UnsafeFrom<Currency>(LValue.AsType<Currency>, Buffer);
    TFieldType.ftFMTBcd:    TBitConverter.UnsafeFrom<TBCD>(LValue.AsType<TBCD>, Buffer);
    TFieldType.ftSingle:    TBitConverter.UnsafeFrom<Single>(LValue.AsType<Single>, Buffer);
    TFieldType.ftExtended:  TBitConverter.UnsafeFrom<Extended>(LValue.AsType<Extended>, Buffer);
    // Boolean
    TFieldType.ftBoolean:   TBitConverter.From<WordBool>(LValue.AsType<WordBool>, Buffer);
    // Date & Time
    TFieldType.ftDateTime, TFieldType.ftDate, TFieldType.ftTime:
    begin
      LDateTime := LValue.AsType<TDateTime>;
      Result := (LDateTime > 0);
      if Result then
      begin
        LDateTimeRec.DateTime := LDateTime;
        TBitConverter.UnsafeFrom<TDateTimeRec>(LDateTimeRec, Buffer);
      end;
    end;
    TFieldType.ftTimeStamp:
    begin
      LDateTime := LValue.AsType<TDateTime>;
      Result := (LDateTime > 0);
      if Result then
      begin
          SetLength(Buffer, SizeOf(TSQLTimeStamp));
          TBitConverter.From<TSQLTimeStamp>(
            TSqlTimeStampUtils.DateTimeToSqlTimeStamp(LDateTime), Buffer);
      end;
    end;
    // AnsiString + GUID
    TFieldType.ftString, TFieldType.ftFixedChar, TFieldType.ftGuid:
    begin
      FillChar(Buffer[0], Field.DataSize, 0);  // Clean the buffer (previous record value presents)
      StrLCopy(PAnsiChar(Buffer), PAnsiChar(AnsiString(LValue.AsString)), Field.Size);
//      StrCopy(pAnsiChar(Buffer), pAnsiChar(AnsiString(LValue.AsString)));
    end;
    // WideString/Unicode
    TFieldType.ftWideString, TFieldType.ftFixedWideChar:
    begin
      FillChar(Buffer[0], Field.DataSize, 0);  // Clean the buffer (previous record value presents)
      StrLCopy(PChar(Buffer), PChar(LValue.AsString), Field.Size);
//      TEncoding.Unicode.GetBytes(LValue.AsString, 1, LValue.AsString.Length, Buffer, 0);
    end;
  end;
end;

procedure TioBSADataSet.InternalLoadCurrentRecord(Buffer: TRecordBuffer);
var
  LBookmarkFlag: TBookmarkFlag;
begin
  // Put the current record index in the record buffer
  PInteger(Buffer)^ := fCurrentRecord;
  with PioRecInfo(Buffer + FRecordSize)^ do
  begin
    BookmarkFlag := bfCurrent;
    Bookmark := fCurrentRecord;
  end;
end;

procedure TioBSADataSet.InternalPost;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
    FBindSourceAdapter.Post;
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

procedure TioBSADataSet.InternalPreOpen;
begin
  // The buffer of the record contains the index of the current
  //  record/object on the BindSourceAdapter
  FRecordSize := SizeOf(Integer); // Integer size (4 or 8?)
end;

function TioBSADataSet.InternalRecordCount: Integer;
begin
  // Get the RecordCount from the linked BindSourceAdapter
  Result := FBindSourceAdapter.ItemCount;
end;

procedure TioBSADataSet.RestoreBeforeEditValues;
var
  LObj: TObject;
begin
  // Get the current object
  LObj := FBindSourceAdapter.Current;
  // restore object status
  om.FromJSON(FBeforeEditValues).TypeAnnotationsON.&To(LObj);
end;

{ TSqlTimeStampUtils }

class function TSqlTimeStampUtils.DateTimeToSqlTimeStamp(
  const ADateTime:TDateTime): TSqlTimeStamp;
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

class function TSqlTimeStampUtils.SqlTimeStampToTValue(
  const ASqlTimeStamp:TSqlTimeStamp): TValue;
var
  LDateTime: TDateTime;
begin
  LDateTime := EncodeDateTime(ASqlTimeStamp.Year, ASqlTimeStamp.Month,
    ASqlTimeStamp.Day, ASqlTimeStamp.Hour, ASqlTimeStamp.Minute,
    ASqlTimeStamp.Second, ASqlTimeStamp.Fractions);
  Result := TValue.From<TDateTime>(LDateTime);
end;

{ TioAbstractMemoryStream }

constructor TioAbstractBlobStream.Create(const AField: TBlobField;
  const AMode: TBlobStreamMode);
begin
  inherited Create;
  FIsReadingBlobData := False;
  FModified := False;
  FField := AField;
  FDataset := (AField.DataSet as TioBSADataSet);
  if AMode <> TBlobStreamMode.bmRead then
  begin
    if AField.ReadOnly or not AField.DataSet.CanModify then
      DatabaseErrorFmt(SFieldReadOnly, [AField.DisplayName], AField.DataSet);
    if not (AField.DataSet.State in [dsEdit, dsInsert, dsNewValue]) then
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
  //  imposta il flag MOdified = True, ho aggiunto il flag IsreadingBlobData
  //  perchè altrimenti nel caso dei BLOB grafici (o cmq non i Memo) durante
  //  il caricaemtneo dello stream veniva eseguito anche questo metodo e quindi
  //  si ritrovava in un loop infinito.
  FModified := not FIsReadingBlobData;
end;

function TioAbstractBlobStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result := inherited Write(Buffer, Count);
  // Se non siamo in fase di lettura dei dati del blob allora
  //  imposta il flag MOdified = True, ho aggiunto il flag IsreadingBlobData
  //  perchè altrimenti nel caso dei BLOB grafici (o cmq non i Memo) durante
  //  il caricaemtneo dello stream veniva eseguito anche questo metodo e quindi
  //  si ritrovava in un loop infinito.
  FModified := not FIsReadingBlobData;
end;

{ TioWideMemoBlobStream }

constructor TioWideMemoBlobStream.Create(const AField: TWideMemoField;
  const AMode: TBlobStreamMode);
begin
  inherited Create(AField, AMode);
end;

procedure TioWideMemoBlobStream.ReadBlobData;
var
  LRecordIndex: Integer;
  LProperty: IioContextProperty;
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
    LObj := FDataset.InternalActiveAdapter.Items[LRecordIndex];
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
  LProperty: IioContextProperty;
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
  LObj := FDataset.InternalActiveAdapter.Items[LRecordIndex];
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

constructor TioStreamableObjBlobStream.Create(const AField: TBlobField;
  const AMode: TBlobStreamMode);
begin
  inherited Create(AField, AMode);
end;

procedure TioStreamableObjBlobStream.ReadBlobData;
var
  LRecordIndex: Integer;
  LProperty: IioContextProperty;
  LCurrRecObj, LStreamableObj: TObject;
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
begin
  FIsReadingBlobData := True;
  try
    // Get the current record index (corrected by the situations)
    LRecordIndex := FDataset.GetRecordIdx;
    // Get Property, Object, Value (Value as StremableObj instance)
    LProperty := FDataset.Map.GetProperties.GetPropertyByName(FField.FieldName);
    LCurrRecObj := FDataset.InternalActiveAdapter.Items[LRecordIndex];
    // At this point the property refer to a blob field (and to an Object) type then
    //  check if the Object is assigned and if it isn't clear
    //  the parameter
    LStreamableObj := LProperty.GetValueAsObject(LCurrRecObj);
    if Assigned(LStreamableObj) then
    begin
      // Wrap the object into a DuckTypedStreamObject
      ADuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(LStreamableObj);
      // If the wrapped object IsEmpty then clear the BlobDataStream also
      //  else load data from the object to the stream
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
  LProperty: IioContextProperty;
  LCurrRecObj, LStreamableObj: TObject;
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
begin
  // Get the current record index (corrected by the situations)
  LRecordIndex := FDataset.GetRecordIdx;
  // Get Property, Object, Value (Value as StremableObj instance)
  LProperty := FDataset.Map.GetProperties.GetPropertyByName(FField.FieldName);
  LCurrRecObj := FDataset.InternalActiveAdapter.Items[LRecordIndex];
  // At this point the property refer to a blob field (and to an Object) type then
  //  check if the Object is assigned and if it isn't clear
  //  the parameter
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

end.
