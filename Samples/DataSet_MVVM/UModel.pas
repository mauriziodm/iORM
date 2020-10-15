unit UModel;

interface

uses
  System.Classes, Vcl.Graphics, System.Generics.Collections, Data.FmtBcd,
  iORM.Attributes;

type

  [ioEntity]
  TModelDetail = class
  private
    FID: Integer;
    FAttivo: boolean;
    FDescrizione: String;
    FMasterID: Integer;
  public
    property ID: Integer read FID write FID;
    property MasterID: Integer read FMasterID write FMasterID;
    property Descrizione: String read FDescrizione write FDescrizione;
    property Attivo: boolean read FAttivo write FAttivo;
  end;

  [ioEntity]
  TModelMaster = class
  private
    FPropWideMemo: TStrings;
    FPropBitMap: TBitMap;
    FID: Integer;
    FDescrizione: String;
    FDetails: TObjectList<TModelDetail>;
    FPropShortint: Shortint;
    FPropSmallint: SmallInt;
    FPropUInt64: UInt64;
    FPropInt64: Int64;
    FPropLongint: Longint;
    FPropLongWord: LongWord;
    FPropWord: Word;
    FPropByte: Byte;
    FPropCardinal: Cardinal;
    FPropExtended: Extended;
    FPropFloat: Double;
    FPropSingle: Single;
    FPropBCD: TBCD;
    FPropCurrency: Currency;
    FPropTime: TTime;
    FPropDateTime: TDateTime;
    FPropDate: TDate;
    FPropWideString: WideString;
    FPropBoolean: boolean;
  public
    constructor Create;
    destructor Destroy; override;

    // Blob
    property PropBitMap:TBitMap read FPropBitMap write FPropBitMap;
    property PropWideMemo:TStrings read FPropWideMemo write FPropWideMemo;

    // Integers
    property ID: Integer read FID write FID;
    property PropByte:Byte read FPropByte write FPropByte;
    property PropShortint:Shortint read FPropShortint write FPropShortint;
    property PropSmallint:SmallInt read FPropSmallint write FPropSmallint;
    property PropWord:Word read FPropWord write FPropWord;
    property PropCardinal:Cardinal read FPropCardinal write FPropCardinal;
    property PropLongint:Longint read FPropLongint write FPropLongint;
    property PropLongWord:LongWord read FPropLongWord write FPropLongWord;
    property PropInt64:Int64 read FPropInt64 write FPropInt64;
    property PropUInt64:UInt64 read FPropUInt64 write FPropUInt64;

    // Floats
    property PropFloat:Double read FPropFloat write FPropFloat;
    property PropCurrency:Currency read FPropCurrency write FPropCurrency;
//    property PropBCD:TBCD read FPropBCD write FPropBCD;
    property PropSingle:Single read FPropSingle write FPropSingle;
    property PropExtended:Extended read FPropExtended write FPropExtended;

    // Date & Time
    property PropDateTime:TDateTime read FPropDateTime write FPropDateTime;
    property PropDate:TDate read FPropDate write FPropDate;
    property PropTime:TTime read FPropTime write FPropTime;

    // String & Char
    property Descrizione: String read FDescrizione write FDescrizione;
    property PropWideString: WideString read FPropWideString write FPropWideString;

    // Boolean
    property PropBoolean: boolean read FPropBoolean write FPropBoolean;

    [ioHasMany(TModelDetail, 'MasterID')]
    property Details: TObjectList<TModelDetail> read FDetails; // write FDetails;
  end;

implementation

{ TModelMaster }

constructor TModelMaster.Create;
begin
  inherited;
  FDetails := TObjectList<TModelDetail>.Create;
  FPropWideMemo := TStringList.Create;
  FPropBitMap := TBitMap.Create;
end;

destructor TModelMaster.Destroy;
begin
  FDetails.Free;
  FPropWideMemo.Free;
  FPropBitMap.Free;
  inherited;
end;

end.
