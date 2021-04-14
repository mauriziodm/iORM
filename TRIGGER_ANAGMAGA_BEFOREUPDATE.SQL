CREATE TRIGGER ANAGMAGA_BEFOREUPDATE FOR ANAGMAGA
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN

  /* La data di chiusura generale non deve mai rimanere nulla, se lo è la forza al default */
  IF (NEW.DATACHIUSURAGENERALE IS NULL) THEN NEW.DATACHIUSURAGENERALE = '01/01/1900';
  
  /* La nuova data di chiusura non può essere antecedente a quella precedente altrimenti succede un casino */
  ELSE IF (NEW.DATACHIUSURAGENERALE < OLD.DATACHIUSURAGENERALE) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Trigger ANAGMAGA_BEFOREUPDATE: La data di chiusura richiesta non è valida.';

END
