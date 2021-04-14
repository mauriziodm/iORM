unit QRAllegatoGVanz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRModelAllegatiVanzo, QRCtrls, QuickRpt, ExtCtrls;

type
  TAllegatoGVanzQR = class(TModelAllegatiVanzoQR)
    QRBand1: TQRBand;
    QRLabel146: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    RedLabel_CivicoImm: TQRLabel;
    Redbox_Logo: TQRShape;
    RedBox_Bollino: TQRShape;
    Redbox_ComuneInst1: TQRShape;
    Redbox_ComuneInst2: TQRShape;
    Redbox_ComuneInst3: TQRShape;
    Redbox_ComuneInst4: TQRShape;
    Redbox_ComuneInst5: TQRShape;
    Redbox_ComuneInst6: TQRShape;
    Redbox_ComuneInst7: TQRShape;
    Redbox_ComuneInst8: TQRShape;
    Redbox_ComuneInst9: TQRShape;
    Redbox_ComuneInst10: TQRShape;
    Redbox_ComuneInst11: TQRShape;
    Redbox_ComuneInst12: TQRShape;
    Redbox_ComuneInst13: TQRShape;
    Redbox_ComuneInst14: TQRShape;
    Redbox_ComuneInst15: TQRShape;
    Redbox_ComuneInst16: TQRShape;
    Redbox_ComuneInst17: TQRShape;
    Redbox_ComuneInst18: TQRShape;
    Redbox_ComuneInst19: TQRShape;
    Redbox_ComuneInst20: TQRShape;
    Redbox_ComuneInst21: TQRShape;
    Redbox_ComuneInst22: TQRShape;
    Redbox_ComuneInst23: TQRShape;
    Redbox_ComuneInst24: TQRShape;
    Redbox_ComuneInst25: TQRShape;
    Redbox_ProvinciaImm1: TQRShape;
    Redbox_ProvinciaImm2: TQRShape;
    Redbox_CodCatasto9: TQRShape;
    Redbox_CodCatasto8: TQRShape;
    Redbox_CodCatasto7: TQRShape;
    Redbox_CodCatasto6: TQRShape;
    Redbox_CodCatasto5: TQRShape;
    Redbox_CodCatasto4: TQRShape;
    Redbox_CodCatasto3: TQRShape;
    Redbox_CodCatasto2: TQRShape;
    Redbox_CodCatasto1: TQRShape;
    Redbox_indirizzoImm1: TQRShape;
    Redbox_indirizzoImm2: TQRShape;
    Redbox_indirizzoImm3: TQRShape;
    Redbox_indirizzoImm4: TQRShape;
    Redbox_indirizzoImm5: TQRShape;
    Redbox_indirizzoImm6: TQRShape;
    Redbox_indirizzoImm7: TQRShape;
    Redbox_indirizzoImm8: TQRShape;
    Redbox_indirizzoImm9: TQRShape;
    Redbox_indirizzoImm10: TQRShape;
    Redbox_indirizzoImm11: TQRShape;
    Redbox_indirizzoImm12: TQRShape;
    Redbox_indirizzoImm13: TQRShape;
    Redbox_indirizzoImm14: TQRShape;
    Redbox_indirizzoImm15: TQRShape;
    Redbox_indirizzoImm16: TQRShape;
    Redbox_indirizzoImm17: TQRShape;
    Redbox_indirizzoImm18: TQRShape;
    Redbox_indirizzoImm19: TQRShape;
    Redbox_indirizzoImm20: TQRShape;
    Redbox_indirizzoImm21: TQRShape;
    Redbox_indirizzoImm22: TQRShape;
    Redbox_indirizzoImm23: TQRShape;
    Redbox_CivicoImm1: TQRShape;
    Redbox_CivicoImm2: TQRShape;
    Redbox_CivicoImm3: TQRShape;
    Redbox_CivicoImm4: TQRShape;
    Redbox_CivicoImm5: TQRShape;
    Redbox_CivicoImm6: TQRShape;
    Redbox_PianoImm1: TQRShape;
    Redbox_PianoImm2: TQRShape;
    Redbox_InternoImm1: TQRShape;
    Redbox_InternoImm2: TQRShape;
    Redbox_InternoImm3: TQRShape;
    RedLabel_InternoImm: TQRLabel;
    Redbox_InternoImm4: TQRShape;
    Redbox_RagSocResp1: TQRShape;
    Redbox_RagSocResp2: TQRShape;
    Redbox_RagSocResp3: TQRShape;
    Redbox_RagSocResp4: TQRShape;
    Redbox_RagSocResp5: TQRShape;
    Redbox_RagSocResp6: TQRShape;
    Redbox_RagSocResp7: TQRShape;
    Redbox_RagSocResp8: TQRShape;
    Redbox_RagSocResp9: TQRShape;
    Redbox_RagSocResp10: TQRShape;
    Redbox_RagSocResp11: TQRShape;
    Redbox_RagSocResp12: TQRShape;
    Redbox_RagSocResp13: TQRShape;
    Redbox_RagSocResp14: TQRShape;
    Redbox_RagSocResp15: TQRShape;
    Redbox_RagSocResp16: TQRShape;
    Redbox_RagSocResp17: TQRShape;
    Redbox_RagSocResp18: TQRShape;
    Redbox_RagSocResp19: TQRShape;
    Redbox_RagSocResp20: TQRShape;
    Redbox_RagSocResp21: TQRShape;
    Redbox_RagSocResp22: TQRShape;
    Redbox_RagSocResp23: TQRShape;
    Redbox_RagSocResp24: TQRShape;
    Redbox_RagSocResp25: TQRShape;
    Redbox_TelefonoResp10: TQRShape;
    Redbox_TelefonoResp9: TQRShape;
    Redbox_TelefonoResp8: TQRShape;
    Redbox_TelefonoResp7: TQRShape;
    Redbox_TelefonoResp6: TQRShape;
    Redbox_TelefonoResp5: TQRShape;
    Redbox_TelefonoResp4: TQRShape;
    Redbox_TelefonoResp3: TQRShape;
    Redbox_TelefonoResp2: TQRShape;
    Redbox_TelefonoResp1: TQRShape;
    Redbox_IndirizzoResp1: TQRShape;
    Redbox_IndirizzoResp2: TQRShape;
    Redbox_IndirizzoResp3: TQRShape;
    Redbox_IndirizzoResp4: TQRShape;
    Redbox_IndirizzoResp5: TQRShape;
    Redbox_IndirizzoResp6: TQRShape;
    Redbox_IndirizzoResp7: TQRShape;
    Redbox_IndirizzoResp8: TQRShape;
    Redbox_IndirizzoResp9: TQRShape;
    Redbox_IndirizzoResp10: TQRShape;
    Redbox_IndirizzoResp11: TQRShape;
    Redbox_IndirizzoResp12: TQRShape;
    Redbox_IndirizzoResp13: TQRShape;
    Redbox_IndirizzoResp14: TQRShape;
    Redbox_IndirizzoResp15: TQRShape;
    Redbox_IndirizzoResp16: TQRShape;
    Redbox_IndirizzoResp17: TQRShape;
    Redbox_IndirizzoResp18: TQRShape;
    Redbox_IndirizzoResp19: TQRShape;
    Redbox_IndirizzoResp20: TQRShape;
    Redbox_IndirizzoResp21: TQRShape;
    Redbox_IndirizzoResp22: TQRShape;
    Redbox_IndirizzoResp23: TQRShape;
    Redbox_IndirizzoResp24: TQRShape;
    Redbox_IndirizzoResp25: TQRShape;
    Redbox_IndirizzoResp26: TQRShape;
    Redbox_IndirizzoResp27: TQRShape;
    Redbox_IndirizzoResp36: TQRShape;
    Redbox_IndirizzoResp35: TQRShape;
    Redbox_IndirizzoResp34: TQRShape;
    Redbox_IndirizzoResp33: TQRShape;
    Redbox_IndirizzoResp32: TQRShape;
    Redbox_IndirizzoResp31: TQRShape;
    Redbox_IndirizzoResp30: TQRShape;
    Redbox_IndirizzoResp29: TQRShape;
    Redbox_IndirizzoResp28: TQRShape;
    Redbox_CivicoResp3: TQRShape;
    Redbox_CivicoResp2: TQRShape;
    Redbox_CivicoResp1: TQRShape;
    Redbox_CivicoResp6: TQRShape;
    RedLabel_CivicoRespImp: TQRLabel;
    Redbox_CivicoResp5: TQRShape;
    Redbox_CivicoResp4: TQRShape;
    Redbox_PianoResp1: TQRShape;
    Redbox_PianoResp2: TQRShape;
    Redbox_InternoResp3: TQRShape;
    Redbox_InternoResp2: TQRShape;
    Redbox_InternoResp1: TQRShape;
    QRLabel7: TQRLabel;
    RedLabel_InternoRespImp: TQRLabel;
    Redbox_InternoResp4: TQRShape;
    Redbox_Costruttore1: TQRShape;
    Redbox_Costruttore2: TQRShape;
    Redbox_Costruttore3: TQRShape;
    Redbox_Costruttore4: TQRShape;
    Redbox_Costruttore5: TQRShape;
    Redbox_Costruttore6: TQRShape;
    Redbox_Costruttore7: TQRShape;
    Redbox_Costruttore8: TQRShape;
    Redbox_Costruttore9: TQRShape;
    Redbox_Costruttore10: TQRShape;
    Redbox_Costruttore11: TQRShape;
    Redbox_Costruttore12: TQRShape;
    Redbox_Modello1: TQRShape;
    Redbox_Modello2: TQRShape;
    Redbox_Modello3: TQRShape;
    Redbox_Modello4: TQRShape;
    Redbox_Modello5: TQRShape;
    Redbox_Modello6: TQRShape;
    Redbox_Modello7: TQRShape;
    Redbox_Modello8: TQRShape;
    Redbox_Modello9: TQRShape;
    Redbox_Modello10: TQRShape;
    Redbox_Modello11: TQRShape;
    Redbox_Modello12: TQRShape;
    Redbox_Modello13: TQRShape;
    Redbox_Modello14: TQRShape;
    Redbox_Modello15: TQRShape;
    Redbox_Modello16: TQRShape;
    Redbox_Modello17: TQRShape;
    Redbox_Modello18: TQRShape;
    Redbox_Modello19: TQRShape;
    Redbox_Matricola1: TQRShape;
    Redbox_Matricola2: TQRShape;
    Redbox_Matricola3: TQRShape;
    Redbox_Matricola4: TQRShape;
    Redbox_Matricola5: TQRShape;
    Redbox_Matricola6: TQRShape;
    Redbox_Matricola7: TQRShape;
    Redbox_Matricola8: TQRShape;
    Redbox_Matricola9: TQRShape;
    Redbox_Matricola10: TQRShape;
    Redbox_Matricola11: TQRShape;
    Redbox_Matricola12: TQRShape;
    Redbox_Matricola13: TQRShape;
    Redbox_Matricola14: TQRShape;
    Redbox_Matricola15: TQRShape;
    Redbox_Matricola16: TQRShape;
    Redbox_Matricola17: TQRShape;
    Redbox_Matricola18: TQRShape;
    Redbox_Matricola19: TQRShape;
    Redbox_EffEnerg1: TQRShape;
    Redbox_AnnoCostr1: TQRShape;
    Redbox_AnnoCostr2: TQRShape;
    Redbox_AnnoCostr3: TQRShape;
    Redbox_AnnoCostr4: TQRShape;
    Redbox_PotTermNomUt1: TQRShape;
    RedLabel_PotTermNomUt: TQRLabel;
    Redbox_PotTermNomUt3: TQRShape;
    Redbox_PotTermNomUt2: TQRShape;
    Redbox_DataInst1: TQRShape;
    QRLabel11: TQRLabel;
    RedLabel_DataInst1: TQRLabel;
    Redbox_DataInst3: TQRShape;
    Redbox_DataInst2: TQRShape;
    Redbox_DataInst6: TQRShape;
    QRLabel13: TQRLabel;
    RedLabel_DataInst2: TQRLabel;
    Redbox_DataInst5: TQRShape;
    Redbox_DataInst4: TQRShape;
    Redbox_DataInst7: TQRShape;
    Redbox_DataInst8: TQRShape;
    Redbox_LocaleInst14: TQRShape;
    Redbox_LocaleInst13: TQRShape;
    Redbox_LocaleInst12: TQRShape;
    Redbox_LocaleInst11: TQRShape;
    Redbox_LocaleInst10: TQRShape;
    Redbox_LocaleInst9: TQRShape;
    Redbox_LocaleInst8: TQRShape;
    Redbox_LocaleInst7: TQRShape;
    Redbox_LocaleInst6: TQRShape;
    Redbox_LocaleInst5: TQRShape;
    Redbox_LocaleInst4: TQRShape;
    Redbox_LocaleInst3: TQRShape;
    Redbox_LocaleInst2: TQRShape;
    Redbox_LocaleInst1: TQRShape;
    Redbox_CarbAltro14: TQRShape;
    Redbox_CarbAltro13: TQRShape;
    Redbox_CarbAltro12: TQRShape;
    Redbox_CarbAltro11: TQRShape;
    Redbox_CarbAltro10: TQRShape;
    Redbox_CarbAltro9: TQRShape;
    Redbox_CarbAltro8: TQRShape;
    Redbox_CarbAltro7: TQRShape;
    Redbox_CarbAltro6: TQRShape;
    Redbox_CarbAltro5: TQRShape;
    Redbox_CarbAltro4: TQRShape;
    Redbox_CarbAltro3: TQRShape;
    Redbox_CarbAltro2: TQRShape;
    Redbox_CarbAltro1: TQRShape;
    Redbox_TempFumi3: TQRShape;
    Redbox_TempFumi2: TQRShape;
    Redbox_TempFumi1: TQRShape;
    RedLabel_TempFumi: TQRLabel;
    Redbox_TempFumi4: TQRShape;
    Redbox_TempAmb3: TQRShape;
    Redbox_TempAmb2: TQRShape;
    Redbox_TempAmb1: TQRShape;
    RedLabel_TempAmb: TQRLabel;
    Redbox_TempAmb4: TQRShape;
    Redbox_OO2: TQRShape;
    Redbox_OO1: TQRShape;
    RedLabel_OO: TQRLabel;
    Redbox_OO3: TQRShape;
    Redbox_COO2: TQRShape;
    Redbox_COO1: TQRShape;
    RedLabel_COO: TQRLabel;
    Redbox_COO3: TQRShape;
    Redbox_Bachrach3: TQRShape;
    Redbox_Bachrach2: TQRShape;
    Redbox_Bachrach1: TQRShape;
    Redbox_CO3: TQRShape;
    Redbox_CO2: TQRShape;
    Redbox_CO1: TQRShape;
    Redbox_CO4: TQRShape;
    Redbox_RendComb2: TQRShape;
    Redbox_RendComb1: TQRShape;
    RedLabel_RendComb: TQRLabel;
    Redbox_RendComb3: TQRShape;
    Redbox_Tiraggio3: TQRShape;
    Redbox_Tiraggio2: TQRShape;
    Redbox_Tiraggio1: TQRShape;
    Redbox_Osserv7: TQRShape;
    Redbox_Osserv8: TQRShape;
    Redbox_Osserv9: TQRShape;
    Redbox_Osserv10: TQRShape;
    Redbox_Osserv11: TQRShape;
    Redbox_Osserv12: TQRShape;
    Redbox_Osserv1: TQRShape;
    Redbox_Osserv2: TQRShape;
    Redbox_Osserv3: TQRShape;
    Redbox_Osserv4: TQRShape;
    Redbox_Osserv5: TQRShape;
    Redbox_Osserv6: TQRShape;
    Redbox_Osserv15: TQRShape;
    Redbox_Osserv16: TQRShape;
    Redbox_Osserv17: TQRShape;
    Redbox_Osserv18: TQRShape;
    Redbox_Osserv19: TQRShape;
    Redbox_Osserv20: TQRShape;
    Redbox_Osserv13: TQRShape;
    Redbox_Osserv14: TQRShape;
    Redbox_Osserv27: TQRShape;
    Redbox_Osserv28: TQRShape;
    Redbox_Osserv29: TQRShape;
    Redbox_Osserv30: TQRShape;
    Redbox_Osserv31: TQRShape;
    Redbox_Osserv32: TQRShape;
    Redbox_Osserv21: TQRShape;
    Redbox_Osserv22: TQRShape;
    Redbox_Osserv23: TQRShape;
    Redbox_Osserv24: TQRShape;
    Redbox_Osserv25: TQRShape;
    Redbox_Osserv26: TQRShape;
    Redbox_Osserv35: TQRShape;
    Redbox_Osserv36: TQRShape;
    Redbox_Osserv37: TQRShape;
    Redbox_Osserv38: TQRShape;
    Redbox_Osserv39: TQRShape;
    Redbox_Osserv40: TQRShape;
    Redbox_Osserv33: TQRShape;
    Redbox_Osserv34: TQRShape;
    Redbox_Osserv41: TQRShape;
    Redbox_Osserv42: TQRShape;
    Redbox_Osserv43: TQRShape;
    Redbox_Osserv44: TQRShape;
    Redbox_Osserv45: TQRShape;
    Redbox_Osserv46: TQRShape;
    Redbox_Osserv47: TQRShape;
    Redbox_Osserv48: TQRShape;
    Redbox_Osserv49: TQRShape;
    Redbox_Osserv50: TQRShape;
    Redbox_Osserv51: TQRShape;
    Redbox_Osserv52: TQRShape;
    Redbox_Osserv53: TQRShape;
    Redbox_Osserv54: TQRShape;
    Redbox_Osserv55: TQRShape;
    Redbox_Osserv56: TQRShape;
    Redbox_Osserv57: TQRShape;
    Redbox_Osserv58: TQRShape;
    Redbox_Osserv59: TQRShape;
    Redbox_Osserv60: TQRShape;
    Redbox_Osserv61: TQRShape;
    Redbox_Osserv62: TQRShape;
    Redbox_Osserv63: TQRShape;
    Redbox_Osserv64: TQRShape;
    Redbox_Osserv65: TQRShape;
    Redbox_Osserv66: TQRShape;
    Redbox_Osserv67: TQRShape;
    Redbox_Osserv68: TQRShape;
    Redbox_Osserv69: TQRShape;
    Redbox_Osserv70: TQRShape;
    Redbox_Osserv71: TQRShape;
    Redbox_Osserv72: TQRShape;
    Redbox_Osserv73: TQRShape;
    Redbox_Osserv74: TQRShape;
    Redbox_Osserv75: TQRShape;
    Redbox_Osserv76: TQRShape;
    Redbox_Osserv77: TQRShape;
    Redbox_Osserv78: TQRShape;
    Redbox_Osserv79: TQRShape;
    Redbox_Osserv80: TQRShape;
    Redbox_Osserv81: TQRShape;
    Redbox_Osserv82: TQRShape;
    Redbox_Osserv83: TQRShape;
    Redbox_Osserv84: TQRShape;
    Redbox_Osserv85: TQRShape;
    Redbox_Osserv86: TQRShape;
    Redbox_Osserv87: TQRShape;
    Redbox_Osserv88: TQRShape;
    Redbox_Osserv89: TQRShape;
    Redbox_Osserv90: TQRShape;
    Redbox_Osserv91: TQRShape;
    Redbox_Osserv92: TQRShape;
    Redbox_Osserv93: TQRShape;
    Redbox_Osserv94: TQRShape;
    Redbox_Osserv102: TQRShape;
    Redbox_Osserv103: TQRShape;
    Redbox_Osserv104: TQRShape;
    Redbox_Osserv105: TQRShape;
    Redbox_Osserv106: TQRShape;
    Redbox_Osserv107: TQRShape;
    Redbox_Osserv108: TQRShape;
    Redbox_Osserv109: TQRShape;
    Redbox_Osserv110: TQRShape;
    Redbox_Osserv111: TQRShape;
    Redbox_Osserv112: TQRShape;
    Redbox_Osserv113: TQRShape;
    Redbox_Osserv114: TQRShape;
    Redbox_Osserv115: TQRShape;
    Redbox_Osserv116: TQRShape;
    Redbox_Osserv117: TQRShape;
    Redbox_Osserv118: TQRShape;
    Redbox_Osserv120: TQRShape;
    Redbox_Osserv121: TQRShape;
    Redbox_Osserv122: TQRShape;
    Redbox_Osserv123: TQRShape;
    Redbox_Osserv124: TQRShape;
    Redbox_Osserv125: TQRShape;
    Redbox_Osserv95: TQRShape;
    Redbox_Osserv96: TQRShape;
    Redbox_Osserv97: TQRShape;
    Redbox_Osserv98: TQRShape;
    Redbox_Osserv99: TQRShape;
    Redbox_Osserv100: TQRShape;
    Redbox_Osserv101: TQRShape;
    Redbox_Racc1: TQRShape;
    Redbox_Racc2: TQRShape;
    Redbox_Racc3: TQRShape;
    Redbox_Racc4: TQRShape;
    Redbox_Racc5: TQRShape;
    Redbox_Racc6: TQRShape;
    Redbox_Racc7: TQRShape;
    Redbox_Racc8: TQRShape;
    Redbox_Racc9: TQRShape;
    Redbox_Racc10: TQRShape;
    Redbox_Racc11: TQRShape;
    Redbox_Racc12: TQRShape;
    Redbox_Racc13: TQRShape;
    Redbox_Racc14: TQRShape;
    Redbox_Racc15: TQRShape;
    Redbox_Racc16: TQRShape;
    Redbox_Racc17: TQRShape;
    Redbox_Racc18: TQRShape;
    Redbox_Racc19: TQRShape;
    Redbox_Racc20: TQRShape;
    Redbox_Racc21: TQRShape;
    Redbox_Racc22: TQRShape;
    Redbox_Racc23: TQRShape;
    Redbox_Racc24: TQRShape;
    Redbox_Racc51: TQRShape;
    Redbox_Racc52: TQRShape;
    Redbox_Racc53: TQRShape;
    Redbox_Racc54: TQRShape;
    Redbox_Racc55: TQRShape;
    Redbox_Racc56: TQRShape;
    Redbox_Racc57: TQRShape;
    Redbox_Racc58: TQRShape;
    Redbox_Racc59: TQRShape;
    Redbox_Racc60: TQRShape;
    Redbox_Racc61: TQRShape;
    Redbox_Racc62: TQRShape;
    Redbox_Racc63: TQRShape;
    Redbox_Racc64: TQRShape;
    Redbox_Racc65: TQRShape;
    Redbox_Racc66: TQRShape;
    Redbox_Racc67: TQRShape;
    Redbox_Racc68: TQRShape;
    Redbox_Racc69: TQRShape;
    Redbox_Racc70: TQRShape;
    Redbox_Racc71: TQRShape;
    Redbox_Racc72: TQRShape;
    Redbox_Racc73: TQRShape;
    Redbox_Racc74: TQRShape;
    Redbox_Racc44: TQRShape;
    Redbox_Racc45: TQRShape;
    Redbox_Racc46: TQRShape;
    Redbox_Racc47: TQRShape;
    Redbox_Racc48: TQRShape;
    Redbox_Racc49: TQRShape;
    Redbox_Racc50: TQRShape;
    Redbox_Racc101: TQRShape;
    Redbox_Racc102: TQRShape;
    Redbox_Racc103: TQRShape;
    Redbox_Racc104: TQRShape;
    Redbox_Racc105: TQRShape;
    Redbox_Racc106: TQRShape;
    Redbox_Racc107: TQRShape;
    Redbox_Racc108: TQRShape;
    Redbox_Racc109: TQRShape;
    Redbox_Racc110: TQRShape;
    Redbox_Racc111: TQRShape;
    Redbox_Racc112: TQRShape;
    Redbox_Racc113: TQRShape;
    Redbox_Racc114: TQRShape;
    Redbox_Racc115: TQRShape;
    Redbox_Racc116: TQRShape;
    Redbox_Racc117: TQRShape;
    Redbox_Racc118: TQRShape;
    Redbox_Racc119: TQRShape;
    Redbox_Racc120: TQRShape;
    Redbox_Racc121: TQRShape;
    Redbox_Racc122: TQRShape;
    Redbox_Racc123: TQRShape;
    Redbox_Racc124: TQRShape;
    Redbox_Racc94: TQRShape;
    Redbox_Racc95: TQRShape;
    Redbox_Racc96: TQRShape;
    Redbox_Racc97: TQRShape;
    Redbox_Racc98: TQRShape;
    Redbox_Racc99: TQRShape;
    Redbox_Racc100: TQRShape;
    Redbox_Presc3: TQRShape;
    Redbox_Presc4: TQRShape;
    Redbox_Presc5: TQRShape;
    Redbox_Presc6: TQRShape;
    Redbox_Presc7: TQRShape;
    Redbox_Presc8: TQRShape;
    Redbox_Presc9: TQRShape;
    Redbox_Presc10: TQRShape;
    Redbox_Presc11: TQRShape;
    Redbox_Presc12: TQRShape;
    Redbox_Presc13: TQRShape;
    Redbox_Presc14: TQRShape;
    Redbox_Presc15: TQRShape;
    Redbox_Presc16: TQRShape;
    Redbox_Presc17: TQRShape;
    Redbox_Presc18: TQRShape;
    Redbox_Presc19: TQRShape;
    Redbox_Presc20: TQRShape;
    Redbox_Presc21: TQRShape;
    Redbox_Presc22: TQRShape;
    Redbox_Presc23: TQRShape;
    Redbox_Presc24: TQRShape;
    Redbox_Presc25: TQRShape;
    Redbox_Presc26: TQRShape;
    Redbox_Presc53: TQRShape;
    Redbox_Presc54: TQRShape;
    Redbox_Presc55: TQRShape;
    Redbox_Presc56: TQRShape;
    Redbox_Presc57: TQRShape;
    Redbox_Presc58: TQRShape;
    Redbox_Presc59: TQRShape;
    Redbox_Presc60: TQRShape;
    Redbox_Presc61: TQRShape;
    Redbox_Presc62: TQRShape;
    Redbox_Presc63: TQRShape;
    Redbox_Presc64: TQRShape;
    Redbox_Presc65: TQRShape;
    Redbox_Presc66: TQRShape;
    Redbox_Presc67: TQRShape;
    Redbox_Presc68: TQRShape;
    Redbox_Presc69: TQRShape;
    Redbox_Presc70: TQRShape;
    Redbox_Presc71: TQRShape;
    Redbox_Presc72: TQRShape;
    Redbox_Presc73: TQRShape;
    Redbox_Presc74: TQRShape;
    Redbox_Presc75: TQRShape;
    Redbox_Presc76: TQRShape;
    Redbox_Presc46: TQRShape;
    Redbox_Presc47: TQRShape;
    Redbox_Presc48: TQRShape;
    Redbox_Presc49: TQRShape;
    Redbox_Presc50: TQRShape;
    Redbox_Presc51: TQRShape;
    Redbox_Presc52: TQRShape;
    Redbox_Presc103: TQRShape;
    Redbox_Presc104: TQRShape;
    Redbox_Presc105: TQRShape;
    Redbox_Presc106: TQRShape;
    Redbox_Presc107: TQRShape;
    Redbox_Presc108: TQRShape;
    Redbox_Presc109: TQRShape;
    Redbox_Presc110: TQRShape;
    Redbox_Presc111: TQRShape;
    Redbox_Presc112: TQRShape;
    Redbox_Presc113: TQRShape;
    Redbox_Presc114: TQRShape;
    Redbox_Presc115: TQRShape;
    Redbox_Presc116: TQRShape;
    Redbox_Presc117: TQRShape;
    Redbox_Presc118: TQRShape;
    Redbox_Presc119: TQRShape;
    Redbox_Presc120: TQRShape;
    Redbox_Presc121: TQRShape;
    Redbox_Presc122: TQRShape;
    Redbox_Presc123: TQRShape;
    Redbox_Presc124: TQRShape;
    Redbox_Presc125: TQRShape;
    Redbox_Presc126: TQRShape;
    Redbox_Presc96: TQRShape;
    Redbox_Presc97: TQRShape;
    Redbox_Presc98: TQRShape;
    Redbox_Presc99: TQRShape;
    Redbox_Presc100: TQRShape;
    Redbox_Presc101: TQRShape;
    Redbox_Presc102: TQRShape;
    Redbox_Tecnico8: TQRShape;
    Redbox_Tecnico9: TQRShape;
    Redbox_Tecnico10: TQRShape;
    Redbox_Tecnico11: TQRShape;
    Redbox_Tecnico12: TQRShape;
    Redbox_Tecnico13: TQRShape;
    Redbox_Tecnico14: TQRShape;
    Redbox_Tecnico15: TQRShape;
    Redbox_Tecnico16: TQRShape;
    Redbox_Tecnico17: TQRShape;
    Redbox_Tecnico18: TQRShape;
    Redbox_Tecnico19: TQRShape;
    Redbox_Tecnico20: TQRShape;
    Redbox_Tecnico21: TQRShape;
    Redbox_Tecnico22: TQRShape;
    Redbox_Tecnico23: TQRShape;
    Redbox_Tecnico24: TQRShape;
    Redbox_Tecnico25: TQRShape;
    Redbox_Tecnico26: TQRShape;
    Redbox_Tecnico27: TQRShape;
    Redbox_Tecnico28: TQRShape;
    Redbox_Tecnico29: TQRShape;
    Redbox_Tecnico30: TQRShape;
    Redbox_Tecnico31: TQRShape;
    Redbox_Tecnico1: TQRShape;
    Redbox_Tecnico2: TQRShape;
    Redbox_Tecnico3: TQRShape;
    Redbox_Tecnico4: TQRShape;
    Redbox_Tecnico5: TQRShape;
    Redbox_Tecnico6: TQRShape;
    Redbox_Tecnico7: TQRShape;
    Redbox_EstrDocQual1: TQRShape;
    Redbox_EstrDocQual2: TQRShape;
    Redbox_EstrDocQual3: TQRShape;
    Redbox_EstrDocQual4: TQRShape;
    Redbox_EstrDocQual5: TQRShape;
    Redbox_EstrDocQual6: TQRShape;
    Redbox_EstrDocQual7: TQRShape;
    Redbox_EstrDocQual8: TQRShape;
    Redbox_EstrDocQual9: TQRShape;
    Redbox_EstrDocQual10: TQRShape;
    Redbox_EstrDocQual11: TQRShape;
    Redbox_EstrDocQual12: TQRShape;
    Redbox_EstrDocQual13: TQRShape;
    Redbox_EstrDocQual14: TQRShape;
    Redbox_EstrDocQual15: TQRShape;
    Redbox_EstrDocQual16: TQRShape;
    Redbox_EstrDocQual17: TQRShape;
    Redbox_EstrDocQual18: TQRShape;
    Redbox_OraArrivo1: TQRShape;
    Redbox_OraArrivo2: TQRShape;
    RedLabel_OraArrivo: TQRLabel;
    Redbox_OraArrivo3: TQRShape;
    Redbox_Presc1: TQRShape;
    Redbox_Presc2: TQRShape;
    Redbox_OraArrivo4: TQRShape;
    Redbox_OraPart1: TQRShape;
    Redbox_OraPart2: TQRShape;
    RedLabel_OraPartenza: TQRLabel;
    Redbox_OraPart4: TQRShape;
    Redbox_OraPart3: TQRShape;
    Redbox_Osserv126: TQRShape;
    Redbox_Osserv127: TQRShape;
    Redbox_Osserv128: TQRShape;
    Redbox_Osserv129: TQRShape;
    Redbox_Osserv130: TQRShape;
    Redbox_Osserv131: TQRShape;
    Redbox_Osserv132: TQRShape;
    Redbox_Osserv133: TQRShape;
    Redbox_Osserv134: TQRShape;
    Redbox_Osserv135: TQRShape;
    Redbox_Osserv136: TQRShape;
    Redbox_Osserv137: TQRShape;
    Redbox_Osserv138: TQRShape;
    Redbox_Osserv139: TQRShape;
    Redbox_Osserv140: TQRShape;
    Redbox_Osserv141: TQRShape;
    Redbox_Osserv142: TQRShape;
    Redbox_Osserv143: TQRShape;
    Redbox_Osserv144: TQRShape;
    Redbox_Racc25: TQRShape;
    Redbox_Racc26: TQRShape;
    Redbox_Racc27: TQRShape;
    Redbox_Racc28: TQRShape;
    Redbox_Racc29: TQRShape;
    Redbox_Racc30: TQRShape;
    Redbox_Racc31: TQRShape;
    Redbox_Racc32: TQRShape;
    Redbox_Racc33: TQRShape;
    Redbox_Racc34: TQRShape;
    Redbox_Racc35: TQRShape;
    Redbox_Racc36: TQRShape;
    Redbox_Racc37: TQRShape;
    Redbox_Racc38: TQRShape;
    Redbox_Racc39: TQRShape;
    Redbox_Racc40: TQRShape;
    Redbox_Racc41: TQRShape;
    Redbox_Racc42: TQRShape;
    Redbox_Racc43: TQRShape;
    Redbox_Racc75: TQRShape;
    Redbox_Racc76: TQRShape;
    Redbox_Racc77: TQRShape;
    Redbox_Racc78: TQRShape;
    Redbox_Racc79: TQRShape;
    Redbox_Racc80: TQRShape;
    Redbox_Racc81: TQRShape;
    Redbox_Racc82: TQRShape;
    Redbox_Racc83: TQRShape;
    Redbox_Racc84: TQRShape;
    Redbox_Racc85: TQRShape;
    Redbox_Racc86: TQRShape;
    Redbox_Racc87: TQRShape;
    Redbox_Racc88: TQRShape;
    Redbox_Racc89: TQRShape;
    Redbox_Racc90: TQRShape;
    Redbox_Racc91: TQRShape;
    Redbox_Racc92: TQRShape;
    Redbox_Racc93: TQRShape;
    Redbox_Racc125: TQRShape;
    Redbox_Racc126: TQRShape;
    Redbox_Racc127: TQRShape;
    Redbox_Racc128: TQRShape;
    Redbox_Racc129: TQRShape;
    Redbox_Racc130: TQRShape;
    Redbox_Racc131: TQRShape;
    Redbox_Racc132: TQRShape;
    Redbox_Racc133: TQRShape;
    Redbox_Racc134: TQRShape;
    Redbox_Racc135: TQRShape;
    Redbox_Racc136: TQRShape;
    Redbox_Racc137: TQRShape;
    Redbox_Racc138: TQRShape;
    Redbox_Racc139: TQRShape;
    Redbox_Racc140: TQRShape;
    Redbox_Racc141: TQRShape;
    Redbox_Racc142: TQRShape;
    Redbox_Racc143: TQRShape;
    Redbox_Presc27: TQRShape;
    Redbox_Presc28: TQRShape;
    Redbox_Presc29: TQRShape;
    Redbox_Presc30: TQRShape;
    Redbox_Presc31: TQRShape;
    Redbox_Presc32: TQRShape;
    Redbox_Presc33: TQRShape;
    Redbox_Presc34: TQRShape;
    Redbox_Presc35: TQRShape;
    Redbox_Presc36: TQRShape;
    Redbox_Presc37: TQRShape;
    Redbox_Presc38: TQRShape;
    Redbox_Presc39: TQRShape;
    Redbox_Presc40: TQRShape;
    Redbox_Presc41: TQRShape;
    Redbox_Presc42: TQRShape;
    Redbox_Presc43: TQRShape;
    Redbox_Presc44: TQRShape;
    Redbox_Presc45: TQRShape;
    Redbox_Presc77: TQRShape;
    Redbox_Presc78: TQRShape;
    Redbox_Presc79: TQRShape;
    Redbox_Presc80: TQRShape;
    Redbox_Presc81: TQRShape;
    Redbox_Presc82: TQRShape;
    Redbox_Presc83: TQRShape;
    Redbox_Presc84: TQRShape;
    Redbox_Presc85: TQRShape;
    Redbox_Presc86: TQRShape;
    Redbox_Presc87: TQRShape;
    Redbox_Presc88: TQRShape;
    Redbox_Presc89: TQRShape;
    Redbox_Presc90: TQRShape;
    Redbox_Presc91: TQRShape;
    Redbox_Presc92: TQRShape;
    Redbox_Presc93: TQRShape;
    Redbox_Presc94: TQRShape;
    Redbox_Presc95: TQRShape;
    Redbox_Presc127: TQRShape;
    Redbox_Presc128: TQRShape;
    Redbox_Presc129: TQRShape;
    Redbox_Presc130: TQRShape;
    Redbox_Presc131: TQRShape;
    Redbox_Presc132: TQRShape;
    Redbox_Presc133: TQRShape;
    Redbox_Presc134: TQRShape;
    Redbox_Presc135: TQRShape;
    Redbox_Presc136: TQRShape;
    Redbox_Presc137: TQRShape;
    Redbox_Presc138: TQRShape;
    Redbox_Presc139: TQRShape;
    Redbox_Presc140: TQRShape;
    Redbox_Presc141: TQRShape;
    Redbox_Presc142: TQRShape;
    Redbox_Presc143: TQRShape;
    Redbox_Presc144: TQRShape;
    Redbox_Presc145: TQRShape;
    Redbox_Tecnico32: TQRShape;
    Redbox_Tecnico33: TQRShape;
    Redbox_Tecnico34: TQRShape;
    Redbox_Tecnico35: TQRShape;
    Redbox_Tecnico36: TQRShape;
    Redbox_Tecnico37: TQRShape;
    Redbox_Tecnico38: TQRShape;
    Redbox_Tecnico39: TQRShape;
    Redbox_Tecnico40: TQRShape;
    Redbox_Tecnico41: TQRShape;
    Redbox_Tecnico42: TQRShape;
    Redbox_Tecnico43: TQRShape;
    Redbox_Tecnico44: TQRShape;
    Redbox_Tecnico45: TQRShape;
    Redbox_Tecnico46: TQRShape;
    Redbox_Tecnico47: TQRShape;
    Redbox_Tecnico48: TQRShape;
    Redbox_Tecnico49: TQRShape;
    Redbox_Tecnico50: TQRShape;
    RedCheckBox_Proprietario: TQRShape;
    RedCheckBox_Occupante: TQRShape;
    RedCheckBox_TerzpResponsabile: TQRShape;
    RedCheckBox_Amministratore: TQRShape;
    RedCheckBox_TipoB: TQRShape;
    RedCheckBox_TipoC: TQRShape;
    RedCheckBox_TiraggioNaturale: TQRShape;
    RedCheckBox_TiraggioForzato: TQRShape;
    RedCheckBox_DestUsoRiscaldamento: TQRShape;
    RedCheckBox_DestUsoAcquaCaldaSanit: TQRShape;
    RedCheckBox_CombGasDiRete: TQRShape;
    RedCheckBox_CombGasolio: TQRShape;
    RedCheckBox_CombGpl: TQRShape;
    RedCheckBox_CombAltro: TQRShape;
    RedCheckBox_FluidoVettAcqua: TQRShape;
    RedCheckBox_FluidoVettAria: TQRShape;
    RedCheckBox_B1_SI: TQRShape;
    RedCheckBox_B1_NO: TQRShape;
    RedCheckBox_B1_NC: TQRShape;
    QRShape803: TQRShape;
    RedCheckBox_B2_SI: TQRShape;
    RedCheckBox_B2_NO: TQRShape;
    RedCheckBox_B2_NC: TQRShape;
    QRShape807: TQRShape;
    RedCheckBox_B3_SI: TQRShape;
    RedCheckBox_B3_NO: TQRShape;
    RedCheckBox_B3_NC: TQRShape;
    QRShape811: TQRShape;
    RedCheckBox_C1_SI: TQRShape;
    RedCheckBox_C1_NO: TQRShape;
    RedCheckBox_C1_NC: TQRShape;
    QRShape815: TQRShape;
    RedCheckBox_C2_SI: TQRShape;
    RedCheckBox_C2_NO: TQRShape;
    RedCheckBox_C2_NC: TQRShape;
    QRShape819: TQRShape;
    RedCheckBox_C3_SI: TQRShape;
    RedCheckBox_C3_NO: TQRShape;
    RedCheckBox_C3_NC: TQRShape;
    QRShape823: TQRShape;
    RedCheckBox_D1_SI: TQRShape;
    RedCheckBox_D1_NO: TQRShape;
    RedCheckBox_D1_NC: TQRShape;
    QRShape827: TQRShape;
    RedCheckBox_D2_SI: TQRShape;
    RedCheckBox_D2_NO: TQRShape;
    RedCheckBox_D2_NC: TQRShape;
    QRShape831: TQRShape;
    RedCheckBox_D3_SI: TQRShape;
    RedCheckBox_D3_NO: TQRShape;
    RedCheckBox_D3_NC: TQRShape;
    QRShape835: TQRShape;
    RedCheckBox_D4_SI: TQRShape;
    RedCheckBox_D4_NO: TQRShape;
    RedCheckBox_D4_NC: TQRShape;
    QRShape839: TQRShape;
    RedCheckBox_D5_SI: TQRShape;
    RedCheckBox_D5_NO: TQRShape;
    RedCheckBox_D5_NC: TQRShape;
    QRShape843: TQRShape;
    RedCheckBox_E1_SI: TQRShape;
    RedCheckBox_E1_NO: TQRShape;
    RedCheckBox_E1_NC: TQRShape;
    QRShape847: TQRShape;
    RedCheckBox_E2_SI: TQRShape;
    RedCheckBox_E2_NO: TQRShape;
    RedCheckBox_E2_NC: TQRShape;
    QRShape851: TQRShape;
    RedCheckBox_E3_SI: TQRShape;
    RedCheckBox_E3_NO: TQRShape;
    RedCheckBox_E3_NC: TQRShape;
    QRShape855: TQRShape;
    RedCheckBox_E4_SI: TQRShape;
    RedCheckBox_E4_NO: TQRShape;
    RedCheckBox_E4_NC: TQRShape;
    QRShape859: TQRShape;
    RedCheckBox_F1_SI: TQRShape;
    RedCheckBox_F1_NO: TQRShape;
    RedCheckBox_F1_NC: TQRShape;
    QRShape863: TQRShape;
    RedCheckBox_F2_SI: TQRShape;
    RedCheckBox_F2_NO: TQRShape;
    RedCheckBox_F2_NC: TQRShape;
    QRShape867: TQRShape;
    RedCheckBox_F3_SI: TQRShape;
    RedCheckBox_F3_NO: TQRShape;
    RedCheckBox_F3_NC: TQRShape;
    QRShape871: TQRShape;
    RedCheckBox_F4_SI: TQRShape;
    RedCheckBox_F4_NO: TQRShape;
    RedCheckBox_F4_NC: TQRShape;
    QRShape875: TQRShape;
    RedCheckBox_F5_SI: TQRShape;
    RedCheckBox_F5_NO: TQRShape;
    RedCheckBox_F5_NC: TQRShape;
    QRShape879: TQRShape;
    RedCheckBox_F6_SI: TQRShape;
    RedCheckBox_F6_NO: TQRShape;
    RedCheckBox_F6_NC: TQRShape;
    QRShape883: TQRShape;
    RedCheckBox_F7_SI: TQRShape;
    RedCheckBox_F7_NO: TQRShape;
    RedCheckBox_F7_NC: TQRShape;
    QRShape887: TQRShape;
    RedCheckBox_F8_SI: TQRShape;
    RedCheckBox_F8_NO: TQRShape;
    RedCheckBox_F8_NC: TQRShape;
    QRShape891: TQRShape;
    RedCheckBox_F9_SI: TQRShape;
    RedCheckBox_F9_NO: TQRShape;
    RedCheckBox_F9_NC: TQRShape;
    QRShape895: TQRShape;
    RedCheckBox_F10_SI: TQRShape;
    RedCheckBox_F10_NO: TQRShape;
    RedCheckBox_F10_NC: TQRShape;
    QRShape899: TQRShape;
    RedCheckBox_F11_SI: TQRShape;
    RedCheckBox_F11_NO: TQRShape;
    RedCheckBox_F11_NC: TQRShape;
    QRShape903: TQRShape;
    RedCheckBox_F12_SI: TQRShape;
    RedCheckBox_F12_NO: TQRShape;
    RedCheckBox_F12_NC: TQRShape;
    QRShape907: TQRShape;
    RedCheckBox_G1_P: TQRShape;
    RedCheckBox_G1_N: TQRShape;
    RedCheckBox_G1_NA: TQRShape;
    QRShape911: TQRShape;
    RedCheckBox_G2_P: TQRShape;
    RedCheckBox_G2_N: TQRShape;
    RedCheckBox_G2_NA: TQRShape;
    QRShape915: TQRShape;
    RedCheckBox_G3_P: TQRShape;
    RedCheckBox_G3_N: TQRShape;
    RedCheckBox_G3_NA: TQRShape;
    QRShape919: TQRShape;
    Redbox_DataControllo1: TQRShape;
    Redbox_DataControllo2: TQRShape;
    Redbox_DataControllo4: TQRShape;
    QRLabel21: TQRLabel;
    RedLabel_DataControllo1: TQRLabel;
    Redbox_DataControllo6: TQRShape;
    QRLabel23: TQRLabel;
    RedLabel_DataControllo2: TQRLabel;
    Redbox_DataControllo7: TQRShape;
    Redbox_DataControllo8: TQRShape;
    Redbox_DataControllo3: TQRShape;
    Redbox_DataControllo5: TQRShape;
    QRShape928: TQRShape;
    RedCheckBox_AnFumiSI: TQRShape;
    RedCheckBox_AnFumiNO: TQRShape;
    RedCheckBox_PuoFunzSI: TQRShape;
    RedCheckBox_PuoFunzNO: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    RedBox_FirmaTecnico: TQRShape;
    RedBox_FirmaRespImp: TQRShape;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    Redbox_Osserv119: TQRShape;
    ImageIntestazione: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure WinControlForm_2Create(Sender: TObject);
  private
    { Private declarations }
    // Loghi del documento
    IntestazBMP: TBitmap;
    fEmpty: Boolean;
  public
    { Public declarations }
    property Empty:Boolean read fEmpty write fEmpty;
  end;

var
  AllegatoGVanzQR: TAllegatoGVanzQR;

implementation

uses FormAllegatiFG, DataModule1, IniFiles;

{$R *.dfm}

procedure TAllegatoGVanzQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  Combustibile, CombustibileAltro: String;
  LO : TMemIniFile;
begin
  inherited;

  // Inizializzazione
  IntestazBMP := TBitMap.Create;

  // Determinazione del combustibile da usare poi nei campi sotto
  //  NB: Faccio socì perchè ci sono dei valori da me che nel modulo non ci sono
  if not Empty then begin
    Combustibile        := AllegatiFGForm.QryAllGENCAL_COMBUSTIBILE.AsString;
    CombustibileAltro   := AllegatiFGForm.QryAllGENCAL_COMBUSTIBILEALTRO.AsString;
    if (Combustibile <> 'Gas di rete') and (Combustibile <> 'GPL') and (Combustibile <> 'Gasolio') and (Combustibile <> 'Altro') then begin
      CombustibileAltro := Combustibile;
      Combustibile := 'Altro';
    end;
  end;


  // ===========================================================================
  // INIZIO CARICAMENTO LOGO
  // ---------------------------------------------------------------------------
  // Apre il file con le impostazioni dei loghi
  LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
  try
    ImageIntestazione.Width  := LO.ReadInteger('Allegato G', 'LargIntestazione', 30);
    ImageIntestazione.Height := LO.ReadInteger('Allegato G', 'AltIntestazione', 30);
    ImageIntestazione.Left := RedBox_Logo.Left + 2;
    ImageIntestazione.Top := RedBox_Logo.Top + 2;
    if ImageIntestazione.Width > RedBox_Logo.Width - 4 then ImageIntestazione.Width := RedBox_Logo.Width - 4;
    if ImageIntestazione.Height > RedBox_Logo.Height - 4 then ImageIntestazione.Height := RedBox_Logo.Height - 4;
    if LO.ReadBool('Allegato G', 'AbilitaStampaIntestazione', True) and FileExists(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger('Foglio di lavoro', 'LayoutDocumento', 1)) + '.bmp') then begin
       IntestazBMP.LoadFromFile(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger('Allegato G', 'LayoutDocumento', 1)) + '.bmp');
       ImageIntestazione.Enabled := True;
    end else ImageIntestazione.Enabled := False;
  // Pulizie finali
  finally
    // Chiude il file con le impostazioni dei loghi
    LO.Free;
  end;
  // ---------------------------------------------------------------------------
  // FINE CARICAMENTO LOGO
  // ===========================================================================


  // Se non deve essere stampato vuoto
  if Empty then Exit;


  // ===========================================================================
  // INIZIO STAMPA CAMPI NORMALI
  // ---------------------------------------------------------------------------
  // Immobile
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_ComuneInst', AllegatiFGForm.QryAllCOMUNEIMM.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_ProvinciaImm', AllegatiFGForm.QryAllPROVINCIAIMM.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_CodCatasto', AllegatiFGForm.QryAllCODICECATASTO.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_indirizzoImm', AllegatiFGForm.QryAllINDIRIZZOIMM.AsString);
  RedBox_PutSlashedStringValue(Self, QRBand1, 'Redbox_CivicoImm', AllegatiFGForm.QryAllNUMCIVICOIMM.AsString, 4);
  RedBox_PutRightAlignedString(Self, QRBand1, 'Redbox_PianoImm', AllegatiFGForm.QryAllPIANOIMM.AsString, 2);
  RedBox_PutSlashedStringValue(Self, QRBand1, 'Redbox_InternoImm', AllegatiFGForm.QryAllINTERNOIMM.AsString, 3);
  // Responsabile dell'impianto
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_RagSocResp', AllegatiFGForm.QryAllRAGSOCRESPIMP.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_TelefonoResp', AllegatiFGForm.QryAllTELEFONORESPIMP.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_IndirizzoResp', AllegatiFGForm.QryAllINDIRIZZORESPIMP.AsString);
  RedBox_PutSlashedStringValue(Self, QRBand1, 'Redbox_CivicoResp', AllegatiFGForm.QryAllNUMCIVICORESPIMP.AsString, 4);
//  RedBox_PutRightAlignedString(Self, QRBand1, 'Redbox_PianoResp', AllegatiFGForm.QryAllPIANORESP.AsString, 2);
//  RedBox_PutSlashedStringValue(Self, QRBand1, 'Redbox_InternoResp', AllegatiFGForm.QryAllINTERNORESP.AsString, 3);
  // Apparecchio
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Costruttore', AllegatiFGForm.QryAllGENCAL_COSTRUTTORE.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Modello', AllegatiFGForm.QryAllGENCAL_MODELLO.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Matricola', AllegatiFGForm.QryAllGENCAL_MATRICOLA.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_EffEnerg', AllegatiFGForm.QryAllGENCAL_MARCAEFFICENERGETICA.AsString);
  RedBox_PutRightAlignedString(Self, QRBand1, 'Redbox_AnnoCostr', AllegatiFGForm.QryAllGENCAL_ANNOCOSTRUZIONE.AsString, 4);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_PotTermNomUt', AllegatiFGForm.QryAllGENCAL_POTENZATERMICA.AsFloat, 1, 3);
  RedBox_PutDateValue(Self, QRBand1, 'Redbox_DataInst', AllegatiFGForm.QryAllGENCAL_DATAINSTALLAZIONE.AsDateTime);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_LocaleInst', AllegatiFGForm.QryAllGENCAL_UBICAZIONE.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_CarbAltro', CombustibileAltro);
  // Analisi fumi
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_TempFumi', AllegatiFGForm.QryAllANFUMI_TEMPFUMI.AsFloat, 1, 4);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_TempAmb', AllegatiFGForm.QryAllANFUMI_TEMPAMBIENTE.AsFloat, 1, 4);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_OO', AllegatiFGForm.QryAllANFUMI_O2_PERC.AsFloat, 1, 3);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_COO', AllegatiFGForm.QryAllANFUMI_CO2_PERC.AsFloat, 1, 3);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_Bachrach', AllegatiFGForm.QryAllANFUMI_BACHARACH_NUM.AsFloat, 0, 3);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_CO', AllegatiFGForm.QryAllANFUMI_CO_PPM.AsFloat, 0, 4);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_RendComb', AllegatiFGForm.QryAllANFUMI_RENDIMENTO_PERC.AsFloat, 1, 3);
  RedBox_PutNumericValue(Self, QRBand1, 'Redbox_Tiraggio', AllegatiFGForm.QryAllANFUMI_TIRAGGIO_PA.AsFloat, 0, 3);
  // Osservazioni, Raccomandazioni, Prescrizioni
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Osserv', AllegatiFGForm.QryAllOSSERVAZIONI.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Racc', AllegatiFGForm.QryAllRACCOMANDAZIONI.AsString);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Presc', AllegatiFGForm.QryAllPRESCRIZIONI.AsString);
  // Rapporto intervento
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_Tecnico', ComponiCampoTecnico);
  RedBox_PutStringValue(Self, QRBand1, 'Redbox_EstrDocQual', AllegatiFGForm.QryAllTECNICO_ESTREMIDOCQUALIFICA.AsString);
  RedBox_PutDateValue(Self, QRBand1, 'Redbox_DataControllo', AllegatiFGForm.QryAllDATACONTROLLO.AsDateTime);
  RedBox_PutTimeValue(Self, QRBand1, 'Redbox_OraArrivo', AllegatiFGForm.QryAllDATAORAARRIVO.AsDateTime);
  RedBox_PutTimeValue(Self, QRBand1, 'Redbox_OraPart', AllegatiFGForm.QryAllDATAORAPARTENZA.AsDateTime);
  // ---------------------------------------------------------------------------
  // FINE STAMPA CAMPI NORMALI
  // ===========================================================================



  // ===========================================================================
  // INIZIO STAMPA CHECKS
  // ---------------------------------------------------------------------------
  // Responsabile in qualità di...
  if      AllegatiFGForm.QryAllINQUALITADIRESPIMP.AsString = 'Proprietario'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_Proprietario)
  else if AllegatiFGForm.QryAllINQUALITADIRESPIMP.AsString = 'Occupante'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_Occupante)
  else if AllegatiFGForm.QryAllINQUALITADIRESPIMP.AsString = 'Terzo responsabile'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_TerzpResponsabile)
  else if AllegatiFGForm.QryAllINQUALITADIRESPIMP.AsString = 'Amministratore'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_Amministratore);

  //Tipo camera
  if      AllegatiFGForm.QryAllGENCAL_TIPOCAMERA.AsString = 'Tipo B'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_TipoB)
  else if AllegatiFGForm.QryAllGENCAL_TIPOCAMERA.AsString = 'Tipo C'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_TipoC);

  //Tiraggio
  if      AllegatiFGForm.QryAllGENCAL_TIPOTIRAGGIO.AsString = 'Naturale'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_TiraggioNaturale)
  else if AllegatiFGForm.QryAllGENCAL_TIPOTIRAGGIO.AsString = 'Forzato'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_TiraggioForzato);

  //Destinazione d'uso
  if AllegatiFGForm.QryAllGENCAL_RISCALDAMENTO.AsString  = 'T' then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_DestUsoRiscaldamento);
  if AllegatiFGForm.QryAllGENCAL_ACQUASANITARIA.AsString = 'T' then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_DestUsoAcquaCaldaSanit);

  // Combustibile
  if      Combustibile = 'Gas di rete'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_CombGasDiRete)
  else if Combustibile = 'GPL'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_CombGpl)
  else if Combustibile = 'Gasolio'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_CombGasolio)
  else if Combustibile = 'Altro'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_CombAltro);

  // Fluido termovettore
  if      Uppercase(Trim(AllegatiFGForm.QryAllGENCAL_FLUIDOTERMOVETTORE.AsString)) = 'ACQUA'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_FluidoVettAcqua)
  else if Uppercase(Trim(AllegatiFGForm.QryAllGENCAL_FLUIDOTERMOVETTORE.AsString)) = 'ARIA'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_FluidoVettAria);

  // Analisi fumi effettuata
  if      AllegatiFGForm.QryAllANFUMI_EFFETTUATO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_AnFumiSI)
  else if AllegatiFGForm.QryAllANFUMI_EFFETTUATO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_AnFumiNO);

  // L'impianto può funzionare
  if      AllegatiFGForm.QryAllIMPPUOFUNZIONARE.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_PuoFunzSI)
  else if AllegatiFGForm.QryAllIMPPUOFUNZIONARE.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_PuoFunzNO);

  // ---------------------------------------------------------------------------
  // B1
  if      AllegatiFGForm.QryAllB_DICHCONFIMP.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B1_SI)
  else if AllegatiFGForm.QryAllB_DICHCONFIMP.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B1_NO)
  else if AllegatiFGForm.QryAllB_DICHCONFIMP.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B1_NC);
  // B2
  if      AllegatiFGForm.QryAllB_LIBRETTOIMPIANTO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B2_SI)
  else if AllegatiFGForm.QryAllB_LIBRETTOIMPIANTO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B2_NO)
  else if AllegatiFGForm.QryAllB_LIBRETTOIMPIANTO.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B2_NC);
  // B3
  if      AllegatiFGForm.QryAllB_LIBRUSOCALD.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B3_SI)
  else if AllegatiFGForm.QryAllB_LIBRUSOCALD.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B3_NO)
  else if AllegatiFGForm.QryAllB_LIBRUSOCALD.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_B3_NC);
  // ----------
  // C1
  if      AllegatiFGForm.QryAllC_IDONLOCALEINSTALLAZ.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C1_SI)
  else if AllegatiFGForm.QryAllC_IDONLOCALEINSTALLAZ.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C1_NO)
  else if AllegatiFGForm.QryAllC_IDONLOCALEINSTALLAZ.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C1_NC);
  // C2
  if      AllegatiFGForm.QryAllC_ADEGDIMENSVENTILAZ.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C2_SI)
  else if AllegatiFGForm.QryAllC_ADEGDIMENSVENTILAZ.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C2_NO)
  else if AllegatiFGForm.QryAllC_ADEGDIMENSVENTILAZ.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C2_NC);
  // C3
  if      AllegatiFGForm.QryAllC_APERTVENTILAZLIBERE.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C3_SI)
  else if AllegatiFGForm.QryAllC_APERTVENTILAZLIBERE.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C3_NO)
  else if AllegatiFGForm.QryAllC_APERTVENTILAZLIBERE.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_C3_NC);
  // ----------
  // D1
  if      AllegatiFGForm.QryAllD_PENDENZACORRETTA.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D1_SI)
  else if AllegatiFGForm.QryAllD_PENDENZACORRETTA.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D1_NO)
  else if AllegatiFGForm.QryAllD_PENDENZACORRETTA.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D1_NC);
  // D2
  if      AllegatiFGForm.QryAllD_SEZIONICORRETTE.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D2_SI)
  else if AllegatiFGForm.QryAllD_SEZIONICORRETTE.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D2_NO)
  else if AllegatiFGForm.QryAllD_SEZIONICORRETTE.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D2_NC);
  // D3
  if      AllegatiFGForm.QryAllD_CURVECORRETTE.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D3_SI)
  else if AllegatiFGForm.QryAllD_CURVECORRETTE.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D3_NO)
  else if AllegatiFGForm.QryAllD_CURVECORRETTE.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D3_NC);
  // D4
  if      AllegatiFGForm.QryAllD_LUNGHEZZACORRETTA.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D4_SI)
  else if AllegatiFGForm.QryAllD_LUNGHEZZACORRETTA.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D4_NO)
  else if AllegatiFGForm.QryAllD_LUNGHEZZACORRETTA.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D4_NC);
  // D5
  if      AllegatiFGForm.QryAllD_BUONOSTATOCONSERVAZ.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D5_SI)
  else if AllegatiFGForm.QryAllD_BUONOSTATOCONSERVAZ.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D5_NO)
  else if AllegatiFGForm.QryAllD_BUONOSTATOCONSERVAZ.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_D5_NC);
  // ----------
  // E1  NB: E' diverso dagli altri perchè nell'allegato standard sono due righe diverse mentre Vanzolini le ha unite in una unica riga
  if AllegatiFGForm.QryAllE_SCARICOCAMINOSINGOLO.AsString     = 'T' then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E1_SI);
  if AllegatiFGForm.QryAllE_SCARICOCANNAFUMCOLLRAMIF.AsString = 'T' then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E1_NO);
  // E2
  if      AllegatiFGForm.QryAllE_APPSCARICAAPARETE.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E2_SI)
  else if AllegatiFGForm.QryAllE_APPSCARICAAPARETE.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E2_NO)
  else if AllegatiFGForm.QryAllE_APPSCARICAAPARETE.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E2_NC);
  // E3
  if      AllegatiFGForm.QryAllE_NORIFLUSSIFUMILOCALE.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E3_SI)
  else if AllegatiFGForm.QryAllE_NORIFLUSSIFUMILOCALE.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E3_NO)
  else if AllegatiFGForm.QryAllE_NORIFLUSSIFUMILOCALE.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E3_NC);
  // E4
  if      AllegatiFGForm.QryAllE_NOPERDITECONDOTTISCARICO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E4_SI)
  else if AllegatiFGForm.QryAllE_NOPERDITECONDOTTISCARICO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E4_NO)
  else if AllegatiFGForm.QryAllE_NOPERDITECONDOTTISCARICO.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_E4_NC);
  // ----------
  // F1
  if      AllegatiFGForm.QryAllF_UGELLIPULITI.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F1_SI)
  else if AllegatiFGForm.QryAllF_UGELLIPULITI.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F1_NO)
  else if AllegatiFGForm.QryAllF_UGELLIPULITI.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F1_NC);
  // F2
  if      AllegatiFGForm.QryAllF_DISPROMPITIRAGGIONODETERIOR.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F2_SI)
  else if AllegatiFGForm.QryAllF_DISPROMPITIRAGGIONODETERIOR.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F2_NO)
  else if AllegatiFGForm.QryAllF_DISPROMPITIRAGGIONODETERIOR.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F2_NC);
  // F3
  if      AllegatiFGForm.QryAllF_SCAMBLATOFUMOPULITO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F3_SI)
  else if AllegatiFGForm.QryAllF_SCAMBLATOFUMOPULITO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F3_NO)
  else if AllegatiFGForm.QryAllF_SCAMBLATOFUMOPULITO.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F3_NC);
  // F4
  if      AllegatiFGForm.QryAllF_ACCENSFUNZAMREGOLARI.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F4_SI)
  else if AllegatiFGForm.QryAllF_ACCENSFUNZAMREGOLARI.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F4_NO)
  else if AllegatiFGForm.QryAllF_ACCENSFUNZAMREGOLARI.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F4_NC);
  // F5
  if      AllegatiFGForm.QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F5_SI)
  else if AllegatiFGForm.QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F5_NO)
  else if AllegatiFGForm.QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F5_NC);
  // F6
  if      AllegatiFGForm.QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F6_SI)
  else if AllegatiFGForm.QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F6_NO)
  else if AllegatiFGForm.QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F6_NC);
  // F7
  if      AllegatiFGForm.QryAllF_VALVOLASICUREZZASOVRAPRESS.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F7_SI)
  else if AllegatiFGForm.QryAllF_VALVOLASICUREZZASOVRAPRESS.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F7_NO)
  else if AllegatiFGForm.QryAllF_VALVOLASICUREZZASOVRAPRESS.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F7_NC);
  // F8
  if      AllegatiFGForm.QryAllF_VASOESPANSIONECARICO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F8_SI)
  else if AllegatiFGForm.QryAllF_VASOESPANSIONECARICO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F8_NO)
  else if AllegatiFGForm.QryAllF_VASOESPANSIONECARICO.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F8_NC);
  // F9
  if      AllegatiFGForm.QryAllF_DISPSICUREZZANONMANOMESSI.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F9_SI)
  else if AllegatiFGForm.QryAllF_DISPSICUREZZANONMANOMESSI.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F9_NO)
  else if AllegatiFGForm.QryAllF_DISPSICUREZZANONMANOMESSI.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F9_NC);
  // F10
  if      AllegatiFGForm.QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F10_SI)
  else if AllegatiFGForm.QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F10_NO)
  else if AllegatiFGForm.QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F10_NC);
  // F11
  if      AllegatiFGForm.QryAllF_CIRCUITOARIAPULITO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F11_SI)
  else if AllegatiFGForm.QryAllF_CIRCUITOARIAPULITO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F11_NO)
  else if AllegatiFGForm.QryAllF_CIRCUITOARIAPULITO.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F11_NC);
  // F12
  if      AllegatiFGForm.QryAllF_GUARNIZACCOPIAMINTEGRA.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F12_SI)
  else if AllegatiFGForm.QryAllF_GUARNIZACCOPIAMINTEGRA.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F12_NO)
  else if AllegatiFGForm.QryAllF_GUARNIZACCOPIAMINTEGRA.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_F12_NC);
  // ----------
  // G1
  if      AllegatiFGForm.QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G1_P)
  else if AllegatiFGForm.QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G1_N)
  else if AllegatiFGForm.QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G1_NA);
  // G2
  if      AllegatiFGForm.QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G2_P)
  else if AllegatiFGForm.QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G2_N)
  else if AllegatiFGForm.QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G2_NA);
  // G3
  if      AllegatiFGForm.QryAllG_ESAMEVISIVOCAMINO.AsString = 'T'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G3_P)
  else if AllegatiFGForm.QryAllG_ESAMEVISIVOCAMINO.AsString = 'F'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G3_N)
  else if AllegatiFGForm.QryAllG_ESAMEVISIVOCAMINO.AsString = 'N'
    then RedCheckBox_DrawChecked(QRBand1, RedCheckBox_G3_NA);

  // ---------------------------------------------------------------------------
  // FINE STAMPA CHECKS
  // ===========================================================================

end;

procedure TAllegatoGVanzQR.QuickRepAfterPrint(Sender: TObject);
begin
  inherited;
  // Distruzione
  if Assigned(IntestazBMP) then FreeAndNil(IntestazBMP);
end;

procedure TAllegatoGVanzQR.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
   R: TRect;
   XF, YF: Extended;
begin
  inherited;
// -----------------------------------------------------------------------------
   // Se la foto deve essere stampata...
   if (Sender.Height > 0) and (ImageIntestazione.Enabled) then begin
     // Memorizza i fattori di conversione delle coordinate
     XF := Sender.ParentReport.QRPrinter.XFactor;
     YF := Sender.ParentReport.QRPrinter.YFactor;
     // Calcola il TRect della zona su cui deve essere stampata la fotografia
     R.Left   := ConvCoord(Sender.Left+ImageIntestazione.Left, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
     R.Top    := ConvCoord(Sender.Top+ImageIntestazione.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
     R.Right  := R.Left + ConvCoord(ImageIntestazione.Width, XF);
     R.Bottom := R.Top + ConvCoord(ImageIntestazione.Height, YF);
     // Effettua il tracciamento
     Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, IntestazBMP);
   end;
// -----------------------------------------------------------------------------
end;

procedure TAllegatoGVanzQR.WinControlForm_2Create(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  Empty := False;
end;

end.
