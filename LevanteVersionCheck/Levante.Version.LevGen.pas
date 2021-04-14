unit Levante.Version.LevGen;

interface

uses Levante.Version.InterfacesAndFactory;

type

  TLevDBVersionCheck_LevGen_IBO = class(TInterfacedObject, ILevDBVersionCheck)
  private
    function DBVerPresent: Boolean;
  public
    function GetDBVer: Integer;
    function UpdateDBVer(const ANewVersion: Integer): boolean;
  end;

implementation

uses
  IB_Components, DataModule1, SysUtils, main;

{ TLevDBVersionCheck_LevGen }

function TLevDBVersionCheck_LevGen_IBO.DBVerPresent: Boolean;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('SELECT 1 FROM RDB$RELATION_FIELDS WHERE RDB$RELATION_NAME = ''PARAMETRI'' AND RDB$FIELD_NAME = ''DBVER''');
    Qry.Open;
    result := not Qry.Eof;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

function TLevDBVersionCheck_LevGen_IBO.GetDBVer: Integer;
var
  Qry: TIB_Cursor;
begin
  if not DBVerPresent then
    Exit(0);
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('SELECT DBVER FROM PARAMETRI WHERE RECORDID = 1');
    Qry.Open;
    if Qry.Eof then
      result := 0
    else
      result := Qry.Fields[0].AsInteger;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

function TLevDBVersionCheck_LevGen_IBO.UpdateDBVer(const ANewVersion: Integer): boolean;
var
  Qry: TIB_Cursor;
begin
  result := False;
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('UPDATE PARAMETRI SET DBVER = ' + IntToStr(ANewVersion) + ' WHERE RECORDID = 1');
    Qry.ExecSQL;
    result := True;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

end.
