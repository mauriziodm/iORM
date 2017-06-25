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
  AnotherModel, Interfaces, FireDAC.Comp.Client, System.SysUtils;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
var
  LMemTable: TFDMemTable;
begin
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
  NewPerson := io.di.Locate<IPerson>.ConstructorParams(['Maurizio','Del Magno',StrToDate('22/10/1970'),0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0541/112233', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '329/11223344', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Office', '0541/234687', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IPerson>.ConstructorParams(['Andrea','Costa',StrToDate('01/05/1972'),0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0541/445566', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '329/11255355', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IPerson>.ConstructorParams(['Luca','Coccia',StrToDate('15/07/1980'),0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0541/734573457', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '345/12662346', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Office', '0541/1112223', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TCustomer
  NewPerson := io.di.Locate<ICustomer>.ConstructorParams(['Mario', 'Rossi', 'FC0001',StrToDate('08/11/1962'), 0]).Get;
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<ICustomer>.ConstructorParams(['Giuseppe', 'Verdi', 'FC0002',StrToDate('16/06/1996'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/9234763764', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/993356567', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<ICustomer>.ConstructorParams(['Francesco', 'Baracca', 'FC0003',StrToDate('23/05/1962'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/4235552', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/23523555', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TVipCustomer
  NewPerson := io.di.Locate<IVipCustomer>.ConstructorParams(['Omar', 'Bossoni', 'FC0004', 'VipCard0001',StrToDate('14/05/1973'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/2432348', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/6345457', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IVipCustomer>.ConstructorParams(['Thomas', 'Ranzetti', 'FC0005', 'VipCard0002',StrToDate('18/03/1999'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '051/34563456', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '335/1346476', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IVipCustomer>.ConstructorParams(['Paolo', 'Filippini', 'FC0006', 'VipCard0003',StrToDate('10/01/1980'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '0721/423424624', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '340/423462346', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TEmployee
  NewPerson := io.di.Locate<IEmployee>.ConstructorParams(['Daniele', 'Teti', 'Roma',StrToDate('10/10/1971'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/12363466', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/2342529879', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IEmployee>.ConstructorParams(['Daniele', 'Daqua', 'Roma',StrToDate('21/04/1970'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/998867653', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/838768723', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IEmployee>.ConstructorParams(['Fabrizio', 'Bitti', 'Dubai',StrToDate('02/10/1969'), 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/4634734', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/2323555', NewPerson.ID)   );
  io.Persist(NewPerson);


  // TAnotherPerson
  NewPerson := io.di.Locate<IPerson>('Another').ConstructorParams(['Maurizio', 'Another Magno', 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '11/111111', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '22/222222', NewPerson.ID)   );
  io.Persist(NewPerson);

  NewPerson := io.di.Locate<IPerson>('Another').ConstructorParams(['Daniele', 'Another Daqua', 0]).Get;
  NewPerson.Phones.Add(   TPhoneNumber.Create('Home', '06/998867653', NewPerson.ID)   );
  NewPerson.Phones.Add(   TPhoneNumber.Create('Mobile', '328/838768723', NewPerson.ID)   );
  io.Persist(NewPerson);
end;

end.
