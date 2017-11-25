unit SampleData;

interface

type

  TSampleData = class
  public
    class procedure CheckForSampleDataCreation;
    class procedure CreateSampleData;
  end;

implementation

uses
  Model, iORM, System.Generics.Collections, FMX.Dialogs, System.UITypes,
  FireDAC.Comp.Client;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
var
  LMemTable: TFDMemTable;
begin
  LMemTable := io.SQL('select count(*) from [TPerson]').ToMemTable;
  try
    if LMemTable.Fields[0].AsInteger = 0 then
      Self.CreateSampleData;
  finally
    LMemTable.Free;
  end;
end;

class procedure TSampleData.CreateSampleData;
var
  NewPerson: TPerson;
begin
  // TPerson
  NewPerson := TPerson.Create('Maurizio', 'Del Magno');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0541/112233', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '329/11223344', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Office', '0541/234687', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TPerson.Create('Andrea', 'Costa');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0541/445566', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '329/11255355', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TPerson.Create('Luca', 'Coccia');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0541/734573457', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '345/12662346', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Office', '0541/1112223', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TCustomer
  NewPerson := TCustomer.Create('Mario', 'Rossi', 'FC0001');
  io.Persist(NewPerson);

  NewPerson := TCustomer.Create('Giuseppe', 'Verdi', 'FC0002');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/9234763764', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/993356567', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TCustomer.Create('Francesco', 'Baracca', 'FC0003');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/4235552', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/23523555', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TVipCustomer
  NewPerson := TVipCustomer.Create('Omar', 'Bossoni', 'FC0004', 'VipCard0001');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/2432348', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/6345457', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TVipCustomer.Create('Thomas', 'Ranzetti', 'FC0005', 'VipCard0002');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/34563456', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/1346476', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TVipCustomer.Create('Paolo', 'Filippini', 'FC0006', 'VipCard0003');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0721/423424624', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '340/423462346', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TEmployee
  NewPerson := TEmployee.Create('Daniele', 'Teti', 'Roma');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/12363466', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/2342529879', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TEmployee.Create('Daniele', 'Daqua', 'Roma');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/998867653', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/838768723', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := TEmployee.Create('Fabrizio', 'Bitti', 'Dubai');
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/4634734', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/2323555', NewPerson.ID)   );
  io.Persist(NewPerson);
end;

end.
