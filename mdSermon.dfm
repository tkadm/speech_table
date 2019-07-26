object F_Sermon: TF_Sermon
  Left = 366
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1087#1086#1074#1077#1076#1100
  ClientHeight = 77
  ClientWidth = 404
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
    404
    77)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 76
    Height = 13
    Caption = #1042#1080#1076' '#1087#1088#1086#1087#1086#1074#1077#1076#1080
  end
  object btnOK: TButton
    Left = 159
    Top = 45
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 280
    Top = 45
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object cmbxSermonSorts: TcxLookupComboBox
    Left = 90
    Top = 14
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'caption'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dtsrSermonSorts
    EditValue = 1
    TabOrder = 2
    Width = 298
  end
  object qrSermonSorts: TtkSQLiteQuery
    SQL.Strings = (
      
        'select s."id",s."caption" from "sermon_sorts" s order by s."prio' +
        'rity",s."caption"')
    Active = True
    Params = <>
    Left = 160
    Top = 8
  end
  object dtsrSermonSorts: TDataSource
    DataSet = qrSermonSorts
    Left = 128
    Top = 8
  end
end
