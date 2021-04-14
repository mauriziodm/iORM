inherited ModelWizardForm: TModelWizardForm
  Left = 418
  Top = 122
  Caption = 'ModelWizardForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedButtonHelp: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonHelpClick
    end
  end
  inherited ClientArea: TScrollBox
    object WizardPageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 686
      Height = 586
      Cursor = crHandPoint
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = TabWizard1
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 6
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabSlants.Positions = [spLeft, spRight]
      TabSlants.Kind = skCutCorner
      TabSlants.Positions = [spLeft, spRight]
      ClientRectBottom = 586
      ClientRectRight = 686
      ClientRectTop = 23
      object TabWizard1: TcxTabSheet
        Caption = 'TabWizard1'
        Color = 15329769
        ImageIndex = 3
        ParentColor = False
        DesignSize = (
          686
          563)
        object LabelWzard1: TLabel
          Left = 0
          Top = 0
          Width = 69
          Height = 563
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
        object PanelAvanti1: TPanel
          Left = 579
          Top = 529
          Width = 100
          Height = 27
          Anchors = [akRight, akBottom]
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object BtnAvanti1: TSpeedButton
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
        object PanelIndietro1: TPanel
          Left = 76
          Top = 529
          Width = 100
          Height = 27
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          ParentBackground = False
          TabOrder = 1
          object BtnIndietro1: TSpeedButton
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
      end
    end
  end
end
