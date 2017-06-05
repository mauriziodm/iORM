unit U.SampleData;

interface

type

  TSampleData = class
  public
    class procedure CheckForSampleData;
    class procedure CreateSampleData;
  end;

implementation

uses
  Model.Interfaces, iORM, System.Generics.Collections, FireDAC.Comp.Client,
  Model.Material, Model.Process;

{ TSampleData }

class procedure TSampleData.CheckForSampleData;
var
  LMemTable: TFDMemTable;
begin
  LMemTable := io.SQL('select count(*) from [TMaterial]').ToMemTable;
  try
    if LMemTable.Fields[0].AsInteger = 0 then
      CreateSampleData;
  finally
    LMemTable.Free;
  end;
end;

class procedure TSampleData.CreateSampleData;
var
  LList: TList<IBase>;
begin
  LList := TList<IBase>.Create;
  try
    // Materials
    LList.Add(   TMaterial.Create('MTR001', 'Bullone 13', 'Pz', 1.25)   );
    LList.Add(   TMaterial.Create('MTR002', 'Vite senza fine fi10mm 33mm', 'Pz', 3.50)   );
    LList.Add(   TMaterial.Create('MTR003', 'Barra acciaio cromato fi10mm', 'ML', 10.50)   );
    LList.Add(   TMaterial.Create('MTR004', 'Blocco alluminio 10x10mm', 'Pz', 6.73)   );
    LList.Add(   TMaterial.Create('MTR005', 'Boccola teflon RF345', 'Pz', 2.50)   );
    // Processes
    LList.Add(   TProcess.Create('PCS001', 'Brasatura', 'Nr', 5.00, 7)   );
    LList.Add(   TProcess.Create('PCS002', 'Saldatura semiasse 12345', 'Nr', 12.50, 12)   );
    LList.Add(   TProcess.Create('PCS003', 'Assemblaggio semiasse 12345', 'Nr', 18.35, 25)   );
    // Persist
    io.PersistCollection(LList);
  finally
    LList.Free;
  end;
end;

end.
