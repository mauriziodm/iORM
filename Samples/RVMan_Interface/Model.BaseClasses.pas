unit Model.BaseClasses;

interface

uses
  Rtti, iORM.Attributes, iORM.CommonTypes, Model.BaseClasses.Interfaces;

type

  // Classe base
  TBaseClass = class(TInterfacedObject, IBaseClass)
  strict private
    FID: Integer;
    FDescrizione: String;
  strict protected
    FRefCount: Integer;
    function GetID: Integer;
    procedure SetID(Value: Integer);
    function GetDescrizione: String;
    procedure SetDescrizione(Value: String);
    function GetListViewItem_Caption: String; virtual;
    function GetListViewItem_DetailText: String; virtual;
    function GetListViewItem_GroupHeader: String; virtual;
    procedure AddDetailText(var AText:String; Value, Sep: String);
  public
    constructor Create(AID:Integer; ADescrizione:String); overload;
    property ID: Integer read GetID write SetID;
    property Descrizione: String read GetDescrizione write SetDescrizione;
    [ioSkip]
    property ListViewItem_Caption: String read GetListViewItem_Caption;
    [ioSkip]
    property ListViewItem_DetailText: String read GetListViewItem_DetailText;
    [ioSkip]
    property ListViewItem_GroupHeader: String read GetListViewItem_GroupHeader;
  end;

implementation

uses
  System.SysUtils;

{ TBaseClass }

procedure TBaseClass.AddDetailText(var AText: String; Value, Sep: String);
begin
  if AText <> '' then AText := AText + Sep;
  AText := AText + Value;
end;

constructor TBaseClass.Create(AID: Integer; ADescrizione: String);
begin
  inherited Create;
  ID := AID;
  Descrizione := ADescrizione;
end;

function TBaseClass.GetDescrizione: String;
begin
  Result := FDescrizione;
end;

function TBaseClass.GetID: Integer;
begin
  Result := FID;
end;

function TBaseClass.GetListViewItem_Caption: String;
begin
  Result := Self.Descrizione;
end;

function TBaseClass.GetListViewItem_DetailText: String;
begin
  Result := 'Detail';
end;

function TBaseClass.GetListViewItem_GroupHeader: String;
begin
  Result := 'Group header';
end;

procedure TBaseClass.SetDescrizione(Value: String);
begin
  if Value <> FDescrizione then
  begin
    FDescrizione := Value;
  end;
end;

procedure TBaseClass.SetID(Value: Integer);
begin
  if Value <> FID then
  begin
    FID := Value;
  end;
end;

end.
