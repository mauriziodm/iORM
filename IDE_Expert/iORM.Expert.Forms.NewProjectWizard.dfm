object frmIORMDMVCNewProject: TfrmIORMDMVCNewProject
  Left = 0
  Top = 0
  Caption = 'New iORM + DMVC Server Project Wizard'
  ClientHeight = 182
  ClientWidth = 431
  Color = clBtnFace
  Constraints.MinHeight = 145
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    431
    182)
  PixelsPerInch = 96
  TextHeight = 13
  object lblWbModule: TLabel
    Left = 24
    Top = 45
    Width = 114
    Height = 13
    Caption = 'WebModule Class Name'
  end
  object Label2: TLabel
    Left = 24
    Top = 95
    Width = 55
    Height = 13
    Caption = 'Server Port'
  end
  object btnOK: TButton
    Left = 267
    Top = 149
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 348
    Top = 149
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object chkAddToProjectGroup: TCheckBox
    Left = 24
    Top = 8
    Width = 415
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Add to Existing Project Group'
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object edtWebModuleName: TEdit
    Left = 24
    Top = 64
    Width = 385
    Height = 21
    TabOrder = 3
  end
  object edtServerPort: TEdit
    Left = 24
    Top = 114
    Width = 65
    Height = 21
    TabOrder = 4
    TextHint = '8080'
  end
end
