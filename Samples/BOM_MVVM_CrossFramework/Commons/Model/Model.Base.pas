unit Model.Base;

interface

uses
  Model.Interfaces, iORM.Attributes;

type

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IBase)]
  TBase = class(TInterfacedObject, IBase)
  private
    FID: Integer;
    FCode: String;
    FDescription: String;
    FUM: String;
    FCreationDateTime: TDateTime;
  protected
    // ID
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    // Code
    procedure SetCode(const AValue:String);
    function GetCode: String;
    // Description
    procedure SetDescription(const AValue:String);
    function GetDescription: String;
    // UM
    procedure SetUM(const AValue:String);
    function GetUM: String;
    // CreationDateTime
    procedure SetCreationDateTime(const AValue: TDateTime);
    function GetCreationDateTime: TDateTime;
    // ArticleType
    function GetArticleType: String;
  public
    constructor Create;overload; virtual;
    constructor Create(const ACode, ADescription, UM: String); overload;
    property ID:Integer read GetID write SetID;
    property Code:String read GetCode write SetCode;
    property Description:String read GetDescription write SetDescription;
    property UM:String read GetUM write SetUM;
    property CreationDateTime:TDateTime read GetCreationDateTime write SetCreationDateTime;
    [ioSkip]
    property ArticleType:String read GetArticleType;
  end;

implementation

uses
  System.SysUtils;

{ TBase }

constructor TBase.Create;
begin
  inherited;
  FCreationDateTime := Now;
end;

constructor TBase.Create(const ACode, ADescription, UM: String);
begin
  Create;
  FCode := ACode;
  FDescription := ADescription;
  FUM := FUM;
end;

function TBase.GetArticleType: String;
begin
  Result := Self.ClassName;
end;

function TBase.GetCode: String;
begin
  Result := FCode;
end;

function TBase.GetCreationDateTime: TDateTime;
begin
  Result := FCreationDateTime;
end;

function TBase.GetDescription: String;
begin
  Result := FDescription;
end;

function TBase.GetID: Integer;
begin
  Result := FID;
end;

function TBase.GetUM: String;
begin
  Result := FUM;
end;

procedure TBase.SetCode(const AValue: String);
begin
  FCode := AValue;
end;

procedure TBase.SetCreationDateTime(const AValue: TDateTime);
begin
  FCreationDateTime := AValue;
end;

procedure TBase.SetDescription(const AValue: String);
begin
  FDescription := AValue;
end;

procedure TBase.SetID(const AValue: Integer);
begin
  FID := AValue;
end;

procedure TBase.SetUM(const AValue: String);
begin
  FUM := AValue;
end;

end.
