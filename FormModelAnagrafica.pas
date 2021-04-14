unit FormModelAnagrafica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel, DB, IBODataset, Buttons;

type
  TModelAnagraficaForm = class(TModelBaseForm)
    TA: TIBOTable;
    SourceTA: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelAnagraficaForm: TModelAnagraficaForm;

implementation

{$R *.dfm}

end.
