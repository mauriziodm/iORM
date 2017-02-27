unit iORM.MVVM.Components.ModelDataset;

interface

uses
  Data.DB, iORM.DuckTyped.Interfaces, System.Classes;

type

  PRecInfo = ^TRecInfo;
  TRecInfo = packed record
    Bookmark: Integer;
    BookmarkFlag: TBookmarkFlag;
  end;

  TObjListDataSet = class(TDataSet)
  private
    FRecBufSize: Integer;
    FRecInfoOfs: Integer;
    FCurRec: Integer;
    FLastBookmark: Integer;
    FCollection: IioDuckTypedList;
    FCollectionCount: Integer;
  protected
    function AllocRecordBuffer: TRecordBuffer; override;
    procedure FreeRecordBuffer(var Buffer: TRecordBuffer); override;
    procedure GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    function GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag; override;
    function GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
    function GetRecordSize: Word; override;
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
    procedure InternalClose; override;
    procedure InternalCancel; override;
    procedure InternalDelete; override;
    procedure InternalFirst; override;
    procedure InternalGotoBookmark(Bookmark: Pointer); override;
    procedure InternalHandleException; override;
    procedure InternalInitFieldDefs; override;
    procedure InternalInitRecord(Buffer: TRecordBuffer); override;
    procedure InternalLast; override;
    procedure InternalOpen; override;
    procedure InternalPost; override;
    procedure InternalSetToRecord(Buffer: TRecordBuffer); override;
    function IsCursorOpen: Boolean; override;
    procedure SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag); override;
    procedure SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
  public
    property Collection: IioDuckTypedList read FCollection write FCollection;
  published
  end;

  TCollectionDataSet = class(TDataSet)
  private
    FRecBufSize: Integer;
    FRecInfoOfs: Integer;
    FCurRec: Integer;
    FFileName: string;
    FLastBookmark: Integer;
    FCollection: TCollection;
    FCollectionCount: Integer;
    procedure SetCollection(const Value: TCollection);
  protected
    function AllocRecordBuffer: TRecordBuffer; override;
    procedure FreeRecordBuffer(var Buffer: TRecordBuffer); override;
    procedure GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    function GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag; override;
    function GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
    function GetRecordSize: Word; override;
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
    procedure InternalClose; override;
    procedure InternalCancel; override;
    procedure InternalDelete; override;
    procedure InternalFirst; override;
    procedure InternalGotoBookmark(Bookmark: Pointer); override;
    procedure InternalHandleException; override;
    procedure InternalInitFieldDefs; override;
    procedure InternalInitRecord(Buffer: TRecordBuffer); override;
    procedure InternalLast; override;
    procedure InternalOpen; override;
    procedure InternalPost; override;
    procedure InternalSetToRecord(Buffer: TRecordBuffer); override;
    function IsCursorOpen: Boolean; override;
    procedure SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag); override;
    procedure SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    function GetRecordCount: Integer; override;
    function GetRecNo: Integer; override;
    procedure SetRecNo(Value: Integer); override;
  public
    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
    property Collection: TCollection read FCollection write SetCollection;
  published
    property FileName: string read FFileName write FFileName;
    property Active;
    property AutoCalcFields;
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
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
  end;

implementation

uses Windows, SysUtils, System.TypInfo, iORM;

{ TCollectionDataSet }

procedure TCollectionDataSet.InternalOpen;

begin
  if Collection = nil then
    raise EDatabaseError.Create('Collection is niet gevult !');

  FCurRec := -1;

  FCollectionCount := Collection.Count;
  FLastBookmark := Collection.Count;
  FRecInfoOfs := SizeOf(Integer);

  FRecBufSize := SizeOf(TRecInfo) + FRecInfoOfs;
  BookmarkSize := SizeOf(Integer);

  InternalInitFieldDefs;

  if DefaultFields then
    CreateFields;

  BindFields(True);
end;

procedure TCollectionDataSet.InternalClose;
begin

  if DefaultFields then
    DestroyFields;
  FLastBookmark := 0;
  FCurRec := -1;
end;

function TCollectionDataSet.IsCursorOpen: Boolean;
begin
  Result := Assigned(collection);
end;

procedure TCollectionDataSet.InternalInitFieldDefs;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i: integer;
begin
  FieldDefs.Clear;
  if Collection = nil then
    raise EInvalidPointer.create('Collection is nil');
  ClassTypeInfo := Collection.ItemClass.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  // Error trap
  try
    // Vul de prop list
    GetPropList(Collection.ItemClass.ClassInfo, tkAny, PropList);
    for i := 0 to PropCount do
    begin
      try
        case PropList[i]^.PropType^.Kind of
          tkString, tkLString,
            tkWString, tkWChar,
            tkChar:
            begin
              FieldDefs.Add(PropList[i]^.Name, ftString, 255, False);
            end;

          tkInteger,
            tkEnumeration:
            begin
              FieldDefs.Add(PropList[i]^.Name, ftInteger, 0, False);
            end;
          tkFloat:
            begin
              FieldDefs.Add(PropList[i]^.Name, ftFloat, 0, False);
            end;
          tkClass:
            begin
            end;
          tkArray:
            begin
            end;
        end; // end case
      except
        on e: Exception do

      end;

    end;
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;

end;

procedure TCollectionDataSet.InternalHandleException;
begin
//  Application.HandleException(Self);
end;

procedure TCollectionDataSet.InternalGotoBookmark(Bookmark: Pointer);
var
  Index: Integer;
begin
  Index := PInteger(Bookmark)^ - 1;
  if Index > -1 then
    FCurRec := Index
  else
    DatabaseError('Bookmark not found');
end;

procedure TCollectionDataSet.InternalSetToRecord(Buffer: TRecordBuffer);
begin
  InternalGotoBookmark(@PRecInfo(Buffer + FRecInfoOfs).Bookmark);
end;

function TCollectionDataSet.GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag;
begin
  Result := PRecInfo(Buffer + FRecInfoOfs).BookmarkFlag;
end;

procedure TCollectionDataSet.SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag);
begin
  PRecInfo(Buffer + FRecInfoOfs).BookmarkFlag := Value;
end;

procedure TCollectionDataSet.GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  PInteger(Data)^ := PRecInfo(Buffer + FRecInfoOfs).Bookmark;
end;

procedure TCollectionDataSet.SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  PRecInfo(Buffer + FRecInfoOfs).Bookmark := PInteger(Data)^;
end;

function TCollectionDataSet.GetRecordSize: Word;
begin
  Result := SizeOf(Integer); //MaxStrLen;
end;

function TCollectionDataSet.AllocRecordBuffer: TRecordBuffer;
begin
  GetMem(Result, FRecBufSize);
end;

procedure TCollectionDataSet.FreeRecordBuffer(var Buffer: TRecordBuffer);
begin
  FreeMem(Buffer, FRecBufSize);
end;

function TCollectionDataSet.GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode;
  DoCheck: Boolean): TGetResult;
begin
  if Collection.Count < 1 then
    Result := grEOF
  else
  begin
    Result := grOK;
    case GetMode of
      gmNext:
        if FCurRec >= RecordCount - 1 then
          Result := grEOF
        else
          Inc(FCurRec);
      gmPrior:
        if FCurRec <= 0 then
          Result := grBOF
        else
          Dec(FCurRec);
      gmCurrent:
        if (FCurRec < 0) or (FCurRec >= RecordCount) then
          Result := grError;
    end;
    if Result = grOK then
    begin
      PInteger(Buffer)^ := Integer(FCollection.Items[FCurRec]);
      with PRecInfo(Buffer + FRecInfoOfs)^ do
      begin
        BookmarkFlag := bfCurrent;
        Bookmark := FCurRec + 1;
      end;
    end
    else if (Result = grError) and DoCheck then
      DatabaseError('No Records');
  end;
end;

procedure TCollectionDataSet.InternalInitRecord(Buffer: TRecordBuffer);
begin
  PInteger(Buffer)^ := Integer(FCollection.Add);
end;

function TCollectionDataSet.GetFieldData(Field: TField; Buffer: Pointer): Boolean;

var
  Apropinfo: PPropinfo;
  AString: string;
  AInteger: Integer;
  AFloat: Double;
  AItem: TCollectionItem;
begin
  Result := False;
  if Collection.Count = 0 then
    exit;
  AItem := TCollectionItem(PInteger(ActiveBuffer)^);
  Apropinfo := System.TypInfo.GetPropInfo(AItem, Field.FullName);
  case Apropinfo.PropType^.Kind of
    tkString, tkLString,
      tkWString, tkWChar,
      tkChar:
      begin
        AString := GetStrProp(AItem, Apropinfo);
        StrLCopy(Buffer, PChar(AString), Length(AString));
        Result := PChar(Buffer)^ <> #0;
      end;

    tkInteger,
      tkEnumeration:
      begin
        AInteger := GetOrdProp(AItem, Apropinfo);
        PInteger(Buffer)^ := AInteger;
        Result := true;
      end;
    tkFloat:
      begin
        AFloat := GetFloatProp(AItem, Apropinfo);
        PDouble(Buffer)^ := AFloat;
        Result := true;
      end;
  end; // end case
end;

procedure TCollectionDataSet.SetFieldData(Field: TField; Buffer: Pointer);
var
  Apropinfo: PPropinfo;
  AString: string;
  AInteger: Integer;
  AFloat: Double;
  AItem: TCollectionItem;
begin
  AItem := TCollectionItem(PInteger(ActiveBuffer)^);
  Apropinfo := System.TypInfo.GetPropInfo(AItem, Field.FullName);
  case Apropinfo.PropType^.Kind of
    tkString, tkLString,
      tkWString, tkWChar,
      tkChar:
      begin
        AString := PChar(Buffer);
        SetStrProp(AItem, Apropinfo, AString);
      end;

    tkInteger,
      tkEnumeration:
      begin
        AInteger := 0;
        if Buffer <> nil then
          AInteger := PInteger(Buffer)^;
        SetOrdProp(AItem, Apropinfo, AInteger);
      end;
    tkFloat:
      begin

        AFloat := 0;
        if Buffer <> nil then
          AFloat := PDouble(Buffer)^;
        SetFloatProp(AItem, Apropinfo, AFloat);
      end;
  end; // end case

  DataEvent(deFieldChange, Longint(Field));
end;

procedure TCollectionDataSet.InternalFirst;
begin
  FCurRec := -1;
end;

procedure TCollectionDataSet.InternalLast;
begin
  FCurRec := FCollectionCount;
end;

procedure TCollectionDataSet.InternalPost;
begin
  if State = dsinsert then
  begin
    Inc(FCollectionCount);
    Inc(FLastBookmark);
    if FCurRec <> -1 then
      TCollectionItem(PInteger(ActiveBuffer)^).Index := FCurRec;
  end;

end;

procedure TCollectionDataSet.InternalAddRecord(Buffer: Pointer; Append: Boolean);
begin
  Inc(FLastBookmark);
  if Append then
    InternalLast;
  Inc(FCollectionCount);

end;

procedure TCollectionDataSet.InternalDelete;
begin
  Collection.Delete(FCurRec);
  Dec(FCollectionCount);
  if FCurRec >= Collection.Count then
    Dec(FCurRec);
end;

function TCollectionDataSet.GetRecordCount: Longint;
begin
  Result := FCollectionCount;
end;

function TCollectionDataSet.GetRecNo: Longint;
begin
  UpdateCursorPos;
  if (FCurRec <= -1) and (RecordCount > 0) then
    Result := 0
  else
    Result := FCurRec + 1;
end;

procedure TCollectionDataSet.SetRecNo(Value: Integer);
begin
  if (Value >= 0) and (Value < FCollectionCount) then
  begin
    FCurRec := Value - 1;
    Resync([]);
  end;
end;

procedure TCollectionDataSet.SetCollection(const Value: TCollection);
begin
  FCollection := Value;
end;

procedure TCollectionDataSet.InternalCancel;
begin
  Collection.Delete(Collection.Count - 1);
end;

{ TObjListDataSet }

function TObjListDataSet.AllocRecordBuffer: TRecordBuffer;
begin
  GetMem(Result, FRecBufSize);
end;

procedure TObjListDataSet.FreeRecordBuffer(var Buffer: TRecordBuffer);
begin
  FreeMem(Buffer, FRecBufSize);
end;

procedure TObjListDataSet.GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  inherited;
  PInteger(Data)^ := PRecInfo(Buffer + FRecInfoOfs).Bookmark;
end;

function TObjListDataSet.GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag;
begin
  Result := PRecInfo(Buffer + FRecInfoOfs).BookmarkFlag;
end;

function TObjListDataSet.GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode;
  DoCheck: Boolean): TGetResult;
begin
  if Collection.Count < 1 then
    Result := TGetResult.grEOF
  else
  begin
    Result := TGetResult.grOK;
    case GetMode of
      TGetMode.gmNext:
        if FCurRec >= RecordCount - 1 then
          Result := TGetResult.grEOF
        else
          Inc(FCurRec);
      TGetMode.gmPrior:
        if FCurRec <= 0 then
          Result := TGetResult.grBOF
        else
          Dec(FCurRec);
      TGetMode.gmCurrent:
        if (FCurRec < 0) or (FCurRec >= RecordCount) then
          Result := TGetResult.grError;
    end;
    if Result = TGetResult.grOK then
    begin
//      PInteger(Buffer)^ := Integer(FCollection.Items[FCurRec]);
      PInteger(Buffer)^ := Integer(FCollection.GetItem(FCurRec));
      with PRecInfo(Buffer + FRecInfoOfs)^ do
      begin
        BookmarkFlag := bfCurrent;
        Bookmark := FCurRec + 1;
      end;
    end
    else if (Result = grError) and DoCheck then
      DatabaseError('No Records');
  end;
end;

function TObjListDataSet.GetRecordSize: Word;
begin
  Result := SizeOf(Integer); //MaxStrLen;
end;

procedure TObjListDataSet.InternalAddRecord(Buffer: Pointer; Append: Boolean);
begin
  Inc(FLastBookmark);
  if Append then
    InternalLast;
  Inc(FCollectionCount);
end;

procedure TObjListDataSet.InternalCancel;
begin
  Collection.Delete(Collection.Count - 1);
end;

procedure TObjListDataSet.InternalClose;
begin
  if DefaultFields then
    DestroyFields;
  FLastBookmark := 0;
  FCurRec := -1;
end;

procedure TObjListDataSet.InternalDelete;
begin
  Collection.Delete(FCurRec);
  Dec(FCollectionCount);
  if FCurRec >= Collection.Count then
    Dec(FCurRec);
end;

procedure TObjListDataSet.InternalFirst;
begin
  FCurRec := -1;
end;

procedure TObjListDataSet.InternalGotoBookmark(Bookmark: Pointer);
var
  Index: Integer;
begin
  Index := PInteger(Bookmark)^ - 1;
  if Index > -1 then
    FCurRec := Index
  else
    DatabaseError('Bookmark not found');
end;

procedure TObjListDataSet.InternalHandleException;
begin
  io.HandleException(Self);
end;

procedure TObjListDataSet.InternalInitFieldDefs;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i: integer;
begin
  FieldDefs.Clear;
  if Collection = nil then
    raise EInvalidPointer.create('Collection is nil');
  FieldDefs.Clear;
  if Collection = nil then
    raise EInvalidPointer.create('Collection is nil');
  ClassTypeInfo := Collection.GetItemTypeInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  // Error trap
  try
    // Vul de prop list
    GetPropList(ClassTypeInfo, tkAny, PropList);
    for i := 0 to PropCount do
    begin
      try
        case PropList[i]^.PropType^.Kind of
          tkString, tkLString,
            tkWString, tkWChar,
            tkChar:
            begin
              FieldDefs.Add(PropList[i]^.Name, ftString, 255, False);
            end;
          tkInteger,
            tkEnumeration:
            begin
              FieldDefs.Add(PropList[i]^.Name, ftInteger, 0, False);
            end;
          tkFloat:
            begin
              FieldDefs.Add(PropList[i]^.Name, ftFloat, 0, False);
            end;
          tkClass:
            begin
            end;
          tkArray:
            begin
            end;
        end; // end case
      except
        on e: Exception do
      end;
    end;
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;

procedure TObjListDataSet.InternalInitRecord(Buffer: TRecordBuffer);
begin
  FillChar(Buffer^, FRecBufSize, 0);
end;

procedure TObjListDataSet.InternalLast;
begin
  FCurRec := FCollectionCount;
end;

procedure TObjListDataSet.InternalOpen;
begin
  if Collection = nil then
    raise EDatabaseError.Create('Collection is niet gevult !');

  FCurRec := -1;

  FCollectionCount := Collection.Count;
  FLastBookmark := Collection.Count;
  FRecInfoOfs := SizeOf(Integer);

  FRecBufSize := SizeOf(TRecInfo) + FRecInfoOfs;
  BookmarkSize := SizeOf(Integer);

  InternalInitFieldDefs;

  if DefaultFields then
    CreateFields;

  BindFields(True);
end;

procedure TObjListDataSet.InternalPost;
begin
//  if State = dsinsert then
//  begin
//    Inc(FCollectionCount);
//    Inc(FLastBookmark);
//    if FCurRec <> -1 then
//      TCollectionItem(PInteger(ActiveBuffer)^).Index := FCurRec;
//  end;
end;

procedure TObjListDataSet.InternalSetToRecord(Buffer: TRecordBuffer);
begin
  InternalGotoBookmark(@PRecInfo(Buffer + FRecInfoOfs).Bookmark);
end;

function TObjListDataSet.IsCursorOpen: Boolean;
begin
  Result := Assigned(collection);
end;

procedure TObjListDataSet.SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  PRecInfo(Buffer + FRecInfoOfs).Bookmark := PInteger(Data)^;
end;

procedure TObjListDataSet.SetBookmarkFlag(Buffer: TRecordBuffer;
  Value: TBookmarkFlag);
begin
  PRecInfo(Buffer + FRecInfoOfs).BookmarkFlag := Value;
end;

end.
