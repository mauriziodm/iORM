unit iORM.LiveBindings.CommonBSAPaging.PageManager.HardPaging;

interface

type

  TNPMHardPaging = class
  private
    FSqlLimit: Integer;
    FSqlLimitOffset: Integer;
    function GetSqlLimit: Integer;
    function GetSqlLimiOffset: Integer;
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset, AHigherLoadedRecNo: Integer);
    property SqlLimit: Integer read GetSqlLimit;
    property SqlLimitOffset: Integer read GetSqlLimiOffset;
  end;

implementation

uses
  iORM.Exceptions;

{ TNPMHardPaging }

function TNPMHardPaging.GetSqlLimiOffset: Integer;
begin
  Result := FSqlLimitOffset;
end;

function TNPMHardPaging.GetSqlLimit: Integer;
begin
  Result := FSqlLimit;
end;

procedure TNPMHardPaging.CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset, AHigherLoadedRecNo: Integer);
begin
  if ADestPage < 1 then
    raise EioException.Create(ClassName, 'CalcSqlLimit', 'Error Message');

end;

end.
