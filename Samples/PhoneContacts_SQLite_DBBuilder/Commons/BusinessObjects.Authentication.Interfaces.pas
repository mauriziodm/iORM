unit BusinessObjects.Authentication.Interfaces;

interface

uses

{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  iORM.Containers.Interfaces,
  iORM.CommonTypes;

type

  IDomain = interface
    ['{1559566D-A867-4536-A0C0-E65539C71310}']
    function GetCode: string;
    function GetDescription: string;
    procedure SetCode(const Value: string);
    procedure SetDescription(const Value: string);
    property Code: string read GetCode write SetCode;
    property Description: string read GetDescription write SetDescription;
  end;

  IGroup = interface
    ['{D99DAF73-4E2C-495E-9013-8CA68EB4201D}']
    function GetCode: string;
    function GetDescription: string;
    procedure SetCode(const Value: string);
    procedure SetDescription(const Value: string);
    property Code: string read GetCode write SetCode;
    property Description: string read GetDescription write SetDescription;
  end;

  IUser = interface
    ['{D084E2C5-3591-46BD-A864-528A519E32AD}']
    function GetDescription: string;
    function GetDomain: IDomain;
    function GetEnabled: boolean;
    function GetExpirationDate: TDateTime;
    function GetGroup: IGroup;
    function GetUserName: string;
    function GetUserPassword: string;
    procedure SetDescription(const Value: string);
    procedure SetDomain(const Value: IDomain);
    procedure SetEnabled(const Value: boolean);
    procedure SetExpirationDate(const Value: TDateTime);
    procedure SetGroup(const Value: IGroup);
    procedure SetUserName(const Value: string);
    procedure SetUserPassword(const Value: string);
    property UserName: string read GetUserName write SetUserName;
    property UserPassword: string read GetUserPassword write SetUserPassword;
    property Description: string read GetDescription write SetDescription;
    property Enabled: boolean read GetEnabled write SetEnabled;
    property ExpirationDate: TDateTime read GetExpirationDate write SetExpirationDate;
    property Domain: IDomain read GetDomain write SetDomain;
    property Group: IGroup read GetGroup write SetGroup;
  end;

implementation

end.
