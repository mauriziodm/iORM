unit iORM.DB.Components.DataSet.Base;

interface

uses
  Data.DB, iORM.LiveBindings.Interfaces, Data.Bind.ObjectScope,
  iORM.Context.Map.Interfaces;

type

  TMdRecInfo = record
    Bookmark: Longint;
    BookmarkFlag: TBookmarkFlag;
  end;
  PMdRecInfo = ^TMdRecInfo;

  TMdCustomDataSet = class(TDataSet)
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

  TMdListDataSet = class (TMdCustomDataSet)
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
    procedure InternalCancel; override;
    procedure InternalEdit; override;
    procedure SetFieldData(Field: TField; Buffer: TValueBuffer); override;
    function GetCanModify: Boolean; override;
    procedure DoAfterScroll; override;
  public
    function GetFieldData(Field: TField; var Buffer: TValueBuffer): Boolean; override;
    property InternalAdapter: TBindSourceAdapter read GetInternalAdapter;  // Must be ReadOnly
  end;


implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Context.Properties.Interfaces,
  System.Rtti, iORM.Context.Container;

/////////////////////////////////////////////////
////// Part I:
////// Initialization, opening, and closing
/////////////////////////////////////////////////

// I: open the dataset
procedure TMdCustomDataSet.InternalOpen;
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
  FRecordBufferSize := FRecordSize + sizeof (TMdRecInfo);
  BookmarkSize := sizeOf (Integer);

  // everything OK: table is now open
  FIsTableOpen := True;
end;

procedure TMdCustomDataSet.InternalClose;
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
function TMdCustomDataSet.IsCursorOpen: Boolean;
begin
  Result := FIsTableOpen;
end;

////////////////////////////////////////
////// Part II:
////// Bookmarks management and movement
////////////////////////////////////////

// II: set the requested bookmark as current record
procedure TMdCustomDataSet.InternalGotoBookmark (Bookmark: Pointer);
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
procedure TMdCustomDataSet.InternalSetToRecord (Buffer: TRecordBuffer);
var
  ReqBookmark: Integer;
begin
  ReqBookmark := PMdRecInfo(Buffer + FRecordSize).Bookmark;
  InternalGotoBookmark (@ReqBookmark);
end;

// II: retrieve bookmarks flags from buffer
function TMdCustomDataSet.GetBookmarkFlag (
  Buffer: TRecordBuffer): TBookmarkFlag;
begin
  Result := PMdRecInfo(Buffer + FRecordSize).BookmarkFlag;
end;

// II: change the bookmark flags in the buffer
procedure TMdCustomDataSet.SetBookmarkFlag (Buffer: TRecordBuffer;
  Value: TBookmarkFlag);
begin
  PMdRecInfo(Buffer + FRecordSize).BookmarkFlag := Value;
end;

// II: Go to a special position before the first record
procedure TMdCustomDataSet.InternalFirst;
begin
  FCurrentRecord := BofCrack;
end;

// II: Go to a special position after the last record
procedure TMdCustomDataSet.InternalLast;
begin
  EofCrack := InternalRecordCount;
  FCurrentRecord := EofCrack;
end;

// II: read the bookmark data from record buffer
procedure TMdCustomDataSet.GetBookmarkData (
  Buffer: TRecordBuffer; Data: Pointer);
begin
  Integer(Data^) :=
    PMdRecInfo(Buffer + FRecordSize).Bookmark;
end;

// II: set the bookmark data in the buffer
procedure TMdCustomDataSet.SetBookmarkData (
  Buffer: TRecordBuffer; Data: Pointer);
begin
  PMdRecInfo(Buffer + FRecordSize).Bookmark :=
    Integer(Data^);
end;

// II (optional): Record count
function TMdCustomDataSet.GetRecordCount: Longint;
begin
  CheckActive;
  Result := InternalRecordCount;
end;

// II (optional): Get the number of the current record
function TMdCustomDataSet.GetRecNo: Longint;
begin
  UpdateCursorPos;
  if FCurrentRecord < 0 then
    Result := 1
  else
    Result := FCurrentRecord + 1;
end;

// II (optional): Move to the given record number
procedure TMdCustomDataSet.SetRecNo(Value: Integer);
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
function TMdCustomDataSet.GetRecord(Buffer: TRecordBuffer;
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
procedure TMdCustomDataSet.InternalInitRecord(Buffer: TRecordBuffer);
begin
  FillChar(Buffer^, FRecordBufferSize, 0);
end;

// III: Free the buffer
procedure TMdCustomDataSet.FreeRecordBuffer (var Buffer: TRecordBuffer);
begin
  FreeMem (Buffer);
end;

/// III: Determine the size of each record buffer in memory
function TMdCustomDataSet.GetRecordSize: Word;
begin
  Result := FRecordSize; // data only
end;

/// III: Allocate a buffer for the record
function TMdCustomDataSet.AllocRecordBuffer: TRecordBuffer;
begin
  GetMem (Result, FRecordBufferSize);
end;

// III: Delete the current record
procedure TMdCustomDataSet.InternalDelete;
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalDelete', 'Operation not supported');
end;

// default exception handling

procedure TMdCustomDataSet.InternalHandleException;
begin
  // special purpose exception handling
  // do nothing
end;

procedure TMdCustomDataSet.InternalAddRecord(Buffer: TRecBuf;
  Append: Boolean);
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalAddRecord', 'Operation not supported');
end;

procedure TMdCustomDataSet.InternalPost;
begin
  // not supported in this generic version
  raise EioException.Create(Self.ClassName, 'InternalPost', 'Operation not supported');
end;

procedure TMdCustomDataSet.InternalAfterOpen;
begin
  // nothing to do: subclasses can hook in here
end;

procedure TMdCustomDataSet.InternalPreOpen;
begin
  // nothing to do: subclasses can hook in here
end;

{ TMdListDataSet }

procedure TMdListDataSet.DoAfterScroll;
begin
  inherited;
  FBindSourceAdapter.ItemIndex := Self.RecNo - 1;
end;

function TMdListDataSet.GetCanModify: Boolean;
begin
  Result := True; // read-write
end;

function TMdListDataSet.GetInternalAdapter: TBindSourceAdapter;
begin
  if Assigned(FBindSourceAdapter) then
    Result := FBindSourceAdapter as TBindSourceAdapter
  else
    Result := nil;
end;

procedure TMdListDataSet.InternalCancel;
begin
  FBindSourceAdapter.Cancel;
end;

procedure TMdListDataSet.InternalEdit;
begin
  FBindSourceAdapter.Edit;
end;

// -----------------------------------------------------------------------------
procedure TMdListDataSet.InternalInitFieldDefs;
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
// -----------------------------------------------------------------------------

procedure TMdListDataSet.SetFieldData(Field: TField; Buffer: TValueBuffer);
var
  LValue: TValue;
  LProperty: IioContextProperty;
  IntValue: Integer;
  StrValue: String;
begin
  // If empty then exit
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Move the buffer to the value
  case Field.DataType of
    // Integer
    TFieldType.ftInteger, TFieldType.ftSmallint, TFieldType.ftWord,
    TFieldType.ftByte, TFieldType.ftAutoInc, TFieldType.ftLargeint,
    TFieldType.ftLongWord, TFieldType.ftShortint:
    begin
      Move (Buffer[0], IntValue, sizeof (Integer));
      LValue := IntValue;
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

procedure TMdListDataSet.SetInternalAdapter(
  const AActiveBindSourceAdpter: IioActiveBindSourceAdapter);
begin
  if not Assigned(AActiveBindSourceAdpter) then
    raise EioException.Create(Self.ClassName, 'SetInternalAdapter', 'Invalid BindSourceAdapter (nil).');
  // Set the Map of the BaseObject of the ActiveBindSourceAdapter
  FMap := TioMapContainer.GetMap(AActiveBindSourceAdpter.GetBaseObjectClassName);
  //  Set the BindSourceAdapter
  FBindSourceAdapter := AActiveBindSourceAdpter;
end;

function TMdListDataSet.GetFieldData(Field: TField; var Buffer: TValueBuffer): Boolean;
var
  LValue: TValue;
  LRecordIndex: Integer;
  LObj: TObject;
  LProperty: IioContextProperty;
begin
  Result := False;
  // If empty then exit
  if FBindSourceAdapter.ItemCount = 0 then
    Exit;
  // Get the current record index
  LRecordIndex := PInteger(ActiveBuffer)^;
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
    TFieldType.ftInteger, TFieldType.ftSmallint, TFieldType.ftWord,
    TFieldType.ftByte, TFieldType.ftAutoInc, TFieldType.ftLargeint,
    TFieldType.ftFixedChar, TFieldType.ftFixedWideChar, TFieldType.ftLongWord,
    TFieldType.ftShortint:
      LValue.ExtractRawData(Buffer);
    // Float
    ftFloat, TFieldType.ftCurrency, ftBCD, TFieldType.ftDate, TFieldType.ftTime, TFieldType.ftDateTime, ftTimeStamp, ftExtended:
      LValue.ExtractRawData(Buffer);
    // AnsiString
    TFieldType.ftString:
    begin
      FillChar(Buffer[0], Field.DataSize, 0);  // Clean the buffer (previous record value presents)
      StrCopy(pAnsiChar(Buffer), pAnsiChar(AnsiString(LValue.AsString)));
    end;
    // WideString/Unicode
    ftWideString:
    begin
      FillChar(Buffer[0], Field.DataSize, 0);  // Clean the buffer (previous record value presents)
      TEncoding.Unicode.GetBytes(LValue.AsString, 1, LValue.AsString.Length, Buffer, 0);
    end;
  end;
  // Set the result
  Result := True;
end;

procedure TMdListDataSet.InternalLoadCurrentRecord(Buffer: TRecordBuffer);
begin
  // Put the current record index in the record buffer
  PInteger(Buffer)^ := fCurrentRecord;
  with PMdRecInfo(Buffer + FRecordSize)^ do
  begin
    BookmarkFlag := bfCurrent;
    Bookmark := fCurrentRecord;
  end;
end;

procedure TMdListDataSet.InternalPost;
begin
  FBindSourceAdapter.Post;
end;

procedure TMdListDataSet.InternalPreOpen;
begin
  FRecordSize := SizeOf(Integer); // Integer suze (4 or 8?)
end;

function TMdListDataSet.InternalRecordCount: Integer;
begin
  Result := FBindSourceAdapter.ItemCount;
end;

end.
