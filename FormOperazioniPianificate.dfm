inherited OperazioniPianificateForm: TOperazioniPianificateForm
  Left = 250
  Top = 338
  Caption = 'OperazioniPianificateForm'
  ClientHeight = 709
  ClientWidth = 810
  ExplicitWidth = 810
  ExplicitHeight = 709
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 636
    VertScrollBar.Range = 1000
    ExplicitHeight = 636
    object MainPageControl: TcxPageControl [0]
      Left = 0
      Top = 0
      Width = 670
      Height = 813
      Cursor = crHandPoint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Properties.ActivePage = TabOP
      Properties.CustomButtons.Buttons = <>
      Properties.NavigatorPosition = npLeftBottom
      Properties.Style = 9
      Properties.TabSlants.Positions = [spLeft, spRight]
      Properties.TabWidth = 150
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 813
      ClientRectRight = 670
      ClientRectTop = 19
      object TabOP: TcxTabSheet
        Caption = 'Operazione pianificata'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          670
          794)
        object PanelGruppo1: TPanel
          Left = 0
          Top = 14
          Width = 667
          Height = 216
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object LabelGruppo1: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 216
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            Caption = '1'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -64
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label4: TLabel
            Left = 110
            Top = 48
            Width = 32
            Height = 12
            Caption = 'Codice'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label1: TLabel
            Left = 290
            Top = 48
            Width = 56
            Height = 12
            Caption = 'Descrizione'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 110
            Top = 73
            Width = 59
            Height = 16
            AutoSize = False
            Caption = 'Periodicit'#224
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label3: TLabel
            Left = 236
            Top = 73
            Width = 35
            Height = 16
            AutoSize = False
            Caption = 'giorni'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label5: TLabel
            Left = 304
            Top = 73
            Width = 72
            Height = 12
            Caption = 'Minuti previsti'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label22: TLabel
            Left = 482
            Top = 73
            Width = 175
            Height = 12
            Caption = 'Da fare se entro                      giorni'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label7: TLabel
            Left = 132
            Top = 100
            Width = 33
            Height = 12
            Caption = 'Prezzo'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label9: TLabel
            Left = 281
            Top = 100
            Width = 31
            Height = 12
            Caption = 'Sconti'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label10: TLabel
            Left = 358
            Top = 98
            Width = 11
            Height = 16
            Caption = '+'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label11: TLabel
            Left = 417
            Top = 98
            Width = 11
            Height = 16
            Caption = '+'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label12: TLabel
            Left = 502
            Top = 100
            Width = 64
            Height = 12
            Caption = 'Prezzo netto'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label13: TLabel
            Left = 101
            Top = 125
            Width = 66
            Height = 12
            Caption = 'Aliquota IVA'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label14: TLabel
            Left = 429
            Top = 125
            Width = 137
            Height = 12
            Caption = 'Prezzo netto IVA compresa'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label15: TLabel
            Left = 101
            Top = 193
            Width = 64
            Height = 12
            Caption = 'Copie RCEE...'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object RichEdit1: TRichEdit
            Tag = -1
            Left = 83
            Top = 16
            Width = 534
            Height = 25
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              'Operazione pianificata')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            Zoom = 100
          end
          object DbeCodice: TDBEdit
            Left = 174
            Top = 46
            Width = 100
            Height = 21
            Cursor = crIBeam
            AutoSize = False
            Color = 16250871
            Ctl3D = False
            DataField = 'CODICE'
            DataSource = DS
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object DbeDescrizione: TDBEdit
            Left = 371
            Top = 46
            Width = 288
            Height = 21
            Cursor = crIBeam
            AutoSize = False
            Color = 16250871
            Ctl3D = False
            DataField = 'DESCRIZIONE'
            DataSource = DS
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object DbePeriodicita: TcxDBComboBox
            Left = 173
            Top = 70
            AutoSize = False
            DataBinding.DataField = 'PERIODICITA'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.Sorted = True
            Properties.OnInitPopup = DbePeriodicitaPropertiesInitPopup
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 23
            Width = 60
          end
          object DbeMinutiPrevisti: TDBEdit
            Left = 385
            Top = 71
            Width = 50
            Height = 21
            Cursor = crIBeam
            AutoSize = False
            Color = 16250871
            Ctl3D = False
            DataField = 'MINUTIPREVISTI'
            DataSource = DS
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit1: TDBEdit
            Left = 571
            Top = 71
            Width = 50
            Height = 21
            Cursor = crIBeam
            AutoSize = False
            Color = 16250871
            Ctl3D = False
            DataField = 'GG_AUTOSEL'
            DataSource = DS
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 5
          end
          object Button1: TButton
            Left = 288
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Button1'
            TabOrder = 6
            Visible = False
            OnClick = Button1Click
          end
          object Panel11: TPanel
            Left = 376
            Top = 4
            Width = 288
            Height = 21
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clSilver
            ParentBackground = False
            TabOrder = 7
            object sbAggiungiOpTutti: TSpeedButton
              Left = 1
              Top = 1
              Width = 284
              Height = 17
              Cursor = crHandPoint
              Caption = 'Aggiungi questa operazione pianificata a tutti gli impianti'
              Flat = True
              OnClick = sbAggiungiOpTuttiClick
            end
          end
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 169
            Top = 147
            Caption = 
              'Aggiungi/addebita alla sezione "Ricambi/Manodopera" negli interv' +
              'enti (quando eseguita)'
            DataBinding.DataField = 'ADDEBITA'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 15
          end
          object cxDBCheckBox2: TcxDBCheckBox
            Left = 169
            Top = 164
            Caption = 
              'Questa operazione '#232' compresa nell'#39'abbonamento/contratto (di soli' +
              'to)'
            DataBinding.DataField = 'INABBONAMENTO'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 16
          end
          object dbePrezzoUnitario: TcxDBCurrencyEdit
            Left = 173
            Top = 95
            AutoSize = False
            DataBinding.DataField = 'PRZUNIT'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 8
            Height = 23
            Width = 80
          end
          object dbeSconto1: TcxDBCurrencyEdit
            Left = 314
            Top = 95
            RepositoryItem = DM1.EdPropQta
            AutoSize = False
            DataBinding.DataField = 'SCONTO1'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 9
            Height = 23
            Width = 40
          end
          object dbeSconto2: TcxDBCurrencyEdit
            Left = 373
            Top = 95
            RepositoryItem = DM1.EdPropQta
            AutoSize = False
            DataBinding.DataField = 'SCONTO2'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 10
            Height = 23
            Width = 40
          end
          object dbeSconto3: TcxDBCurrencyEdit
            Left = 432
            Top = 95
            RepositoryItem = DM1.EdPropQta
            AutoSize = False
            DataBinding.DataField = 'SCONTO3'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 11
            Height = 23
            Width = 40
          end
          object dbePrzUnitNetto: TcxDBCurrencyEdit
            Tag = -1
            Left = 570
            Top = 95
            TabStop = False
            AutoSize = False
            DataBinding.DataField = 'PRZUNITNETTO'
            DataBinding.DataSource = DS
            ParentColor = True
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 12
            Height = 23
            Width = 90
          end
          object dbeCodiceIVA: TcxDBLookupComboBox
            Left = 173
            Top = 120
            AutoSize = False
            DataBinding.DataField = 'CODICEIVA'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownAutoSize = True
            Properties.DropDownRows = 20
            Properties.DropDownSizeable = True
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'CODICEIVA'
            Properties.ListColumns = <
              item
                Caption = 'Codice'
                Fixed = True
                HeaderAlignment = taCenter
                Width = 60
                FieldName = 'CODICEIVA'
              end
              item
                Caption = 'Descrizione'
                HeaderAlignment = taCenter
                FieldName = 'DESCRIZIONEIVA'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListOptions.GridLines = glVertical
            Properties.ListSource = DSIva
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 13
            Height = 23
            Width = 250
          end
          object dbePrzUnitNettoIvaComp: TcxDBCurrencyEdit
            Left = 570
            Top = 120
            AutoSize = False
            DataBinding.DataField = 'PRZUNITNETTOIVACOMP'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = False
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 14
            Height = 23
            Width = 90
          end
          object cxDBSpinEdit1: TcxDBSpinEdit
            Left = 173
            Top = 187
            DataBinding.DataField = 'COPIE'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.SpinButtons.Position = sbpHorzLeftRight
            Properties.UseLeftAlignmentOnEditing = False
            Style.BorderColor = clBlack
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.TextColor = clBlack
            Style.IsFontAssigned = True
            TabOrder = 17
            Width = 52
          end
        end
        object PanelGruppo2: TPanel
          Left = 0
          Top = 236
          Width = 667
          Height = 83
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          object Label6: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 83
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
            Transparent = False
            Layout = tlCenter
          end
          object RichEdit2: TRichEdit
            Tag = -1
            Left = 83
            Top = 16
            Width = 534
            Height = 25
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              'Applicabile ai tipi di impianto...')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Zoom = 100
          end
          object dbeApplicabile: TcxDBCheckComboBox
            Left = 80
            Top = 48
            DataBinding.DataField = 'TIPO'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.EmptySelectionText = 'Nessun tipo di impianto selezionato'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'Riscaldamento'
              end
              item
                Description = 'Centrale termica'
              end
              item
                Description = 'Climatizzazione'
              end
              item
                Description = 'Refrigerazione'
              end
              item
                Description = 'Generico'
              end>
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Text = 'Nessun tipo di impianto selezionato'
            Width = 577
          end
        end
        object PanelGruppo4: TPanel
          Left = 0
          Top = 641
          Width = 667
          Height = 148
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 3
          object LabelGruppo4: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 148
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            Caption = '4'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -64
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object RichEdit3: TRichEdit
            Tag = -1
            Left = 83
            Top = 16
            Width = 534
            Height = 25
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              'Annotazioni')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Zoom = 100
          end
          object cxDBMemo1: TcxDBMemo
            Left = 143
            Top = 50
            DataBinding.DataField = 'NOTE'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ScrollBars = ssVertical
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Height = 85
            Width = 497
          end
        end
        object PanelGruppo3: TPanel
          Left = 0
          Top = 329
          Width = 667
          Height = 302
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          object ShapeAggApp4: TShape
            Left = 114
            Top = 128
            Width = 540
            Height = 154
            Brush.Style = bsClear
          end
          object LabelGruppo3: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 302
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
            Transparent = False
            Layout = tlCenter
          end
          object LabelTitoloAggApparecchio1: TLabel
            Left = 99
            Top = 158
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '1'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio2: TLabel
            Left = 99
            Top = 182
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '2'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio3: TLabel
            Left = 99
            Top = 206
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '3'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio4: TLabel
            Left = 99
            Top = 230
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '4'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio5: TLabel
            Left = 99
            Top = 254
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '5'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio6: TLabel
            Left = 378
            Top = 158
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '6'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio7: TLabel
            Left = 378
            Top = 182
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '7'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio8: TLabel
            Left = 378
            Top = 206
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '8'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio9: TLabel
            Left = 378
            Top = 230
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '9'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTitoloAggApparecchio10: TLabel
            Left = 378
            Top = 254
            Width = 30
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = '10'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object ShapeAggApp1: TShape
            Left = 96
            Top = 98
            Width = 11
            Height = 1
          end
          object ShapeAggApp2: TShape
            Left = 95
            Top = 98
            Width = 1
            Height = 107
          end
          object LabelTitoloAggApparecchi: TLabel
            Left = 120
            Top = 132
            Width = 360
            Height = 12
            Caption = 
              'Aggiungi automaticamente alla creazione di uno dei seguenti appa' +
              'recchi'
            Color = clOlive
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object ShapeAggApp3: TShape
            Left = 95
            Top = 204
            Width = 20
            Height = 1
          end
          object dbeAggAutoOP: TcxDBRadioGroup
            Left = 104
            Top = 32
            DataBinding.DataField = 'AGGNUOVOIMPIANTO'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Caption = 'Non aggiungere in nessun caso.'
                Value = 'N'
              end
              item
                Caption = 
                  'Alla creazione di un nuovo impianto come voce generica NON legat' +
                  'a ad un apparecchio in particolare.'
                Value = 'I'
              end
              item
                Caption = 
                  'Quando aggiungo un apparecchio all'#39'impianto come voce SPECIFICA ' +
                  'dell'#39'apparecchio stesso.'
                Value = 'A'
              end>
            Properties.OnChange = cxDBRadioGroup1PropertiesChange
            Style.BorderStyle = ebsUltraFlat
            Style.Edges = []
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Height = 79
            Width = 529
          end
          object RichEdit4: TRichEdit
            Tag = -1
            Left = 83
            Top = 16
            Width = 534
            Height = 25
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              'Aggiungi automaticamente questa voce quando...')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            Zoom = 100
          end
          object dbeAggApparecchio1: TcxDBComboBox
            Left = 137
            Top = 155
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD1'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio2: TcxDBComboBox
            Left = 137
            Top = 179
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD2'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio3: TcxDBComboBox
            Left = 137
            Top = 203
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD3'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio4: TcxDBComboBox
            Left = 137
            Top = 227
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD4'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 4
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio5: TcxDBComboBox
            Left = 137
            Top = 251
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD5'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio6: TcxDBComboBox
            Left = 417
            Top = 155
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD6'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio7: TcxDBComboBox
            Left = 417
            Top = 179
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD7'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio8: TcxDBComboBox
            Left = 417
            Top = 203
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD8'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 8
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio9: TcxDBComboBox
            Left = 417
            Top = 227
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD9'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 9
            Height = 21
            Width = 228
          end
          object dbeAggApparecchio10: TcxDBComboBox
            Left = 417
            Top = 251
            AutoSize = False
            DataBinding.DataField = 'AUTOLOAD10'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              'Altro'
              'Bruciatore'
              'Generatore di calore'
              'Generatore di calore biomassa'
              'Macchina per freddo'
              'Monoblocco'
              'Pompa di circolazione'
              'Unit'#224' esterna'
              'Unit'#224' interna')
            Properties.Sorted = True
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 10
            Height = 21
            Width = 228
          end
          object Panel1: TPanel
            Left = 292
            Top = 51
            Width = 233
            Height = 17
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 12
            object Label8: TLabel
              Left = 3
              Top = 0
              Width = 228
              Height = 12
              Caption = '(si potr'#224' comunque aggiungere manualmente)'
              Color = clOlive
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
          end
        end
      end
      object TabOpDet: TcxTabSheet
        Caption = 'Scheda di lavorazione'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          670
          794)
        object PanelOP: TPanel
          Left = 0
          Top = 10
          Width = 665
          Height = 776
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            665
            776)
          object Bevel18: TBevel
            Left = -14
            Top = 774
            Width = 687
            Height = 2
            Anchors = [akLeft, akRight, akBottom]
            Style = bsRaised
          end
          object GridOPDet: TcxGrid
            Left = 10
            Top = 12
            Width = 643
            Height = 751
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clGray
            RootLevelOptions.DetailFrameWidth = 1
            object btvOPDet: TcxGridDBBandedTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DetailKeyFieldNames = 'ID'
              DataController.KeyFieldNames = 'ID'
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnSorting = False
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsData.Appending = True
              OptionsView.CellAutoHeight = True
              OptionsView.GridLineColor = 10066329
              OptionsView.GridLines = glVertical
              OptionsView.GroupByBox = False
              OptionsView.BandHeaders = False
              OptionsView.FixedBandSeparatorColor = 10066329
              Styles.ContentEven = DM1.tvContentEven
              Styles.ContentOdd = DM1.tvContentOdd
              Styles.StyleSheet = DM1.btvGCMaster
              Bands = <
                item
                  Caption = 'Codice'
                end
                item
                  Caption = 'Descrizione'
                end
                item
                  Caption = 'Minuti prev.'
                end
                item
                  Caption = 'Date'
                end
                item
                  Caption = 'Note'
                end
                item
                  Caption = 'Altro'
                  Visible = False
                end>
              object btvOPDetIDOP: TcxGridDBBandedColumn
                Caption = 'Codice'
                DataBinding.FieldName = 'IDOP'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 68
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPDetDESCRIZIONE: TcxGridDBBandedColumn
                Caption = 'Descrizione'
                DataBinding.FieldName = 'DESCRIZIONE'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 204
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPDetIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
                Caption = 'Apparecchio'
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.ImmediatePost = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 204
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvOPDetMINUTIPREVISTI: TcxGridDBBandedColumn
                Caption = 'Min.'
                DataBinding.FieldName = 'MINUTIPREVISTI'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 31
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPDetPERIODICITA: TcxGridDBBandedColumn
                Caption = 'Period.'
                DataBinding.FieldName = 'PERIODICITA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 59
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvOPDetULTIMA: TcxGridDBBandedColumn
                Caption = 'Ultima'
                DataBinding.FieldName = 'ULTIMA'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                HeaderAlignmentHorz = taCenter
                Width = 80
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPDetPROSSIMA: TcxGridDBBandedColumn
                Caption = 'Prox. entro'
                DataBinding.FieldName = 'PROSSIMA'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                HeaderAlignmentHorz = taCenter
                Width = 80
                Position.BandIndex = 3
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvOPDetNOTE: TcxGridDBBandedColumn
                Caption = 'Note'
                DataBinding.FieldName = 'NOTE'
                PropertiesClassName = 'TcxMemoProperties'
                HeaderAlignmentHorz = taCenter
                Width = 203
                Position.BandIndex = 4
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPDetID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Position.BandIndex = 5
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPDetIDPRATICA: TcxGridDBBandedColumn
                Caption = 'ID op. pratica'
                DataBinding.FieldName = 'IDPRATICA'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Position.BandIndex = 5
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
            end
            object lvOPDet: TcxGridLevel
              GridView = btvOPDet
            end
          end
        end
      end
    end
    inherited PanelGriglia: TPanel
      Top = 813
      Width = 669
      Height = 187
      ExplicitTop = 813
      ExplicitWidth = 670
      ExplicitHeight = 187
      inherited GridList: TcxGrid
        Width = 670
        Height = 187
        ExplicitWidth = 670
        ExplicitHeight = 187
        inherited tvList: TcxGridDBTableView
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
          OptionsCustomize.ColumnGrouping = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnHidingOnGrouping = True
          OptionsCustomize.ColumnHorzSizing = True
          OptionsCustomize.ColumnMoving = True
          OptionsView.ColumnAutoWidth = False
          OptionsView.DataRowHeight = 44
          OptionsView.GridLines = glBoth
          OptionsView.HeaderAutoHeight = True
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Selection = nil
          OnCustomDrawColumnHeader = nil
          object tvListCODICE: TcxGridDBColumn
            Caption = 'Codice'
            DataBinding.FieldName = 'CODICE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 60
          end
          object tvListDESCRIZIONE: TcxGridDBColumn
            Caption = 'Descrizione'
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 180
          end
          object tvListTIPO: TcxGridDBColumn
            Caption = 'Applica ai seguenti impianti'
            DataBinding.FieldName = 'TIPO'
            PropertiesClassName = 'TcxCheckComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Items = <>
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAGGNUOVOIMPIANTO: TcxGridDBColumn
            Caption = 'Aggiungi automaticamente a nuovo impianto o apparecchio'
            DataBinding.FieldName = 'AGGNUOVOIMPIANTO'
            PropertiesClassName = 'TcxRadioGroupProperties'
            Properties.Items = <
              item
                Caption = 'No'
                Value = 'N'
              end
              item
                Caption = 'Si  (generico impianto)'
                Value = 'I'
              end
              item
                Caption = 'Si  (specifico app.)'
                Value = 'A'
              end>
            HeaderAlignmentHorz = taCenter
            Width = 140
          end
          object tvListPERIODICITA: TcxGridDBColumn
            Caption = 'Periodicit'#224' (gg)'
            DataBinding.FieldName = 'PERIODICITA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object tvListGG_AUTOSEL: TcxGridDBColumn
            Caption = 'Giorni anticipo autosel.'
            DataBinding.FieldName = 'GG_AUTOSEL'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object tvListMINUTIPREVISTI: TcxGridDBColumn
            Caption = 'Minuti previsti'
            DataBinding.FieldName = 'MINUTIPREVISTI'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object tvListPRZUNIT: TcxGridDBColumn
            Caption = 'Prezzo'
            DataBinding.FieldName = 'PRZUNIT'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 55
          end
          object tvListADDEBITA: TcxGridDBColumn
            Caption = '+'
            DataBinding.FieldName = 'ADDEBITA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Options.HorzSizing = False
            Width = 16
          end
          object tvListINABBONAMENTO: TcxGridDBColumn
            Caption = 'Abb.'
            DataBinding.FieldName = 'INABBONAMENTO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.HorzSizing = False
            Width = 30
          end
          object tvListNOTE: TcxGridDBColumn
            Caption = 'Note'
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxMemoProperties'
            HeaderAlignmentHorz = taCenter
            Width = 250
          end
          object tvListAUTOLOAD1: TcxGridDBColumn
            Caption = 'Apparecchio 1'
            DataBinding.FieldName = 'AUTOLOAD1'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD2: TcxGridDBColumn
            Caption = 'Apparecchio 2'
            DataBinding.FieldName = 'AUTOLOAD2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD3: TcxGridDBColumn
            Caption = 'Apparecchio 3'
            DataBinding.FieldName = 'AUTOLOAD3'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD4: TcxGridDBColumn
            Caption = 'Apparecchio 4'
            DataBinding.FieldName = 'AUTOLOAD4'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD5: TcxGridDBColumn
            Caption = 'Apparecchio 5'
            DataBinding.FieldName = 'AUTOLOAD5'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD6: TcxGridDBColumn
            Caption = 'Apparecchio 6'
            DataBinding.FieldName = 'AUTOLOAD6'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD7: TcxGridDBColumn
            Caption = 'Apparecchio 7'
            DataBinding.FieldName = 'AUTOLOAD7'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD8: TcxGridDBColumn
            Caption = 'Apparecchio 8'
            DataBinding.FieldName = 'AUTOLOAD8'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD9: TcxGridDBColumn
            Caption = 'Apparecchio 9'
            DataBinding.FieldName = 'AUTOLOAD9'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvListAUTOLOAD10: TcxGridDBColumn
            Caption = 'Apparecchio 10'
            DataBinding.FieldName = 'AUTOLOAD10'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
        end
      end
    end
  end
  inherited Q: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM OP'
      'WHERE CODICE = :OLD_CODICE'
      '')
    EditSQL.Strings = (
      'UPDATE OP SET'
      ' CODICE = :CODICE,'
      ' DESCRIZIONE = :DESCRIZIONE,'
      ' NOTE = :NOTE,'
      ' COPIE = :COPIE,'
      ' PERIODICITA = :PERIODICITA,'
      ' MINUTIPREVISTI = :MINUTIPREVISTI,'
      ' AGGNUOVOIMPIANTO = :AGGNUOVOIMPIANTO,'
      ' TIPO = :TIPO,'
      ' SINCHRO = :SINCHRO,'
      ' AUTOLOAD1 = :AUTOLOAD1,'
      ' AUTOLOAD2 = :AUTOLOAD2,'
      ' AUTOLOAD3 = :AUTOLOAD3,'
      ' AUTOLOAD4 = :AUTOLOAD4,'
      ' AUTOLOAD5 = :AUTOLOAD5,'
      ' AUTOLOAD6 = :AUTOLOAD6,'
      ' AUTOLOAD7 = :AUTOLOAD7,'
      ' AUTOLOAD8 = :AUTOLOAD8,'
      ' AUTOLOAD9 = :AUTOLOAD9,'
      ' AUTOLOAD10 = :AUTOLOAD10,'
      ' GG_AUTOSEL = :GG_AUTOSEL,'
      ' ADDEBITA = :ADDEBITA,'
      ' INABBONAMENTO = :INABBONAMENTO,'
      ' PrzUnit = :PrzUnit,'
      ' Sconto1 = :Sconto1,'
      ' Sconto2 = :Sconto2,'
      ' Sconto3 = :Sconto3,'
      ' PrzUnitNetto = :PrzUnitNetto,'
      ' CodiceIva = :CodiceIva,'
      ' PrzUnitIvaComp = :PrzUnitIvaComp,'
      ' PrzUnitNettoIvaComp = :PrzUnitNettoIvaComp'
      ''
      'WHERE CODICE = :OLD_CODICE'
      ''
      '')
    SQL.Strings = (
      'SELECT * FROM OP')
    object QCODICE: TStringField
      FieldName = 'CODICE'
      Required = True
      Size = 25
    end
    object QDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
    end
    object QPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QMINUTIPREVISTI: TIntegerField
      FieldName = 'MINUTIPREVISTI'
    end
    object QAGGNUOVOIMPIANTO: TStringField
      FieldName = 'AGGNUOVOIMPIANTO'
      Size = 1
    end
    object QSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QAUTOLOAD1: TStringField
      FieldName = 'AUTOLOAD1'
      Size = 30
    end
    object QAUTOLOAD2: TStringField
      FieldName = 'AUTOLOAD2'
      Size = 30
    end
    object QAUTOLOAD3: TStringField
      FieldName = 'AUTOLOAD3'
      Size = 30
    end
    object QAUTOLOAD4: TStringField
      FieldName = 'AUTOLOAD4'
      Size = 30
    end
    object QAUTOLOAD5: TStringField
      FieldName = 'AUTOLOAD5'
      Size = 30
    end
    object QAUTOLOAD6: TStringField
      FieldName = 'AUTOLOAD6'
      Size = 30
    end
    object QAUTOLOAD7: TStringField
      FieldName = 'AUTOLOAD7'
      Size = 30
    end
    object QAUTOLOAD8: TStringField
      FieldName = 'AUTOLOAD8'
      Size = 30
    end
    object QAUTOLOAD9: TStringField
      FieldName = 'AUTOLOAD9'
      Size = 30
    end
    object QAUTOLOAD10: TStringField
      FieldName = 'AUTOLOAD10'
      Size = 30
    end
    object QGG_AUTOSEL: TSmallintField
      FieldName = 'GG_AUTOSEL'
    end
    object QTIPO: TStringField
      FieldName = 'TIPO'
      Size = 255
    end
    object QADDEBITA: TStringField
      FieldName = 'ADDEBITA'
      Size = 1
    end
    object QINABBONAMENTO: TStringField
      FieldName = 'INABBONAMENTO'
      Size = 1
    end
    object QPRZUNIT: TIBOFloatField
      FieldName = 'PRZUNIT'
      OnValidate = QPRZUNITValidate
      currency = True
    end
    object QSCONTO1: TIBOFloatField
      FieldName = 'SCONTO1'
      OnValidate = QPRZUNITValidate
    end
    object QSCONTO2: TIBOFloatField
      FieldName = 'SCONTO2'
      OnValidate = QPRZUNITValidate
    end
    object QSCONTO3: TIBOFloatField
      FieldName = 'SCONTO3'
      OnValidate = QPRZUNITValidate
    end
    object QPRZUNITNETTO: TIBOFloatField
      FieldName = 'PRZUNITNETTO'
    end
    object QCODICEIVA: TIntegerField
      FieldName = 'CODICEIVA'
      OnValidate = QPRZUNITValidate
    end
    object QPRZUNITIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITIVACOMP'
    end
    object QPRZUNITNETTOIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITNETTOIVACOMP'
      OnValidate = QPRZUNITNETTOIVACOMPValidate
    end
    object QSYSTEM: TStringField
      FieldName = 'SYSTEM'
      Size = 1
    end
    object QALIQUOTAIVA: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQUOTAIVA'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CODICEIVA'
      Lookup = True
    end
    object QCOPIE: TIntegerField
      FieldName = 'COPIE'
    end
  end
  inherited MenuGriglia: TPopupMenu
    object Aggiungitutteleoperazionipianificateatuttigliimpianti1: TMenuItem [0]
      Caption = 'Aggiungi tutte le operazioni pianificate a tutti gli impianti'
      OnClick = Aggiungitutteleoperazionipianificateatuttigliimpianti1Click
    end
    object N1: TMenuItem [1]
      Caption = '-'
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 42486.764626412030000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  object spAddOpToImpianti: TIBOStoredProc
    Params = <
      item
        DataType = ftString
        Name = 'IDOP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOIMPIANTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOAPPARECCHIO'
        ParamType = ptInput
      end>
    StoredProcHasDML = True
    StoredProcName = 'OP_ADDNEWOP_TO_IMPIANTI'
    IB_Connection = DM1.DBAzienda
    Left = 392
    Top = 38
  end
  object QryIva: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DeleteSQL.Strings = (
      'DELETE FROM OP'
      'WHERE CODICE = :OLD_CODICE'
      '')
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CODICEIVA, DESCRIZIONEIVA, ALIQUOTAIVA'
      'FROM ALIQIVA'
      'WHERE ENABLED = '#39'T'#39)
    Left = 194
    Top = 34
    object QryIvaCODICEIVA: TIntegerField
      FieldName = 'CODICEIVA'
      Required = True
    end
    object QryIvaDESCRIZIONEIVA: TStringField
      FieldName = 'DESCRIZIONEIVA'
      Size = 40
    end
    object QryIvaALIQUOTAIVA: TIBOFloatField
      FieldName = 'ALIQUOTAIVA'
    end
  end
  object DSIva: TDataSource
    AutoEdit = False
    DataSet = QryIva
    Left = 222
    Top = 34
  end
end
