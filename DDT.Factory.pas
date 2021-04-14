unit DDT.Factory;

interface

uses
  DDT.Interfaces, System.Classes;

type

  TddtFactory = class
  private
    class function BuildDocTypeItemLDE(const ADocTypeName, ACaption, ADBDocTypeName: string; const ASelected: boolean): IddtDocTypeItem;
    class function BuildDocTypes: IddtDynamicDocTypes;
    class procedure FillDocTypeNameListLDE(const AStrings: TStrings);
  public
    class procedure LDEDocTypesInit;
    class function LDEDocTypes: IddtDynamicDocTypes;
  end;

implementation

uses
  System.SysUtils, System.StrUtils, DataModule1, DDT.DynamicDocTypes, DDT.DocTypeItem, DDT.MenuAddLink.LDE, DDT.FilterLink.LDE, DDT.WhereGenerator.LDE;

var
  LDE_Instance: IddtDynamicDocTypes;

{ TddtFactory }

class function TddtFactory.BuildDocTypeItemLDE(const ADocTypeName, ACaption, ADBDocTypeName: string; const ASelected: boolean): IddtDocTypeItem;
begin
  Result := TddtDocTypeItem.Create(
    TddtMenuAddLinkLDE.Create(ADocTypeName, ACaption),
    TddtFilterLinkLDE.Create(ACaption, ASelected),
    TddtWhereGeneratorLDE.Create(ADBDocTypeName)
  );
end;

class function TddtFactory.BuildDocTypes: IddtDynamicDocTypes;
begin
  Result := TddtDynamicDocTypes.Create;
end;

class procedure TddtFactory.FillDocTypeNameListLDE(const AStrings: TStrings);
var
  LSearchRec: TSearchRec;
  LDocTypeName: String;
  function ExtractDocumentTypeLDE(const AFileName: String): String;
  var
    LSeparatorPos: Integer;
  begin
    LSeparatorPos := Pos('_', AFileName);
    if LSeparatorPos = 0 then
      raise Exception.Create('TddtFactory: Separator not found in the PageModel file name "' + AFileName + '"');
    Result := LeftStr(AFileName, LSeparatorPos-1);
  end;
begin
  if FindFirst(DM1.LDE_PageModelsDir + '*.*', faArchive, LSearchRec) = 0 then
  begin
    try
      repeat
        LDocTypeName := ExtractDocumentTypeLDE(LSearchRec.Name);
        if AStrings.IndexOf(LDocTypeName) = -1 then
          AStrings.Add(LDocTypeName);
      until FindNext(LSearchRec) <> 0;
    finally
      FindClose(LSearchRec);
    end;
  end;
end;

class procedure TddtFactory.LDEDocTypesInit;
var
  LStrings: TStringList;
  LDocTypeName: String;
  LDocTypeItem: IddtDocTypeItem;
begin
  if Assigned(LDE_Instance) then
    LDE_Instance := nil; // Distrugge eventuali istanze precedenti
  LDE_Instance := BuildDocTypes;
  LStrings := TStringList.Create;
  try
    LStrings.Sorted := True;
    FillDocTypeNameListLDE(LStrings);
    for LDocTypeName in LStrings do
    begin
      LDocTypeItem := BuildDocTypeItemLDE(LDocTypeName, LDocTypeName, LDocTypeName, False);
      LDE_Instance.AddDocTypeItem(LDocTypeItem);
    end;
  finally
    LStrings.Free;
  end;
end;

class function TddtFactory.LDEDocTypes: IddtDynamicDocTypes;
begin
  Result := LDE_Instance;
end;

end.
