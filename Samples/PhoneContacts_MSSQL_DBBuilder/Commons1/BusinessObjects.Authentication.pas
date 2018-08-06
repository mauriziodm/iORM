unit BusinessObjects.Authentication;

interface

uses
  iORM,
  iORM.Attributes,
{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  System.Generics.Collections,
  System.Classes,
  BusinessObjects.Base,
  BusinessObjects.Authentication.Interfaces,
  iORM.Containers.Interfaces,
  iORM.CommonTypes,
  iORM.LazyLoad.Generics.List;

type

  [ioEntity('Domains'), ioTrueClass, diImplements(IDomain)]
  TDomain = class(TBaseBo, IDomain)
  private
    FCode: string;
    FDescription: string;
    function GetCode: string;
    function GetDescription: string;
    procedure SetCode(const Value: string);
    procedure SetDescription(const Value: string);
  public
    constructor Create(const ACode: string; const ADescription: string);
    [ioVarchar(10,True,False)]
    property Code: string read GetCode write SetCode;
    [ioVarchar(200,True,False)]
    property Description: string read GetDescription write SetDescription;
  end;

  [ioEntity('Groups'), ioTrueClass, diImplements(IGroup)]
  TGroup = class(TBaseBo, IGroup)
  private
    FCode: string;
    FDescription: string;
    function GetCode: string;
    function GetDescription: string;
    procedure SetCode(const Value: string);
    procedure SetDescription(const Value: string);
  public
    constructor Create(const ACode: string; const ADescription: string);
    [ioVarchar(10,True,False)]
    property Code: string read GetCode write SetCode;
    [ioVarchar(250,True,False)]
    property Description: string read GetDescription write SetDescription;
  end;

  [ioEntity('Users'), ioTrueClass, diImplements(IUser)]
  TUser = class(TBaseBo, IUser)
  private
    FUserName: string;
    FUserPassword: string;
    FDescription: string;
    FEnabled: boolean;
    FExpirationDate: TDateTime;
    FDomain: IDomain;
    FGroup: IGroup;
    function GetDescription: string;
    function GetDomain: IDomain;
    function GetEnabled: boolean;
    function GetExpirationDate: TDateTime;
    function GetUserName: string;
    function GetUserPassword: string;
    function GetGroup: IGroup;
    procedure SetDescription(const Value: string);
    procedure SetDomain(const Value: IDomain);
    procedure SetEnabled(const Value: boolean);
    procedure SetExpirationDate(const Value: TDateTime);
    procedure SetUserName(const Value: string);
    procedure SetUserPassword(const Value: string);
    procedure SetGroup(const Value: IGroup);
  public
    constructor Create;
    [ioVarchar(50,False,True)]
    property UserName: string read GetUserName write SetUserName;
    [ioVarchar(50,False,True)]
    property UserPassword: string read GetUserPassword write SetUserPassword;
    [ioVarchar(50,False,True)]
    property Description: string read GetDescription write SetDescription;
    [ioInteger(1,False)]
    property Enabled: boolean read GetEnabled write SetEnabled;
    [ioDateTime(False)]
    property ExpirationDate: TDateTime read GetExpirationDate write SetExpirationDate;
    [ioInteger(10,False)]
    [ioBelongsTo('IDomain')]
    property Domain: IDomain read GetDomain write SetDomain;
    [ioInteger(10,False)]
    [ioBelongsTo('IGroup')]
    property Group: IGroup read GetGroup write SetGroup;
  end;

implementation

{ TDomain }

constructor TDomain.Create(const ACode, ADescription: string);
begin
  FCode := ACode;
  FDescription := ADescription;
end;

function TDomain.GetCode: string;
begin
  Result := FCode;
end;

function TDomain.GetDescription: string;
begin
  Result := FDescription;
end;

procedure TDomain.SetCode(const Value: string);
begin
  FCode := Value;
end;

procedure TDomain.SetDescription(const Value: string);
begin
  FDescription  := Value;
end;

{ TGroup }

constructor TGroup.Create(const ACode, ADescription: string);
begin
  FCode := ACode;
  FDescription := ADescription;
end;

function TGroup.GetCode: string;
begin
  Result := FCode;
end;

function TGroup.GetDescription: string;
begin
  Result := FDescription;
end;

procedure TGroup.SetCode(const Value: string);
begin
  FCode := Value;
end;

procedure TGroup.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

{ TUser }

constructor TUser.Create;
begin
  FGroup := io.di.Locate<IGroup>.Get;
  FDomain := io.di.Locate<IDomain>.Get;
end;

function TUser.GetDescription: string;
begin
  Result := FDescription;
end;

function TUser.GetDomain: IDomain;
begin
  Result := FDomain;
end;

function TUser.GetEnabled: boolean;
begin
  Result := FEnabled;
end;

function TUser.GetExpirationDate: TDateTime;
begin
  Result := FExpirationDate;
end;

function TUser.GetGroup: IGroup;
begin
  Result := FGroup;
end;

function TUser.GetUserName: string;
begin
  Result := FUserName;
end;

function TUser.GetUserPassword: string;
begin
  Result := FUserPassword;
end;

procedure TUser.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TUser.SetDomain(const Value: IDomain);
begin
  FDomain := Value;
end;

procedure TUser.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
end;

procedure TUser.SetExpirationDate(const Value: TDateTime);
begin
  FExpirationDate := Value;
end;

procedure TUser.SetGroup(const Value: IGroup);
begin
  FGroup := Value;
end;

procedure TUser.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TUser.SetUserPassword(const Value: string);
begin
  FUserPassword := Value;
end;

end.
