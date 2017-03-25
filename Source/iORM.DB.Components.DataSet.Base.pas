unit iORM.DB.Components.DataSet.Base;

interface

uses
  Data.DB, iORM.LiveBindings.Interfaces, Data.Bind.ObjectScope,
  iORM.Context.Map.Interfaces;

type

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
  public
    function GetFieldData(Field: TField; var Buffer: TValueBuffer; NativeFormat: Boolean): Boolean; override;
    property InternalAdapter: TBindSourceAdapter read GetInternalAdapter;  // Must be ReadOnly
  end;


implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Context.Properties.Interfaces,
  System.Rtti, iORM.Context.Container, System.Types, Data.FmtBcd,
  Data.SqlTimSt, System.DateUtils;

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

procedure TioBSADataSet.InternalCancel;
begin
  // Propagate the operation to the linked BindSourceAdapter
  FBindSourceAdapter.GetDataSetLinkContainer.Disable;
  try
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
  finally
    FBindSourceAdapter.GetDataSetLinkContainer.Enable;
  end;
end;

// -----------------------------------------------------------------------------

procedure TioBSADataSet.SetFieldData(Field: TField; Buffer: TValueBuffer);
var
  LValue: TValue;
  LProperty: IioContextProperty;
  LDateTime: TDateTime;
  LDateTimeRec: TDateTimeRec;
  LTempValueBuffer: TValueBuffer;
begin
  // If empty then exit
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Move the buffer to the value
  case Field.DataType of
    // Integer
    TFieldType.ftInteger:   LValue := TBitConverter.InTo<Integer>(Buffer);
    TFieldType.ftAutoInc:   LValue := TBitConverter.InTo<Integer>(Buffer);
    TFieldType.ftShortint:  LValue := TBitConverter.InTo<ShortInt>(Buffer);
    TFieldType.ftByte:      LValue := TBitConverter.InTo<Byte>(Buffer);
    TFieldType.ftSmallint:  LValue := TBitConverter.InTo<SmallInt>(Buffer);
    TFieldType.ftLargeint:  LValue := TBitConverter.InTo<Largeint>(Buffer);
    TFieldType.ftWord:      LValue := TBitConverter.InTo<Word>(Buffer);
    TFieldType.ftLongWord:  LValue := TBitConverter.InTo<LongWord>(Buffer);
    // Float
    TFieldType.ftFloat:     LValue := TBitConverter.InTo<Double>(Buffer);
    TFieldType.ftCurrency:  LValue := TBitConverter.InTo<Double>(Buffer);
    TFieldType.ftBCD:       LValue := TBitConverter.InTo<Currency>(Buffer);
    TFieldType.ftFMTBcd:    LValue := TValue.From<TBCD>(   TBitConverter.InTo<TBCD>(Buffer)   );
    TFieldType.ftSingle:    LValue := TBitConverter.InTo<Single>(Buffer);
    TFieldType.ftExtended:  LValue := TBitConverter.InTo<Extended>(Buffer);
    // Boolean
    TFieldType.ftBoolean:   LValue := TBitConverter.InTo<WordBool>(Buffer);
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
    // AnsiString
    TFieldType.ftString:
      LValue := PChar(TEncoding.ANSI.GetString(Buffer));
    // WideString/Unicode
    TFieldType.ftWideString:
      LValue := pchar(Buffer);
//      LValue := TEncoding.Unicode.GetString(Buffer);
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
  // Calc the record index for all possibles situations
  function GetRecordIdx: Integer;
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
begin
  Result := False;
  // If empty then exit
  if (FBindSourceAdapter.ItemCount = 0) or IsInsertingRecord then
    Exit;
  // Get the current record index (corrected by the situations)
  LRecordIndex := GetRecordIdx;
  Result := (LRecordIndex >= -1) and (LRecordIndex <= FBindSourceAdapter.ItemCount - 1);
  if not Result then
    Exit;
  // ---------- DATA FROM THE BINDSOURCEADAPTER ----------
  // Get the value
//  FBindSourceAdapter.ItemIndex := LRecordIndex;
//  LValue := FBindSourceAdapter.FindField(Field.FieldName).GetTValue;
  // ---------- DATA FROM THE BINDSOURCEADAPTER ----------
  // ---------- DATA FROM THE OBJECTS ----------
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
    // AnsiString
    TFieldType.ftString:
    begin
      FillChar(Buffer[0], Field.DataSize, 0);  // Clean the buffer (previous record value presents)
      StrCopy(pAnsiChar(Buffer), pAnsiChar(AnsiString(LValue.AsString)));
    end;
    // WideString/Unicode
    TFieldType.ftWideString:
    begin
      FillChar(Buffer[0], Field.DataSize, 0);  // Clean the buffer (previous record value presents)
      TEncoding.Unicode.GetBytes(LValue.AsString, 1, LValue.AsString.Length, Buffer, 0);
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

end.
