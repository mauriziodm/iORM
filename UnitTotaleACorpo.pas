unit UnitTotaleACorpo;

interface

uses
  cxCustomData, SchedaPreventiviOrdini, UnitTotaleACorpo.Interfaces;

type

  TTotaleCorpo = class(TInterfacedObject, ITotaleCorpo)
  private
    FDoc: TPreventiviOrdiniForm;
    FIdxRowType, FIdxImportoRigo, FIdxImportoRigoIvaComp, FIdxPrzUnit, FIdxPrzUnitIvaComp: Integer;
    FIdxCostoUnit, FIdxCostoUnitComp, FIdxCostoUnitOpera, FIdxImportoCostoComp, FIdxImportoCostoOpera,
    FIdxComponentiUnit, FIdxOperaUnit, FIdxImportoComponenti, FIdxImportoOpera,
    FIdxQtaOperaUnit, FIdxQtaOpera: Integer;
    FTotale, FTotaleIvaComp, FTotaleComponenti, FTotaleOpera: Currency;
    FTotaleCostoOpera: Currency;
    FTotaleCostoComp: Currency;
    FTotaleQtaOpera: Double;
  public
    constructor Create(const ADoc:TPreventiviOrdiniForm);
    procedure CheckRow(const ARecordIndex:Integer);
    procedure Clear;
  end;

implementation

uses
  DataModule1, System.Variants;

{ TTotaleCorpo }

procedure TTotaleCorpo.CheckRow(const ARecordIndex: Integer);
var
  LRowIndex: Integer;
  LPrzUnitAutocalc: Boolean;
begin
  // Se non un rigo di dati (es: group row) lo salta
  if not FDoc.tvCorpo.ViewData.Rows[ARecordIndex].IsData then
    Exit;
  // Se è un rigo che deve essere conteggiato dal sistema di gestione del totale a corpo...
  if VarToStr(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxRowType]) = TIPORIGODOC_TC_Rigo then
  begin
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoRigo]) then
      FTotale := FTotale + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoRigo];
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoRigoIvaComp]) then
      FTotaleIvaComp := FTotaleIvaComp + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoRigoIvaComp];
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoComponenti]) then
      FTotaleComponenti := FTotaleComponenti + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoComponenti];
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoOpera]) then
      FTotaleOpera := FTotaleOpera + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoOpera];
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoCostoComp]) then
      FTotaleCostoComp := FTotaleCostoComp + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoCostoComp];
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoCostoOpera]) then
      FTotaleCostoOpera := FTotaleCostoOpera + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxImportoCostoOpera];
    if not VarIsNull(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxQtaOpera]) then
      FTotaleQtaOpera := FTotaleQtaOpera + FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxQtaOpera];
  end
  else
  // Se invece incontra un rigo di riepilogo totale a corpo ne imposta i valori con i totali
  //  accumulati finora e poi resetta il tutto
  if VarToStr(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxRowType]) = TIPORIGODOC_TC_Totale then
  begin
    LPrzUnitAutocalc := (VarToStr(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FDoc.tvCorpoPREZZOUNITARIOAUTOCALC.Index]) = 'T');
    // Aggiorna i prezzi di vendita solo se non c'è il check sulla colonna PrezzoUnitarioAutocalc
    if LPrzUnitAutocalc then
    begin
      FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxPrzUnit] := FTotale;
      FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxComponentiUnit] := FTotaleComponenti;
      FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxOperaUnit] := FTotaleOpera;
    end;
    FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxCostoUnit] := FTotaleCostoComp + FTotaleCostoOpera;
    FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxCostoUnitComp] := FTotaleCostoComp;
    FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxCostoUnitOpera] := FTotaleCostoOpera;
    FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxQtaOperaUnit] := FTotaleQtaOpera;
    // in base alle impostazioni setta e ricalcola il tutto IVA compresa con scorporo oppure normale
    //  ed esegue anche gli opportuni ricalcoli
    if DM1.ScorporoIVA then
    begin
      if LPrzUnitAutocalc then
        FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxPrzUnitIvaComp] := FTotaleIvaComp;
      FDoc.CalcolaPerModificaPrezzoUnitarioIVACompresa(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].RecordIndex, FDoc.tvCorpo.DataController);
    end
    else
    begin
      if LPrzUnitAutocalc then
        FDoc.tvCorpo.ViewData.Rows[ARecordIndex].Values[FIdxPrzUnit] := FTotale;
      FDoc.CalcolaPerModificaPrezzoUnitario(FDoc.tvCorpo.ViewData.Rows[ARecordIndex].RecordIndex, FDoc.tvCorpo.DataController);
    end;
    FDoc.CalcolaImportoRigo(FDoc.tvCorpo.DataController, FDoc.tvCorpo.ViewData.Rows[ARecordIndex].RecordIndex);
    // Reset
    Clear;
  end;
end;

constructor TTotaleCorpo.Create(const ADoc:TPreventiviOrdiniForm);
begin
  Self.Clear;
  FDoc := ADoc;
  FIdxRowType := FDoc.tvCorpoROWTYPE.Index;
  FIdxImportoRigo := FDoc.tvCorpoIMPORTORIGO.Index;
  FIdxImportoRigoIvaComp := FDoc.tvCorpoIMPORTORIGOIVACOMPRESA.Index;
  FIdxPrzUnit := FDoc.tvCorpoPREZZOUNITARIO.Index;
  FIdxPrzUnitIvaComp := FDoc.tvCorpoPREZZOUNITARIOIVACOMPRESA.Index;
  FIdxComponentiUnit := FDoc.tvCorpoCOMPONENTIUNIT.Index;
  FIdxOperaUnit := FDoc.tvCorpoOPERAUNIT.Index;
  FIdxImportoComponenti := FDoc.tvCorpoIMPORTOCOMPONENTI.Index;
  FIdxImportoOpera := FDoc.tvCorpoIMPORTOOPERA.Index;
  FIdxCostoUnit := FDoc.tvCorpoPREZZOACQUISTOARTICOLO.Index;
  FIdxCostoUnitComp := FDoc.tvCorpoCOSTOCOMPONENTIUNIT.Index;
  FIdxCostoUnitOpera := FDoc.tvCorpoCOSTOOPERAUNIT.Index;
  FIdxImportoCostoComp := FDoc.tvCorpoIMPORTOCOSTOCOMPONENTI.Index;
  FIdxImportoCostoOpera := FDoc.tvCorpoIMPORTOCOSTOOPERA.Index;
  FIdxQtaOpera := FDoc.tvCorpoQTAOPERA.Index;
  FIdxQtaOperaUnit := FDoc.tvCorpoQTAOPERAUNIT.Index;
end;

procedure TTotaleCorpo.Clear;
begin
  FTotale := 0;
  FTotaleIvaComp := 0;
  FTotaleComponenti := 0;
  FTotaleOpera := 0;
  FTotaleCostoOpera := 0;
  FTotaleCostoComp := 0;
  FTotaleQtaOpera := 0;
end;

end.
