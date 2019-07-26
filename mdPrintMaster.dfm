object F_PrintMaster: TF_PrintMaster
  Left = 308
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1052#1072#1089#1090#1077#1088' '#1087#1077#1095#1072#1090#1080
  ClientHeight = 341
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    602
    341)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 357
    Top = 309
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 478
    Top = 309
    Width = 113
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 289
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 43
      Height = 13
      Caption = #1055#1088#1080#1085#1090#1077#1088
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 40
      Width = 602
      Height = 249
      Align = alBottom
      Caption = #1059#1095#1072#1089#1090#1085#1080#1082#1080' '#1080' '#1082#1086#1087#1080#1080
      TabOrder = 0
      object trlsMembers: TcxTreeList
        Left = 2
        Top = 15
        Width = 598
        Height = 232
        Hint = ''
        Align = alClient
        Bands = <
          item
          end>
        Navigator.Buttons.CustomButtons = <>
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        Styles.StyleSheet = F_Main.TreeListStyleSheet
        TabOrder = 0
        object trlsMembersID: TcxTreeListColumn
          Visible = False
          DataBinding.ValueType = 'String'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object trlsMembersCopyes: TcxTreeListColumn
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.MaxValue = 5.000000000000000000
          DataBinding.ValueType = 'String'
          Width = 39
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object trlsMembersCaption: TcxTreeListColumn
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Options.Focusing = False
          Width = 339
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
    object cmbxPrinter: TcxComboBox
      Left = 87
      Top = 11
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 1
      Width = 230
    end
    object chbxUsePreveiw: TcxCheckBox
      Left = 340
      Top = 11
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 2
      Width = 244
    end
  end
  object spedCopies: TcxSpinEdit
    Left = 9
    Top = 300
    Properties.AssignedValues.MinValue = True
    Properties.MaxValue = 5.000000000000000000
    Properties.OnChange = spbtCopiesPropertiesChange
    TabOrder = 3
    Value = 1
    Width = 39
  end
end
