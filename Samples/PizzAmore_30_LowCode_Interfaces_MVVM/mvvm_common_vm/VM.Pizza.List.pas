unit VM.Pizza.List;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces,
  iORM.MVVM.Interfaces;

type

  TVMPizzaList = class(TVMBaseForList)
    procedure acAppendNewInstanceAsInterface(const ASender: TObject; out NewInstance: IInterface);
  private
    FEmbedded: Boolean;
    procedure SetEmbedded(const Value: Boolean);
  public
    property Embedded: Boolean read FEmbedded write SetEmbedded;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TVMPizzas }

procedure TVMPizzaList.acAppendNewInstanceAsInterface(const ASender: TObject; out NewInstance: IInterface);
begin
  NewInstance := io.Create<IPizza>;
end;

procedure TVMPizzaList.SetEmbedded(const Value: Boolean);
begin
//  acAdd.Visible := not Value;
  acBack.Visible := not Value;
//  acDelete.Visible := not Value;
  acSelectCurrent.Action_CloseQueryAction := nil;
end;

end.
