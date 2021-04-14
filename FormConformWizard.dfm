inherited ConformWizardForm: TConformWizardForm
  Left = 500
  Top = 179
  Caption = 'ConformWizardForm'
  ClientHeight = 703
  ClientWidth = 785
  Color = clPurple
  ExplicitWidth = 785
  ExplicitHeight = 703
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Color = 15329769
    inherited WizardPageControl: TcxPageControl
      inherited TabWizard1: TcxTabSheet
        object Label157: TLabel [1]
          Left = 83
          Top = 48
          Width = 595
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'Creazione guidata'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label158: TLabel [2]
          Left = 83
          Top = 104
          Width = 595
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'Dichiarazione di Conformit'#224
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label159: TLabel [3]
          Left = 83
          Top = 160
          Width = 595
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'in 3 semplici passi'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label136: TLabel [4]
          Left = 91
          Top = 274
          Width = 400
          Height = 21
          AutoSize = False
          Caption = 'Istruzioni'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label137: TLabel [5]
          Left = 75
          Top = 448
          Width = 595
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'Quando sei pronto clicca su "Avanti" per cominciare'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object RichEdit1: TRichEdit
          Tag = -1
          Left = 91
          Top = 306
          Width = 575
          Height = 119
          TabStop = False
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            
              'Levante ti guider'#224' nella compilazione di una nuova Dichiarazione' +
              ' di Conformit'#224' ponendoti delle '
            'semplici domande.'
            ''
            
              'Quando avrai risposto alle domande proposte clicca su "Avanti" p' +
              'er avanzare al passo '
            'successivo oppure su "Indietro" per tornare al passo precedente.')
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        Color = 15329769
        ImageIndex = 1
        ParentColor = False
        DesignSize = (
          686
          563)
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 69
          Height = 563
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = '2'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -64
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label139: TLabel
          Tag = -1
          Left = 121
          Top = 483
          Width = 544
          Height = 32
          AutoSize = False
          Caption = '(Clicca ul tipo di impianto desiderato e poi su "Avanti")'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object Panel1: TPanel
          Left = 579
          Top = 529
          Width = 100
          Height = 27
          Anchors = [akRight, akBottom]
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 1
          object BtnAvanti2: TSpeedButton
            Left = 1
            Top = 2
            Width = 96
            Height = 21
            Cursor = crHandPoint
            Caption = 'Avanti >>'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BtnAvanti1Click
          end
        end
        object Panel2: TPanel
          Left = 76
          Top = 529
          Width = 100
          Height = 27
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 2
          object SpeedButton2: TSpeedButton
            Left = 1
            Top = 2
            Width = 96
            Height = 21
            Cursor = crHandPoint
            Caption = '<< Indietro'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BtnIndietro1Click
          end
        end
        object RichEdit2: TRichEdit
          Tag = -1
          Left = 83
          Top = 10
          Width = 575
          Height = 20
          TabStop = False
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Che tipo di impianto si '#232' realizzato?')
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object CBTipoImpianto: TcxListBox
          Left = 120
          Top = 40
          Width = 553
          Height = 441
          ItemHeight = 16
          ParentFont = False
          Style.StyleController = DM1.WizardStyleController
          TabOrder = 0
          OnDblClick = CBTipoImpiantoDblClick
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'cxTabSheet2'
        Color = 15329769
        ImageIndex = 2
        ParentColor = False
        DesignSize = (
          686
          563)
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 69
          Height = 563
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = '3'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -64
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object RichEdit3: TRichEdit
          Tag = -1
          Left = 91
          Top = 50
          Width = 575
          Height = 359
          TabStop = False
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            
              'Levante ora '#232' pronto per la creazione automatica di una nuova Di' +
              'chiarazione di Conformit'#224' per '
            'un impianto di tipo'
            ''
            ''
            'come da te selezionato.'
            ''
            ''
            ''
            
              'Cliccando su "Crea la Dichiarazione di Conformit'#224'" Levante creer' +
              #224' automaticamente una nuova '
            
              'Dichiarazione di Conformit'#224' con alcuni dati mancanti. Completa i' +
              'l modulo con le informazioni '
            'necessarie per ottenere il documento finale.')
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object LabelTipoImpiantoSelezionato: TcxLabel
          Left = 88
          Top = 88
          AutoSize = False
          Caption = '- - -'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.StyleController = DM1.WizardStyleController
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Height = 20
          Width = 585
          AnchorX = 381
        end
        object Panel4: TPanel
          Left = 76
          Top = 529
          Width = 100
          Height = 27
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 0
          object SpeedButton4: TSpeedButton
            Left = 1
            Top = 2
            Width = 96
            Height = 21
            Cursor = crHandPoint
            Caption = '<< Indietro'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BtnIndietro1Click
          end
        end
        object RichEdit4: TRichEdit
          Tag = -1
          Left = 83
          Top = 10
          Width = 575
          Height = 20
          TabStop = False
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Riepilogo e istruzioni finali.')
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object Panel5: TPanel
          Left = 418
          Top = 529
          Width = 261
          Height = 27
          Anchors = [akRight, akBottom]
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 4
          object SpeedButton3: TSpeedButton
            Left = 1
            Top = 2
            Width = 256
            Height = 21
            Cursor = crHandPoint
            Caption = 'Crea la Dichiarazione di Conformit'#224
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BtnAvanti1Click
          end
        end
      end
    end
  end
  object ListBoxTimer: TTimer
    Interval = 100
    OnTimer = ListBoxTimerTimer
    Left = 464
    Top = 99
  end
end
