inherited PuzzleToolsGasForm: TPuzzleToolsGasForm
  Left = 299
  Caption = 'PuzzleToolsGasForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Sfondo: TPanel
    inherited cxPageControl1: TcxPageControl
      inherited TabDatiMateriali: TcxTabSheet
        inherited cxLabel35: TcxLabel
          Style.IsFontAssigned = True
        end
        inherited Mat_Riferimento: TcxTextEdit
          Style.IsFontAssigned = True
        end
        inherited Mat_Ubicazione: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited Mat_Componente: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited Mat_Materiale: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited Mat_Diametro: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited Mat_Installazione: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited Mat_Certificazione: TcxComboBox
          Style.IsFontAssigned = True
        end
      end
      inherited TabDatiApparecchi: TcxTabSheet
        inherited App_Riferimento: TcxTextEdit
          Style.IsFontAssigned = True
        end
        inherited App_Ubicazione: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_Componente: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_Tipo: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_Modello: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_TipoCollegamento: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_Installato: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_Ventilazione: TcxComboBox
          Style.IsFontAssigned = True
        end
        inherited App_Scarico: TcxComboBox
          Style.IsFontAssigned = True
        end
      end
    end
  end
  inherited LabelStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
end
