object F_PreacherProperty: TF_PreacherProperty
  Left = 336
  Top = 233
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072
  ClientHeight = 282
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    595
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 27
    Height = 13
    Caption = #1060#1048#1054
  end
  object Label2: TLabel
    Left = 20
    Top = 256
    Width = 94
    Height = 13
    Caption = '% '#1079#1072#1076#1077#1081#1089#1090#1074#1086#1074#1072#1085#1080#1103
  end
  object btnOK: TButton
    Left = 354
    Top = 251
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 475
    Top = 251
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 48
    Width = 217
    Height = 193
    Caption = #1042#1080#1076#1099' '#1087#1088#1086#1087#1086#1074#1077#1076#1077#1081
    TabOrder = 2
    object trlsSermonTypes: TcxTreeList
      Left = 4
      Top = 17
      Width = 213
      Height = 176
      Hint = ''
      Align = alCustom
      Bands = <
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      Styles.StyleSheet = F_Main.TreeListStyleSheet
      TabOrder = 0
      object trlsSermonTypesCaption: TcxTreeListColumn
        Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Options.Focusing = False
        Width = 176
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object trlsSermonTypesEnable: TcxTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
        DataBinding.ValueType = 'Boolean'
        Width = 23
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object trlsSermonTypesID: TcxTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
        Visible = False
        Caption.Text = #1053#1072#1095'.'#1079#1085#1072#1095'.'
        DataBinding.ValueType = 'Integer'
        Width = 58
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 240
    Top = 48
    Width = 344
    Height = 193
    Caption = #1044#1072#1090#1099' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1103
    TabOrder = 3
    object trlsDatePeriodAbsence: TcxTreeList
      Left = 137
      Top = 15
      Width = 205
      Height = 176
      Hint = ''
      Align = alClient
      Bands = <
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      PopupMenu = ppmPeriods
      Styles.StyleSheet = F_Main.TreeListStyleSheet
      TabOrder = 0
      object trlsDatePeriodAbsenceBegin: TcxTreeListColumn
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
        Caption.Text = #1053#1072#1095#1072#1083#1086
        DataBinding.ValueType = 'DateTime'
        Width = 89
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object trlsDatePeriodAbsenceEnd: TcxTreeListColumn
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
        Caption.Text = #1054#1082#1086#1085#1095#1072#1085#1080#1077
        DataBinding.ValueType = 'DateTime'
        Width = 93
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object trlsDayOfWeekAbsence: TcxTreeList
      Left = 2
      Top = 15
      Width = 135
      Height = 176
      Hint = ''
      Align = alLeft
      Bands = <
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      Styles.StyleSheet = F_Main.TreeListStyleSheet
      TabOrder = 1
      Data = {
        00000500E00100000F00000044617461436F6E74726F6C6C6572310200000013
        000000546378426F6F6C65616E56616C75655479706512000000546378537472
        696E6756616C75655479706507000000445855464D54000000000B0000001F04
        3E043D043504340435043B044C043D0438043A04445855464D54000000000700
        0000120442043E0440043D0438043A04445855464D5400000000050000002104
        4004350434043004445855464D54000000000700000027043504420432043504
        40043304445855464D5400000000070000001F044F0442043D04380446043004
        445855464D54000000000700000021044304310431043E044204300444585546
        4D54000000000B00000012043E0441043A0440043504410435043D044C043504
        070000000000000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0100
        000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0200000008000000
        000000000000FFFFFFFFFFFFFFFFFFFFFFFF0300000008000000000000000000
        FFFFFFFFFFFFFFFFFFFFFFFF0400000008000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFF0500000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        0600000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1A0007000000}
      object trlsDayOfWeekAbsenceChecked: TcxTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
        DataBinding.ValueType = 'Boolean'
        Width = 28
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object trlsDayOfWeekAbsenceDayCaption: TcxTreeListColumn
        Caption.Text = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Options.Focusing = False
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object spedProcentPower: TcxSpinEdit
    Left = 122
    Top = 253
    Properties.MaxValue = 100.000000000000000000
    Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
    TabOrder = 4
    Value = 100
    Width = 41
  end
  object chbxActiveState: TcxCheckBox
    Left = 169
    Top = 253
    Caption = #1040#1082#1090#1080#1074#1077#1085
    Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
    TabOrder = 5
    Width = 66
  end
  object cmbxPersons: TcxLookupComboBox
    Left = 55
    Top = 8
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'caption'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dtsrPersons
    Properties.OnEditValueChanged = cmbxPersonsPropertiesEditValueChanged
    TabOrder = 6
    Width = 527
  end
  object chbxServiceLeader: TcxCheckBox
    Left = 238
    Top = 253
    Caption = #1042#1077#1076#1077#1090' '#1089#1083#1091#1078#1077#1085#1080#1077
    Properties.OnEditValueChanged = chbxActiveStatePropertiesEditValueChanged
    TabOrder = 7
    Width = 107
  end
  object ppmPeriods: TPopupMenu
    Left = 448
    Top = 128
    object ppmAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = ppmAddClick
    end
    object ppm_: TMenuItem
      Caption = '-'
    end
    object ppmDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = ppmDeleteClick
    end
  end
  object qrPersons: TtkSQLiteQuery
    SQL.Strings = (
      
        'select p."id",p."caption" from persons p where p."id" not in (se' +
        'lect c."person" from "preachers" c where c."id"<>:in_preacher)  ' +
        'and p.sex=1 order by p."caption"')
    Connection = F_Main.ZConnection
    Params = <
      item
        DataType = ftUnknown
        Name = 'in_preacher'
        ParamType = ptInput
      end>
    Left = 184
    Top = 9
  end
  object dtsrPersons: TDataSource
    DataSet = qrPersons
    Left = 217
    Top = 9
  end
end
