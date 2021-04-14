SET TERM ^ ;

CREATE PROCEDURE COM_CREAPREDEFINITE
AS
  DECLARE CODICE INTEGER;
BEGIN

/* ======================================================================================================== */
/* IMPIANTI: 1° AVVISO SCADENZA MANUTENZIONE 30 GIORNI PRIMA
/* ======================================================================================================== */
CODICE = -1;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Impianti: Data prox visita'
    ,-30
    ,30
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Avviso scadenza manutenzione impianto'



/* --- Inizio testo sms --- */
,'Gentile cliente,
entro il <RIF_SCADENZA_DATA> deve essere effettuata la manutenzione del suo impianto.
Ci chiami al <DATIAZIE_TELEFONO> per un appuntamento.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gentile cliente,
.
   ci premuriamo di ricordarle che entro il <RIF_SCADENZA_DATA> dovrà essere effettuata la manutenzione periodica del suo impianto (<RIF_PRATICA_DESCRIZIONE>) al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   Ci contatti al più presto al numero <DATIAZIE_TELEFONO>, faremo il possibile per fissare un appuntamento nel momento per lei più comodo.
.
   In attesa della sua gradita chiamata, le porgiamo i nostri più cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gentile cliente,
.
   ci premuriamo di ricordarle che entro il <RIF_SCADENZA_DATA> dovrà essere effettuata la manutenzione periodica del suo impianto (<RIF_PRATICA_DESCRIZIONE>) al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   Ci contatti al più presto al numero <DATIAZIE_TELEFONO>, faremo il possibile per fissare un appuntamento nel momento per lei più comodo.
.
   In attesa della sua gradita chiamata, le porgiamo i nostri più cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */













/* ======================================================================================================== */
/* IMPIANTI: 2° AVVISO SCADENZA MANUTENZIONE 15 GIORNI PRIMA
/* ======================================================================================================== */
CODICE = -2;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Impianti: Data prox visita'
    ,-15
    ,15
    ,'T'
    ,'F'
    ,'F'
    ,'F'
    ,'2° Avviso scadenza manutenzione impianto'



/* --- Inizio testo sms --- */
,'Gentile cliente,
entro il <RIF_SCADENZA_DATA> deve essere effettuata la manutenzione del suo impianto.
Ci chiami al <DATIAZIE_TELEFONO> per un appuntamento.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gentile cliente,
.
   facendo seguito al nostro primo avviso, non avendo ancora ricevuto alcuna chiamata da parte sua, ci permettiamo di ricordarle ancora una volta che entro il <RIF_SCADENZA_DATA> dovrà essere effettuata la manutenzione periodica del suo impianto (<RIF_PRATICA_DESCRIZIONE>) al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   Ci contatti al più presto al numero <DATIAZIE_TELEFONO>, faremo il possibile per fissare un appuntamento nel momento per lei più comodo.
.
   In attesa della sua gradita chiamata, le porgiamo i nostri più cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gentile cliente,
.
   facendo seguito al nostro primo avviso, non avendo ancora ricevuto alcuna chiamata da parte sua, ci permettiamo di ricordarle ancora una volta che entro il <RIF_SCADENZA_DATA> dovrà essere effettuata la manutenzione periodica del suo impianto (<RIF_PRATICA_DESCRIZIONE>) al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   Ci contatti al più presto al numero <DATIAZIE_TELEFONO>, faremo il possibile per fissare un appuntamento nel momento per lei più comodo.
.
   In attesa della sua gradita chiamata, le porgiamo i nostri più cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */












/* ======================================================================================================== */
/* APPUNTAMENTI: PROMEMORIA APPUNTAMENTO 2 GIORNI PRIMA
/* ======================================================================================================== */
CODICE = -3;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Appuntamenti: Data appuntamento'
    ,-2
    ,1
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Promemoria appuntamento (-2)'



/* --- Inizio testo sms --- */
,'Gent. cliente,
le ricordiamo l''appuntamento con un nostro addetto il giorno <RIF_DATA> alle ore <RIF_ORA>.
In caso di problemi <DATIAZIE_TELEFONO>.
Saluti.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gentile cliente,
.
   pensando di fare cosa gradita, le ricordiamo che il giorno <RIF_DATA> alle ore <RIF_ORA> verrà un nostro addetto per effettuare la manutenzione periodica del suo impianto   (<RIF_PRATICA_DESCRIZIONE>)   al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   La preghiamo, pertanto, di essere presente all''appuntamento.
.
   Nel caso non le sia possibile essere presente all''appuntamento o per qualunque altro problema, dubbio o informazione la invitiamo a contattarci al numero <DATIAZIE_TELEFONO>, i nostri addetti sono a sua disposizione.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gentile cliente,
.
   pensando di fare cosa gradita, le ricordiamo che il giorno <RIF_DATA> alle ore <RIF_ORA> verrà un nostro addetto per effettuare la manutenzione periodica del suo impianto   (<RIF_PRATICA_DESCRIZIONE>)   al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   La preghiamo, pertanto, di essere presente all''appuntamento.
.
   Nel caso non le sia possibile essere presente all''appuntamento o per qualunque altro problema, dubbio o informazione la invitiamo a contattarci al numero <DATIAZIE_TELEFONO>, i nostri addetti sono a sua disposizione.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */












/* ======================================================================================================== */
/* APPUNTAMENTI: PROMEMORIA APPUNTAMENTO 1 GIORNO PRIMA
/* ======================================================================================================== */
CODICE = -4;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Appuntamenti: Data appuntamento'
    ,-1
    ,1
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Promemoria appuntamento (-1)'



/* --- Inizio testo sms --- */
,'Gent. cliente,
le ricordiamo l''appuntamento con un nostro addetto il giorno <RIF_DATA> alle ore <RIF_ORA>.
In caso di problemi <DATIAZIE_TELEFONO>.
Saluti.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gentile cliente,
.
   pensando di fare cosa gradita, le ricordiamo che il giorno <RIF_DATA> alle ore <RIF_ORA> verrà un nostro addetto per effettuare la manutenzione periodica del suo impianto   (<RIF_PRATICA_DESCRIZIONE>)   al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   La preghiamo, pertanto, di essere presente all''appuntamento.
.
   Nel caso non le sia possibile essere presente all''appuntamento o per qualunque altro problema, dubbio o informazione la invitiamo a contattarci al numero <DATIAZIE_TELEFONO>, i nostri addetti sono a sua disposizione.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gentile cliente,
.
   pensando di fare cosa gradita, le ricordiamo che il giorno <RIF_DATA> alle ore <RIF_ORA> verrà un nostro addetto per effettuare la manutenzione periodica del suo impianto   (<RIF_PRATICA_DESCRIZIONE>)   al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   La preghiamo, pertanto, di essere presente all''appuntamento.
.
   Nel caso non le sia possibile essere presente all''appuntamento o per qualunque altro problema, dubbio o informazione la invitiamo a contattarci al numero <DATIAZIE_TELEFONO>, i nostri addetti sono a sua disposizione.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */











/* ======================================================================================================== */
/* APPUNTAMENTI: PROMEMORIA APPUNTAMENTO IL GIORNO STESSO
/* ======================================================================================================== */
CODICE = -5;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Appuntamenti: Data appuntamento'
    ,0
    ,1
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Promemoria appuntamento di oggi'



/* --- Inizio testo sms --- */
,'Gent. cliente,
le ricordiamo l''appuntamento con un nostro addetto oggi <RIF_DATA> alle ore <RIF_ORA>.
In caso di problemi <DATIAZIE_TELEFONO>.
Saluti.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gentile cliente,
.
   pensando di fare cosa gradita, le ricordiamo che oggi <RIF_DATA> alle ore <RIF_ORA> verrà un nostro addetto per effettuare la manutenzione periodica del suo impianto   (<RIF_PRATICA_DESCRIZIONE>)   al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   La preghiamo, pertanto, di essere presente all''appuntamento.
.
   Nel caso non le sia possibile essere presente all''appuntamento o per qualunque altro problema, dubbio o informazione la invitiamo a contattarci al numero <DATIAZIE_TELEFONO>, i nostri addetti sono a sua disposizione.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gentile cliente,
.
   pensando di fare cosa gradita, le ricordiamo che oggi <RIF_DATA> alle ore <RIF_ORA> verrà un nostro addetto per effettuare la manutenzione periodica del suo impianto   (<RIF_PRATICA_DESCRIZIONE>)   al fine di mantenerlo in perfetta efficienza e sicurezza.
.
   La preghiamo, pertanto, di essere presente all''appuntamento.
.
   Nel caso non le sia possibile essere presente all''appuntamento o per qualunque altro problema, dubbio o informazione la invitiamo a contattarci al numero <DATIAZIE_TELEFONO>, i nostri addetti sono a sua disposizione.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */











/* ======================================================================================================== */
/* INTERVENTI: GRAZIE PER AVERE SCELTO I NOSTRI SERVIZI (IL GIORNO DOPO)
/* ======================================================================================================== */
CODICE = -6;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Intervento: Data intervento'
    ,1
    ,15
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Grazie per avere scelto i nostri servizi'



/* --- Inizio testo sms --- */
,'Gent. cliente,
dopo il nostro intervento del <RIF_DATA> ci auguriamo sia rimasto soddisfatto.
Se avesse qualche lamentela ci chiami allo <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gentile cliente,
.
   facendo seguito al nostro intervento del <RIF_DATA>, desideriamo ringraziarla per la fiducia che ha dimostrato richiedendo i nostri servizi e ci auguriamo di avere completamente soddisfatto le sue aspettative.
.
   Nel caso ciò non fosse avvenuto e avesse qualche lamentela da rivolgerci, la preghiamo di contattarci al numero <DATIAZIE_TELEFONO> e di comunicarci il motivo della sua insoddisfazione; in questo modo avremo l''opportunità di porre rimedio ad eventuali errori e/o comportamenti scorretti da parte di un nostro addetto e, in ogni caso, di migliorare i nostri servizi per le sue future necessità.
.
   La sua opinione è molto importante per noi.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gentile cliente,
.
   facendo seguito al nostro intervento del <RIF_DATA>, desideriamo ringraziarla per la fiducia che ha dimostrato richiedendo i nostri servizi e ci auguriamo di avere completamente soddisfatto le sue aspettative.
.
   Nel caso ciò non fosse avvenuto e avesse qualche lamentela da rivolgerci, la preghiamo di contattarci al numero <DATIAZIE_TELEFONO> e di comunicarci il motivo della sua insoddisfazione; in questo modo avremo l''opportunità di porre rimedio ad eventuali errori e/o comportamenti scorretti da parte di un nostro addetto e, in ogni caso, di migliorare i nostri servizi per le sue future necessità.
.
   La sua opinione è molto importante per noi.
.
   Cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */











/* ======================================================================================================== */
/* SCADENZE: PROMEMORIA DI PAGAMENTO
/* ======================================================================================================== */
CODICE = -7;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Scadenze: Data scadenza'
    ,-3
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Promemoria di pagamento'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> ricordiamo il pagamento di EUR <RIF_IMPORTO> entro il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Gent.mo cliente,
.
   certi di fare cosa gradita, Vi ricordiamo che ci risulta in scadenza entro il <RIF_SCADENZA_DATA> il pagamento di EUR <RIF_IMPORTO> relativo alla ns <RIF_RIFERIMENTO>.
.
   Nel caso necessitasse di ulteriori chiarimenti o per qualunque problema ci contatti al numero <DATIAZIE_TELEFONO>.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Gent.mo cliente,
.
   certi di fare cosa gradita, Vi ricordiamo che ci risulta in scadenza entro il <RIF_SCADENZA_DATA> il pagamento di EUR <RIF_IMPORTO> relativo alla ns <RIF_RIFERIMENTO>.
.
   Nel caso necessitasse di ulteriori chiarimenti o per qualunque problema ci contatti al numero <DATIAZIE_TELEFONO>.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti.
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */












/* ======================================================================================================== */
/* SCADENZE: 1° SOLLECITO DI PAGAMENTO
/* ======================================================================================================== */
CODICE = -8;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Scadenze: Data scadenza'
    ,15
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Sollecito di pagamento'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> sollecitiamo il pagamento di EUR <RIF_IMPORTO> già scaduto il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   Partita IVA  <MSG_SOGGETTO_PARTITAIVA>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
   Alla cortese attenzione del Responsabile Amministrativo
.   
.
     Gentile cliente,
.
   da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Certi si tratti di una semplice dimenticanza Vi invitiamo a regolarizzare la Vostra posizione contabile al più presto.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
   <DATIAZIE_CITTA>  <GEN_DATA_ATTUALE>
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   Partita IVA  <MSG_SOGGETTO_PARTITAIVA>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
   Alla cortese attenzione del Responsabile Amministrativo
.   
.
     Gentile cliente,
.
   da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Certi si tratti di una semplice dimenticanza Vi invitiamo a regolarizzare la Vostra posizione contabile al più presto.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */













/* ======================================================================================================== */
/* SCADENZE: 2° SOLLECITO DI PAGAMENTO
/* ======================================================================================================== */
CODICE = -9;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Scadenze: Data scadenza'
    ,30
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Secondo sollecito di pagamento'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> secondo sollecito pagamento di EUR <RIF_IMPORTO> già scaduto il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   Partita IVA  <MSG_SOGGETTO_PARTITAIVA>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
   Alla cortese attenzione del Responsabile Amministrativo
.   
.
     Gentile cliente,
.
   facendo seguito all''invio del nostro primo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Ci vediamo pertanto costretti ad invitarVi nuovamente a provvedere al più presto al pagamento della stessa, al fine di regolare la Vostra posizione debitoria.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
   <DATIAZIE_CITTA>  <GEN_DATA_ATTUALE>
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   Partita IVA  <MSG_SOGGETTO_PARTITAIVA>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
   Alla cortese attenzione del Responsabile Amministrativo
.   
.
     Gentile cliente,
.
   facendo seguito all''invio del nostro primo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Ci vediamo pertanto costretti ad invitarVi nuovamente a provvedere al più presto al pagamento della stessa, al fine di regolare la Vostra posizione debitoria.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */













/* ======================================================================================================== */
/* SCADENZE: 3° SOLLECITO DI PAGAMENTO E COSTITUZIONE IN MORA
/* ======================================================================================================== */
CODICE = -10;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Scadenze: Data scadenza'
    ,45
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Ultimo sollecito di pagamento e costituzione in mora'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> ultimo sollecito pagamento di EUR <RIF_IMPORTO> già scaduto il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   Partita IVA  <MSG_SOGGETTO_PARTITAIVA>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
   Alla cortese attenzione del Responsabile Amministrativo
.   
.
     Gentile cliente,
   facendo seguito all''invio del nostro primo e secondo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Vi esortiamo al pagamento del Vs. debito al fine di regolare la Vs. posizione debitoria entro 10 (dieci) giorni dalla ricezione della presente. In caso di mancato riscontro saremo costretti, nostro malgrado, ad adire le vie legali.
.
   Ricordiamo che la presente ha validità come atto di costituzione in mora ad ogni effetto di legge.  
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
   <DATIAZIE_CITTA>  <GEN_DATA_ATTUALE>
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   Partita IVA  <MSG_SOGGETTO_PARTITAIVA>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
   Alla cortese attenzione del Responsabile Amministrativo
.   
.
     Gentile cliente,
.
   facendo seguito all''invio del nostro primo e secondo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Vi esortiamo al pagamento del Vs. debito al fine di regolare la Vs. posizione debitoria entro 10 (dieci) giorni dalla ricezione della presente. In caso di mancato riscontro saremo costretti, nostro malgrado, ad adire le vie legali.
.
   Ricordiamo che la presente ha validità come atto di costituzione in mora ad ogni effetto di legge.  
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */












/* ======================================================================================================== */
/* CORRISPETTIVI NON PAGATI: 1° SOLLECITO DI PAGAMENTO
/* ======================================================================================================== */
CODICE = -11;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Corrisp. non pagati: Data documento'
    ,7
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Sollecito di pagamento'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> sollecitiamo il pagamento di EUR <RIF_IMPORTO> già scaduto il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.
.	
     Gentile cliente,
.
   da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Certi si tratti di una semplice dimenticanza Vi invitiamo a regolarizzare la Vostra posizione contabile al più presto.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
   <DATIAZIE_CITTA>  <GEN_DATA_ATTUALE>
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.   
.
     Gentile cliente,
.
   da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Certi si tratti di una semplice dimenticanza Vi invitiamo a regolarizzare la Vostra posizione contabile al più presto.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */













/* ======================================================================================================== */
/* CORRISPETTIVI NON PAGATI: 2° SOLLECITO DI PAGAMENTO
/* ======================================================================================================== */
CODICE = -12;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Corrisp. non pagati: Data documento'
    ,15
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Secondo sollecito di pagamento'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> secondo sollecito pagamento di EUR <RIF_IMPORTO> già scaduto il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.   
.
     Gentile cliente,
.
   facendo seguito all''invio del nostro primo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Ci vediamo pertanto costretti ad invitarVi nuovamente a provvedere al più presto al pagamento della stessa, al fine di regolare la Vostra posizione debitoria.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
   <DATIAZIE_CITTA>  <GEN_DATA_ATTUALE>
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.   
.
     Gentile cliente,
.
   facendo seguito all''invio del nostro primo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Ci vediamo pertanto costretti ad invitarVi nuovamente a provvedere al più presto al pagamento della stessa, al fine di regolare la Vostra posizione debitoria.
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */













/* ======================================================================================================== */
/* CORRISPETTIVI NON PAGATI: 3° SOLLECITO DI PAGAMENTO E COSTITUZIONE IN MORA
/* ======================================================================================================== */
CODICE = -13;
IF (NOT EXISTS (SELECT CI.ID FROM COM_IMPOSTAZIONI CI WHERE CI.ID = :CODICE)) THEN BEGIN
  INSERT INTO COM_IMPOSTAZIONI
  (
     ID
    ,RIF_DATO
    ,RIF_TIMEOFFSET_DAYS
    ,RIF_EXPIRATION_DAYS
    ,RIF_NOAPPUNTAMENTO
    ,MSGTYPE_LETTER
    ,MSGTYPE_EMAIL
    ,MSGTYPE_SMS
    ,MSG_OGGETTO
    ,MSG_TEXT_SMS
    ,MSG_TEXT_EMAIL
    ,MSG_TEXT_LETTERA
  ) VALUES (
     :CODICE
    ,'Corrisp. non pagati: Data documento'
    ,23
    ,7
    ,'F'
    ,'F'
    ,'F'
    ,'F'
    ,'Ultimo sollecito di pagamento e costituzione in mora'



/* --- Inizio testo sms --- */
,'Gent. cliente,
rif. ns <RIF_RIFERIMENTO> ultimo sollecito pagamento di EUR <RIF_IMPORTO> già scaduto il <RIF_SCADENZA_DATA>.
Per chiarimenti <DATIAZIE_TELEFONO>.'
/* --- Fine testo sms --- */



/* --- Inizio testo email --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.   
.
     Gentile cliente,
   facendo seguito all''invio del nostro primo e secondo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Vi esortiamo al pagamento del Vs. debito al fine di regolare la Vs. posizione debitoria entro 10 (dieci) giorni dalla ricezione della presente. In caso di mancato riscontro saremo costretti, nostro malgrado, ad adire le vie legali.
.
   Ricordiamo che la presente ha validità come atto di costituzione in mora ad ogni effetto di legge.  
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
   <DATIAZIE_CITTA>  <GEN_DATA_ATTUALE>
.
.
   <DATIAZIE_RAGIONESOCIALE>
   <DATIAZIE_INDIRIZZO>  <DATIAZIE_NUMCIVICO>
   <DATIAZIE_CITTA>   (<DATIAZIE_PROVINCIA>)   <DATIAZIE_CAP>
.
   Telefono:   <DATIAZIE_TELEFONO>
   Fax:   <DATIAZIE_FAX>
   E-mail: <DATIAZIE_EMAIL>'
/* --- Inizio testo email --- */



/* --- Inizio testo lettera --- */
,'   Spett.le
   <MSG_SOGGETTO_RAGIONESOCIALE>
   <MSG_SOGGETTO_INDIRIZZO> <MSG_SOGGETTO_NUMCIVICO>
   <MSG_SOGGETTO_COMUNE>  (<MSG_SOGGETTO_PROVINCIA>)  <MSG_SOGGETTO_CAP>
   C.F. <MSG_SOGGETTO_CODICEFISCALE>
.   
.
     Gentile cliente,
.
   facendo seguito all''invio del nostro primo e secondo sollecito di pagamento, da un controllo della nostra contabilità risulta che, alla data odierna, non avete ancora provveduto al pagamento di EUR <RIF_IMPORTO> relativo alla nostra <RIF_RIFERIMENTO>  e già scaduto in data <RIF_SCADENZA_DATA>.  
.
   Vi esortiamo al pagamento del Vs. debito al fine di regolare la Vs. posizione debitoria entro 10 (dieci) giorni dalla ricezione della presente. In caso di mancato riscontro saremo costretti, nostro malgrado, ad adire le vie legali.
.
   Ricordiamo che la presente ha validità come atto di costituzione in mora ad ogni effetto di legge.  
.
   Nel caso abbiate già provveduto al pagamento di quanto dovuto, vogliate ignorare la presente comunicazione.
.
   In attesa di un Vostro cortese riscontro cogliamo l''occasione per esprimerVi i nostri più cordiali saluti. 
.
.
.
.
.
   <DATIAZIE_RAGIONESOCIALE>'
/* --- Fine testo lettera --- */

  );
END
  /* ======================================================================================================== */












  /* Fine lavori */
  EXIT;

END^

SET TERM ; ^


