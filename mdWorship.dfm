object F_Worship: TF_Worship
  Left = 346
  Top = 305
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1041#1086#1075#1086#1089#1083#1091#1078#1077#1085#1080#1077
  ClientHeight = 87
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    335
    87)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 33
    Height = 13
    Caption = #1042#1088#1077#1084#1103
  end
  object btnCancel: TButton
    Left = 212
    Top = 54
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 91
    Top = 54
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object txedTime: TcxTextEdit
    Left = 53
    Top = 13
    TabOrder = 2
    Width = 271
  end
end
