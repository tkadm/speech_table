object F_Graph: TF_Graph
  Left = 447
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1043#1088#1072#1092#1080#1082
  ClientHeight = 151
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    486
    151)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 36
    Width = 118
    Height = 13
    Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1087#1077#1088#1080#1086#1076#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 129
    Height = 13
    Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1087#1091#1089#1090#1099#1093' '#1089#1090#1088#1086#1082':'
  end
  object btnOK: TButton
    Left = 240
    Top = 116
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 361
    Top = 116
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 65
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1077#1088#1080#1086#1076#1072
    TabOrder = 2
    object spedYear: TcxSpinEdit
      Left = 8
      Top = 24
      Properties.MaxValue = 2099.000000000000000000
      Properties.MinValue = 2010.000000000000000000
      TabOrder = 0
      Value = 2010
      Width = 57
    end
    object cmbxMonths: TcxComboBox
      Left = 72
      Top = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
      TabOrder = 1
      Width = 121
    end
  end
  object cmbxPeriodLength: TcxComboBox
    Left = 360
    Top = 32
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '2 '#1084#1077#1089#1103#1094#1072
      '3 '#1084#1077#1089#1103#1094#1072)
    TabOrder = 3
    Text = '3 '#1084#1077#1089#1103#1094#1072
    Width = 121
  end
  object spedAddEmptyStrings: TcxSpinEdit
    Left = 144
    Top = 84
    Properties.MaxValue = 50.000000000000000000
    TabOrder = 4
    Width = 71
  end
  object chbxShowWorshipsAmount: TcxCheckBox
    Left = 237
    Top = 84
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1086#1083'-'#1074#1086' '#1089#1083#1091#1078#1077#1085#1080#1081
    TabOrder = 5
    Width = 177
  end
end
