object LeftSideForm: TLeftSideForm
  Left = 950
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'LeftSideForm'
  ClientHeight = 646
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Sfondo: TPanel
    Left = 0
    Top = 64
    Width = 211
    Height = 545
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 0
    object SfondoImg: TImage
      Left = 0
      Top = 0
      Width = 211
      Height = 545
      Align = alClient
      Stretch = True
      ExplicitWidth = 217
    end
  end
  object LabelStyleController: TcxEditStyleController
    Left = 40
    Top = 8
    PixelsPerInch = 96
  end
  object EditStyleController: TcxEditStyleController
    Style.BorderStyle = ebsNone
    Style.Color = 16762052
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.Gradient = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.Color = 10354687
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 144
    Top = 8
    PixelsPerInch = 96
  end
end
