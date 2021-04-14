unit FormEtichetteFastReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, Vcl.StdCtrls, Data.DB,
  IBODataset, frxDBSet, frxDesgn, frxBarcode;

type
  TEtichetteFastReportForm = class(TForm)
    frxReport1: TfrxReport;
    frxDBDatasetSoggetti: TfrxDBDataset;
    QryLabSogg: TIBOQuery;
    QryLabSoggCODICESTAZIONE: TStringField;
    QryLabSoggPROGRIGO: TIntegerField;
    QryLabSoggCODICE: TIntegerField;
    QryLabSoggRAGIONESOCIALE: TStringField;
    QryLabSoggINDIRIZZO: TStringField;
    QryLabSoggNUMCIVICO: TStringField;
    QryLabSoggCITTA: TStringField;
    QryLabSoggCAP: TStringField;
    QryLabSoggPROVINCIA: TStringField;
    QryLabSoggJOLLY1: TStringField;
    QryLabSoggJOLLY2: TStringField;
    QryLabSoggJOLLY3: TStringField;
    QryLabSoggJOLLY4: TStringField;
    QryLabSoggJOLLY5: TStringField;
    QryLabSoggJOLLY6: TStringField;
    QryLabSoggJOLLY7: TStringField;
    QryLabSoggJOLLY8: TStringField;
    QryLabSoggJOLLY9: TStringField;
    QryLabSoggJOLLY10: TStringField;
    Button1: TButton;
    frxDesigner1: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDBDatasetArticoli: TfrxDBDataset;
    QryLabArt: TIBOQuery;
    QryLabArtCODICESTAZIONE: TStringField;
    QryLabArtPROGRIGO: TIntegerField;
    QryLabArtCODICEARTICOLO: TStringField;
    QryLabArtDESCRIZIONE: TStringField;
    QryLabArtDESCRIZIONE2: TStringField;
    QryLabArtDESCRIZIONE3: TStringField;
    QryLabArtDESCRIZIONE4: TStringField;
    QryLabArtDESCRIZIONE5: TStringField;
    QryLabArtUNITADIMISURA: TStringField;
    QryLabArtPREZZODIVENDITA: TIBOFloatField;
    QryLabArtPREZZODIVENDITA2: TIBOFloatField;
    QryLabArtPREZZODIVENDITA3: TIBOFloatField;
    QryLabArtPREZZODIVENDITA4: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP1: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP2: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP3: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP4: TIBOFloatField;
    QryLabArtBARCODE: TStringField;
    QryLabArtMARCA: TStringField;
    QryLabArtTIPODOCUMENTO: TStringField;
    QryLabArtREGISTRO: TStringField;
    QryLabArtNUMORDPREV: TIntegerField;
    QryLabArtDATADOCUMENTO: TDateTimeField;
    QryLabArtCODICECLIENTE: TIntegerField;
    QryLabArtJOLLY1: TStringField;
    QryLabArtJOLLY2: TStringField;
    QryLabArtJOLLY3: TStringField;
    QryLabArtJOLLY4: TStringField;
    QryLabArtJOLLY5: TStringField;
    QryLabArtJOLLY6: TStringField;
    QryLabArtJOLLY7: TStringField;
    QryLabArtJOLLY8: TStringField;
    QryLabArtJOLLY9: TStringField;
    QryLabArtJOLLY10: TStringField;
    QryLabArtCODICEFORNITORE: TStringField;
    QryLabArtDESCRIZIONEFORNITORE: TStringField;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EtichetteFastReportForm: TEtichetteFastReportForm;

implementation

uses vcl.printers;

{$R *.dfm}

procedure TEtichetteFastReportForm.Button1Click(Sender: TObject);
begin
  frxReport1.LoadFromFile('provafastreport.fr3');
  frxReport1.DesignReport();
end;

procedure TEtichetteFastReportForm.Button2Click(Sender: TObject);
begin
  frxReport1.LoadFromFile('provafastreport.fr3');
  frxReport1.Print;
end;

procedure TEtichetteFastReportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
