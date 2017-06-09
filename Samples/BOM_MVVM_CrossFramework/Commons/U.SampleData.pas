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
  Model.Material, Model.Process, Model.Product, Model.BOMItems;

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
  LProduct: IProduct;
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
    LList.Add(   TProcess.Create('PCS003', 'Assemblaggio asse 12345', 'Nr', 18.35, 25)   );
    // Persist
    io.PersistCollection(LList);
  finally
    LList.Free;
  end;
    // Products
    LProduct := TProduct.Create('PDT001', 'Semiasse posteriore', 'Pz');
    LProduct.BOMItems.Add(   TBOMItemMaterial.Create(io.Load<IMaterial>._Where._PropertyEqualsTo('Code', 'MTR002').ToObject, 2)   );
    LProduct.BOMItems.Add(   TBOMItemMaterial.Create(io.Load<IMaterial>._Where._PropertyEqualsTo('Code', 'MTR005').ToObject, 3)   );
    LProduct.BOMItems.Add(   TBOMItemProcess.Create(io.Load<IProcess>._Where._PropertyEqualsTo('Code', 'PCS001').ToObject, 1)   );
//    LList.Add(LProduct);
    io.Persist(LProduct);
    LProduct := TProduct.Create('PDT002', 'Asse posteriore completo', 'Pz');
//    LProduct.BOMItems.Add(   TBOMItemProduct.Create(io.Load<IProduct>._Where._PropertyEqualsTo('Code', 'PDT001').ToObject, 2)   );
    LProduct.BOMItems.Add(   TBOMItemProduct.Create(io.Load<IProduct>.ByOID(9).ToObject, 2)   );
    LProduct.BOMItems.Add(   TBOMItemMaterial.Create(io.Load<IMaterial>._Where._PropertyEqualsTo('Code', 'MTR004').ToObject, 1)   );
    LProduct.BOMItems.Add(   TBOMItemProcess.Create(io.Load<IProcess>._Where._PropertyEqualsTo('Code', 'PCS003').ToObject, 1)   );
//    LList.Add(LProduct);
    io.Persist(LProduct);
    LProduct := TProduct.Create('PDT003', 'Gruppo asse/sosp. posteriore', 'Pz');
//    LProduct.BOMItems.Add(   TBOMItemProduct.Create(io.Load<IProduct>._Where._PropertyEqualsTo('Code', 'PDT002').ToObject, 2)   );
    LProduct.BOMItems.Add(   TBOMItemProduct.Create(io.Load<IProduct>.ByOID(10).ToObject, 2)   );
    LProduct.BOMItems.Add(   TBOMItemMaterial.Create(io.Load<IMaterial>._Where._PropertyEqualsTo('Code', 'MTR001').ToObject, 5)   );
    LProduct.BOMItems.Add(   TBOMItemMaterial.Create(io.Load<IMaterial>._Where._PropertyEqualsTo('Code', 'MTR003').ToObject, 1)   );
    LProduct.BOMItems.Add(   TBOMItemProcess.Create(io.Load<IProcess>._Where._PropertyEqualsTo('Code', 'PCS002').ToObject, 1)   );
//    LList.Add(LProduct);
    io.Persist(LProduct);
end;

end.
