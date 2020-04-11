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
  Model, iORM, System.Generics.Collections, System.UITypes,
  AnotherModel, Interfaces, FireDAC.Comp.Client;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
var
  LMemTable: TFDMemTable;
begin
  // Check if the DB is empty
  LMemTable := io.SQL('select count(*) from [TPerson] union all select count(*) from [TAnotherPerson]').ToMemTable;
  try
    if LMemTable.Fields[0].AsInteger = 0 then
      Self.CreateSampleData;
  finally
    LMemTable.Free;
  end;
end;

class procedure TSampleData.CreateSampleData;
var
  NewPerson: IPerson;
begin
  // TPerson
  NewPerson := io.Create<IPerson>(['Maurizio','Del Magno',0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '0541/112233', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '329/11223344', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Office', '0541/234687', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IPerson>(['Andrea','Costa',0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '0541/445566', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '329/11255355', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IPerson>(['Luca','Coccia',0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '0541/734573457', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '345/12662346', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Office', '0541/1112223', NewPerson.ID])   );
  io.Persist(NewPerson);


  // TCustomer
  NewPerson := io.Create<ICustomer>(['Mario', 'Rossi', 'FC0001', 0]);
  io.Persist(NewPerson);

  NewPerson := io.Create<ICustomer>(['Giuseppe', 'Verdi', 'FC0002', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '051/9234763764', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '335/993356567', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<ICustomer>(['Francesco', 'Baracca', 'FC0003', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '051/4235552', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '335/23523555', NewPerson.ID])   );
  io.Persist(NewPerson);


  // TVipCustomer
  NewPerson := io.Create<IVipCustomer>(['Omar', 'Bossoni', 'FC0004', 'VipCard0001', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '051/2432348', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '335/6345457', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IVipCustomer>(['Thomas', 'Ranzetti', 'FC0005', 'VipCard0002', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '051/34563456', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '335/1346476', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IVipCustomer>(['Paolo', 'Filippini', 'FC0006', 'VipCard0003', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '0721/423424624', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '340/423462346', NewPerson.ID])   );
  io.Persist(NewPerson);


  // TEmployee
  NewPerson := io.Create<IEmployee>(['Daniele', 'Teti', 'Roma', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '06/12363466', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '328/2342529879', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IEmployee>(['Daniele', 'Daqua', 'Roma', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '06/998867653', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '328/838768723', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IEmployee>(['Fabrizio', 'Bitti', 'Dubai', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '06/4634734', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '328/2323555', NewPerson.ID])   );
  io.Persist(NewPerson);


  // TAnotherPerson
  NewPerson := io.Create<IPerson>('Another', ['Maurizio', 'Another Magno', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '11/111111', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '22/222222', NewPerson.ID])   );
  io.Persist(NewPerson);

  NewPerson := io.Create<IPerson>('Another', ['Daniele', 'Another Daqua', 0]);
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Home', '06/998867653', NewPerson.ID])   );
  NewPerson.Phones.Add(   io.Create<IPhoneNumber>(['Mobile', '328/838768723', NewPerson.ID])   );
  io.Persist(NewPerson);
end;

end.
