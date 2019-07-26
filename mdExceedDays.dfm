object F_ExceedDays: TF_ExceedDays
  Left = 396
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1083#1091#1078#1077#1085#1080#1103
  ClientHeight = 250
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  DesignSize = (
    311
    250)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 170
    Width = 242
    Height = 39
    Caption = 
      #1057#1087#1080#1089#1086#1082' '#1089#1086#1076#1077#1088#1078#1080#1090' '#1090#1077' '#1076#1085#1080', '#1089#1083#1091#1078#1077#1085#1080#1103' '#1082#1086#1090#1086#1088#1099#1093' '#1079#1072#1084#1077#1085#1103#1102#1090#1089#1103' '#1085#1072' "'#1087#1088#1072#1079#1076#1085#1080#1095 +
      #1085#1099#1077'", '#1077#1089#1083#1080' '#1087#1088#1072#1079#1076#1085#1080#1082' '#1087#1088#1086#1087#1072#1076#1072#1077#1090' '#1085#1072' '#1101#1090#1086#1090' '#1076#1077#1085#1100' '#1085#1077#1076#1077#1083#1080'...'
    WordWrap = True
  end
  object btnOK: TButton
    Left = 66
    Top = 218
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 187
    Top = 218
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object treeDays: TcxTreeList
    Left = 0
    Top = 0
    Width = 311
    Height = 164
    Hint = ''
    Align = alTop
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsData.Deleting = False
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    Styles.StyleSheet = F_Main.TreeListStyleSheet
    TabOrder = 2
    object treeDaysID: TcxTreeListColumn
      Visible = False
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object treeDaysChecked: TcxTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      DataBinding.ValueType = 'String'
      Width = 23
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object treeDaysCAPTION: TcxTreeListColumn
      DataBinding.ValueType = 'String'
      Width = 234
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
end
