object F_SermonSorts: TF_SermonSorts
  Left = 366
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1080#1076#1099' '#1087#1088#1086#1087#1086#1074#1077#1076#1077#1081
  ClientHeight = 82
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    385
    82)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 15
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object btnOK: TButton
    Left = 140
    Top = 50
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 261
    Top = 50
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object txedCaption: TcxTextEdit
    Left = 72
    Top = 12
    TabOrder = 2
    Width = 305
  end
end
