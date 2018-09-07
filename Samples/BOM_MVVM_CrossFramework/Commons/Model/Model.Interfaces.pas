unit Model.Interfaces;

interface

uses
  iORM.Containers.Interfaces, System.Generics.Collections;

type

  IBOMItem = interface
    ['{222570A6-EC4A-4BE4-8A51-102171125DAA}']
    function GetCost: Currency;
    function GetTime: Integer;
    function GetMaterialCost: Currency;
    function GetProcessCost: Currency;
  end;

  IBase = interface
    ['{C70DD2BA-C158-415A-9453-36B6B3B4976B}']
    // ID
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    property ID:Integer read GetID write SetID;
    // Code
    procedure SetCode(const AValue:String);
    function GetCode: String;
    property Code:String read GetCode write SetCode;
    // Description
    procedure SetDescription(const AValue:String);
    function GetDescription: String;
    property Description:String read GetDescription write SetDescription;
    // UM
    procedure SetUM(const AValue:String);
    function GetUM: String;
    property UM:String read GetUM write SetUM;
    // CreationDateTime
    function GetCreationDateTime: TDateTime;
    property CreationDateTime:TDateTime read GetCreationDateTime;
    // ArticleType
    function GetArticleType: String;
    property ArticleType:String read GetArticleType;
  end;

  IMaterial = interface(IBase)
    ['{26D0420B-21A6-4B8D-BC73-42A380A59E2D}']
    // Cost
    procedure SetCost(const AValue:Currency);
    function GetCost: Currency;
    property Cost:Currency read GetCost write SetCost;
  end;

  IProcess = interface(IBase)
    ['{B41D23A0-2735-4335-A59C-FB6A6F1616D2}']
    // Cost
    procedure SetCost(const AValue:Currency);
    function GetCost: Currency;
    property Cost:Currency read GetCost write SetCost;
    // Time (minute)
    procedure SetTime(const AValue:Integer);
    function GetTime: Integer;
    property Time:Integer read GetTime write SetTime;
  end;

  IProduct = interface(IBase)
    ['{F63D8A6A-74CF-4E23-AE90-CC55FA0B36D6}']
    // BOMItems
    function GetBOMItems: IioList<IBOMItem>;
    property BOMItems:IioList<IBOMItem> read GetBOMItems;
    // Cost
    function GetCost: Currency;
    property Cost:Currency read GetCost;
    // Time (minute)
    function GetTime: Integer;
    property Time:Integer read GetTime;
    // MaterialCost
    function GetMaterialCost: Currency;
    property MaterialCost:Currency read GetMaterialCost;
    // MaterialCost
    function GetProcessCost: Currency;
    property ProcessCost:Currency read GetProcessCost;
  end;

implementation

end.
