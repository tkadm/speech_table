object F_WorshipTablePeriod: TF_WorshipTablePeriod
  Left = 366
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1080#1086#1076' '#1075#1088#1072#1092#1080#1082#1072' '#1073#1086#1075#1086#1089#1083#1091#1078#1077#1085#1080#1081
  ClientHeight = 102
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    313
    102)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 66
    Height = 13
    Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089':'
  end
  object btnOK: TButton
    Left = 68
    Top = 70
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
    ExplicitLeft = 164
    ExplicitTop = 118
  end
  object btnCancel: TButton
    Left = 189
    Top = 70
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    ExplicitLeft = 285
    ExplicitTop = 118
  end
  object dtedDateFrom: TcxDateEdit
    Left = 181
    Top = 13
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    Width = 121
  end
end
