unit ioTest1;

interface
uses
  DUnitX.TestFramework, iORM.AbstractionLayer.Framework.VCL;

type

  [TestFixture]
  TioTest1 = class(TObject)
  private
    FDatabaseFullPathName: String;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // GenerateDB
    [Test]
    procedure GenerateDB;
    [Test]
    procedure CreateSampleData;

    // Test with TestCase Attribute to supply parameters.
//    [Test]
//    [TestCase('TestA','1,2')]
//    [TestCase('TestB','3,4')]
//    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

uses
  iORM, System.IOUtils, System.SysUtils, SampleData, RegisterClassesUnit;

procedure TioTest1.Setup;
begin
  // ============ iORM initialization ====================
  // Register some classes into the Dependency Injection Container (other classes are registered by attribute [diImplements(IImplementedInteerface)]
  TDIClassRegister.RegisterClasses;
  // Get the database FullPathName
  FDatabaseFullPathName := TPath.Combine(TPath.GetDocumentsPath, 'Test_ContactsObj.db');
  // Set connection for SQLite (under the Documents folder better for mobile use)
  io.Connections.NewSQLiteConnectionDef(FDatabaseFullPathName).Apply;
  // Set connection for Firebird SQL
//  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\ContactsObj.FDB'), 'SYSDBA', 'masterkey', '').Apply;
  // ============ iORM initialization ====================
end;

procedure TioTest1.TearDown;
begin
end;

procedure TioTest1.CreateSampleData;
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TioTest1.GenerateDB;
begin
  if FileExists(FDatabaseFullPathName) then
    DeleteFile(FDatabaseFullPathName);
  io.GenerateDB(True, True, False);
//  Assert.Pass('Generate DB test passed');
end;

initialization
  TDUnitX.RegisterTestFixture(TioTest1);
end.
