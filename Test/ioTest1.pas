unit ioTest1;

interface
uses
  DUnitX.TestFramework, iORM.AbstractionLayer.Framework.VCL;

type

  [TestFixture]
  TioTest1 = class(TObject)
  private
    FSQLiteDatabaseFullPathName, FFirebirdDatabaseFullPathName: String;
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
    [Test]
    [TestCase('Setting Firebird connection as default',               ',NO_NAME,FirebirdConnection,FirebirdConnection')]
    [TestCase('Setting SQLite (the unnamed) connection as default',   'FirebirdConnection,FirebirdConnection,,NO_NAME')]
    procedure ConnectionManager_SetConnectionAsDefault(ASetFromConnectionName, AExpectedFromConnectionName, ASetToConnectionName,
      AExpectedToConnectionName: String);
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
  // Set connection for SQLite (under the Documents folder better for mobile use)
  FSQLiteDatabaseFullPathName := TPath.Combine(TPath.GetDocumentsPath, 'Test_ContactsObj.db');
  io.Connections.NewSQLiteConnectionDef(FSQLiteDatabaseFullPathName).Apply;
  // Set connection for Firebird SQL
  FFirebirdDatabaseFullPathName := TPath.Combine(TPath.GetDocumentsPath, 'Test_ContactsObj.fdb');
  io.Connections.NewFirebirdConnectionDef('localhost', FFirebirdDatabaseFullPathName, 'SYSDBA', 'masterkey', '', False, False, False,
    'FirebirdConnection').Apply;
  // ============ iORM initialization ====================
end;

procedure TioTest1.TearDown;
begin
end;

procedure TioTest1.ConnectionManager_SetConnectionAsDefault(ASetFromConnectionName, AExpectedFromConnectionName, ASetToConnectionName,
      AExpectedToConnectionName: String);
var
  LCurrentConnectionName: String;
begin
  // First set the FROM connection name
  io.Connections.SetDefaultConnectionName(ASetFromConnectionName);
  LCurrentConnectionName := io.Connections.GetDefaultConnectionName;
  Assert.AreEqual(AExpectedFromConnectionName, LCurrentConnectionName, '(Failed setting the "FROM" connection name)');
  // Then test the TO connection name
  io.Connections.SetDefaultConnectionName(ASetToConnectionName);
  LCurrentConnectionName := io.Connections.GetDefaultConnectionName;
  Assert.AreEqual(AExpectedToConnectionName, LCurrentConnectionName, '(Failed setting the "TO" connection name)');
end;

procedure TioTest1.CreateSampleData;
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TioTest1.GenerateDB;
begin
  if FileExists(FSQLiteDatabaseFullPathName) then
    DeleteFile(FSQLiteDatabaseFullPathName);
  if FileExists(FFirebirdDatabaseFullPathName) then
    DeleteFile(FFirebirdDatabaseFullPathName);
  io.GenerateDB(True, True, False);
end;

initialization
  TDUnitX.RegisterTestFixture(TioTest1);
end.
