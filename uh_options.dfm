object FH_Options: TFH_Options
  Left = 191
  Top = 126
  Caption = 'FH_Options'
  ClientHeight = 780
  ClientWidth = 974
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 974
    Height = 780
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel'
    TabOrder = 0
    object Panel4: TPanel
      Left = 842
      Top = 0
      Width = 132
      Height = 780
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        132
        780)
      object btnVacuum: TButton
        Left = 11
        Top = 11
        Width = 109
        Height = 23
        Action = actVacuum
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 842
      Height = 780
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 442
        Width = 842
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 338
      end
      object Panel2: TPanel
        Left = 0
        Top = 445
        Width = 842
        Height = 335
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 286
          Top = 0
          Height = 335
          ExplicitLeft = 0
          ExplicitTop = 56
          ExplicitHeight = 100
        end
        object GroupBox1: TGroupBox
          Left = 289
          Top = 0
          Width = 553
          Height = 335
          Align = alClient
          Caption = #1055#1088#1086#1087#1086#1074#1077#1076#1085#1080#1082#1080
          TabOrder = 0
          object trlsPreachers: TcxDBTreeList
            Left = 2
            Top = 15
            Width = 549
            Height = 282
            Hint = ''
            Align = alClient
            Bands = <
              item
              end>
            DataController.DataSource = dtsrPreachers
            DataController.ParentField = 'id'
            DataController.KeyField = 'id'
            Navigator.Buttons.CustomButtons = <>
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            PopupMenu = ppmnPreachers
            RootValue = -1
            Styles.StyleSheet = F_Main.TreeListStyleSheet
            TabOrder = 0
            OnDblClick = trlsPreachersDblClick
            OnFocusedNodeChanged = trlsPreachersFocusedNodeChanged
            object trlsPreachersfio: TcxDBTreeListColumn
              Caption.Text = #1048#1084#1103
              DataBinding.FieldName = 'fio'
              Width = 266
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsPreachersactive: TcxDBTreeListColumn
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Caption.Text = ' '
              DataBinding.FieldName = 'active'
              Width = 23
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsPreachersUsable: TcxDBTreeListColumn
              Caption.Text = ' '
              DataBinding.FieldName = 'usable'
              Width = 41
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsPreachersServiceLider: TcxDBTreeListColumn
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Caption.Text = #1042#1077#1076#1091#1097#1080#1081
              DataBinding.FieldName = 'service_leader'
              Width = 65
              Position.ColIndex = 3
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsPreachersPHONE: TcxDBTreeListColumn
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.EditMask = '\+\7 000\-000\-00\-00'
              Properties.Nullstring = #1085#1077#1090' '#1076#1072#1085#1085#1099#1093
              Properties.UseNullString = True
              Caption.Text = #1058#1077#1083#1077#1092#1086#1085
              DataBinding.FieldName = 'PHONE'
              Position.ColIndex = 4
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
          end
          object Panel1: TPanel
            Left = 2
            Top = 297
            Width = 549
            Height = 36
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object spbtUp: TSpeedButton
              Left = 120
              Top = 8
              Width = 23
              Height = 22
              Action = actMoveUp
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0A070E09870E0
                9070D08860D08060FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFE09870FFC0A0FFB890FFB090904820FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE09070FFC0A0FF
                A880F09060A04820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFD08860FFB080FF9060F08850A05020FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0A070E09870E09070FFA880F0
                9060E08050B05830A05020904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFF9EFEBC07850F09870FFA070E08850D07850C06840A05030EADCD5FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF5EAE5B05830E08050E0
                7850C07040A05030EADCD5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFF5EAE5B05830C07040A05830EADCD5FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF5EAE5B0
                5830EADCD5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object spbtDown: TSpeedButton
              Left = 185
              Top = 8
              Width = 23
              Height = 22
              Action = actMoveDown
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFEADCD5B05830F5EAE5FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEADCD5A0
                5830C07040B05830F5EAE5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFEADCD5A05030C07040E07850E08050B05830F5EAE5FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEADCD5A05030C06840D0
                7850E08850FFA070F09870C07850F9EFEBFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF904820A05020B05830E08050F09060FFA880E09070E09870F0A0
                70FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA05020F0
                8850FF9060FFB080D08860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFA04820F09060FFA880FFC0A0E09070FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF904820FF
                B090FFB890FFC0A0E09870FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFD08060D08860E09070E09870F0A070FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 286
          Height = 335
          Align = alLeft
          Caption = #1042#1080#1076#1099' '#1087#1088#1086#1087#1086#1074#1077#1076#1077#1081
          TabOrder = 1
          object trlsSermonSorts: TcxDBTreeList
            Left = 2
            Top = 15
            Width = 282
            Height = 282
            Hint = ''
            Align = alClient
            Bands = <
              item
              end>
            DataController.DataSource = dtsrSermonSorts
            DataController.ParentField = 'id'
            DataController.KeyField = 'id'
            Navigator.Buttons.CustomButtons = <>
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            PopupMenu = ppmnSermonSorts
            RootValue = -1
            Styles.StyleSheet = F_Main.TreeListStyleSheet
            TabOrder = 0
            OnDblClick = trlsSermonSortsDblClick
            OnFocusedNodeChanged = trlsSermonSortsFocusedNodeChanged
            object trlsSermonSortspriority: TcxDBTreeListColumn
              Caption.Text = #1055#1088#1080#1086#1088#1080#1090#1077#1090
              DataBinding.FieldName = 'priority'
              Width = 65
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsSermonSortscaption: TcxDBTreeListColumn
              Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'caption'
              Width = 206
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
          end
          object Panel3: TPanel
            Left = 2
            Top = 297
            Width = 282
            Height = 36
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object spbtUpss: TSpeedButton
              Left = 72
              Top = 8
              Width = 23
              Height = 22
              Action = actSortUp
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0A070E09870E0
                9070D08860D08060FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFE09870FFC0A0FFB890FFB090904820FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE09070FFC0A0FF
                A880F09060A04820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFD08860FFB080FF9060F08850A05020FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0A070E09870E09070FFA880F0
                9060E08050B05830A05020904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFF9EFEBC07850F09870FFA070E08850D07850C06840A05030EADCD5FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF5EAE5B05830E08050E0
                7850C07040A05030EADCD5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFF5EAE5B05830C07040A05830EADCD5FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF5EAE5B0
                5830EADCD5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object spbtDownss: TSpeedButton
              Left = 137
              Top = 8
              Width = 23
              Height = 22
              Action = actSortDown
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFEADCD5B05830F5EAE5FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEADCD5A0
                5830C07040B05830F5EAE5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFEADCD5A05030C07040E07850E08050B05830F5EAE5FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEADCD5A05030C06840D0
                7850E08850FFA070F09870C07850F9EFEBFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF904820A05020B05830E08050F09060FFA880E09070E09870F0A0
                70FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA05020F0
                8850FF9060FFB080D08860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFA04820F09060FFA880FFC0A0E09070FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF904820FF
                B090FFB890FFC0A0E09870FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFD08060D08860E09070E09870F0A070FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 842
        Height = 442
        Align = alTop
        Caption = #1043#1088#1072#1092#1080#1082' '#1089#1083#1091#1078#1077#1085#1080#1081
        TabOrder = 1
        object Splitter3: TSplitter
          Left = 286
          Top = 15
          Height = 425
          ExplicitLeft = 531
          ExplicitTop = 14
        end
        object Splitter4: TSplitter
          Left = 595
          Top = 15
          Height = 425
          ExplicitLeft = 534
          ExplicitTop = 29
        end
        object GroupBox3: TGroupBox
          Left = 289
          Top = 15
          Width = 306
          Height = 425
          Align = alLeft
          Caption = #1057#1083#1091#1078#1077#1085#1080#1103
          TabOrder = 0
          object trlsWorships: TcxDBTreeList
            Left = 2
            Top = 15
            Width = 302
            Height = 408
            Hint = ''
            Align = alClient
            Bands = <
              item
              end>
            DataController.DataSource = dtsrWorships
            DataController.ParentField = 'id'
            DataController.KeyField = 'id'
            Navigator.Buttons.CustomButtons = <>
            OptionsBehavior.Sorting = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            PopupMenu = ppmnWorships
            RootValue = -1
            Styles.StyleSheet = F_Main.TreeListStyleSheet
            TabOrder = 0
            OnDblClick = trlsWorshipsDblClick
            OnFocusedNodeChanged = trlsWorshipsFocusedNodeChanged
            object trlsWorshipsord: TcxDBTreeListColumn
              Caption.Text = #8470#1087'/'#1087
              DataBinding.FieldName = 'ord'
              Width = 40
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsWorshipsworship_time: TcxDBTreeListColumn
              Caption.Text = #1042#1088#1077#1084#1103
              DataBinding.FieldName = 'worship_time'
              Width = 61
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsWorshipssermons_amount: TcxDBTreeListColumn
              Caption.Text = #1055#1088#1086#1087#1086#1074#1077#1076#1077#1081
              DataBinding.FieldName = 'sermons_amount'
              Width = 74
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 598
          Top = 15
          Width = 242
          Height = 425
          Align = alClient
          Caption = #1055#1088#1086#1087#1086#1074#1077#1076#1080
          TabOrder = 1
          object trlsSermons: TcxDBTreeList
            Left = 2
            Top = 15
            Width = 238
            Height = 408
            Hint = ''
            Align = alClient
            Bands = <
              item
              end>
            DataController.DataSource = dtsrSermons
            DataController.ParentField = 'id'
            DataController.KeyField = 'id'
            Navigator.Buttons.CustomButtons = <>
            OptionsBehavior.Sorting = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            PopupMenu = ppmnSermons
            RootValue = -1
            Styles.StyleSheet = F_Main.TreeListStyleSheet
            TabOrder = 0
            OnDblClick = trlsSermonsDblClick
            OnFocusedNodeChanged = trlsSermonsFocusedNodeChanged
            object trlsSermonssermon_number: TcxDBTreeListColumn
              Caption.Text = #8470#1087'/'#1087
              DataBinding.FieldName = 'sermon_number'
              Width = 38
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsSermonscaption: TcxDBTreeListColumn
              Caption.Text = #1042#1080#1076
              DataBinding.FieldName = 'caption'
              Width = 254
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 2
          Top = 15
          Width = 284
          Height = 425
          Align = alLeft
          Caption = #1055#1077#1088#1080#1086#1076#1099' '#1080' '#1076#1085#1080' '#1085#1077#1076#1077#1083#1080
          TabOrder = 2
          object trlsWeek: TcxDBTreeList
            Left = 2
            Top = 136
            Width = 280
            Height = 287
            Hint = ''
            Align = alBottom
            Bands = <
              item
              end>
            DataController.DataSource = dtsrWeek
            DataController.ParentField = 'id'
            DataController.KeyField = 'id'
            Navigator.Buttons.CustomButtons = <>
            OptionsBehavior.Sorting = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            PopupMenu = ppmnDayOfWeek
            RootValue = -1
            Styles.StyleSheet = F_Main.TreeListStyleSheet
            TabOrder = 0
            OnCustomDrawDataCell = trlsWeekCustomDrawCell
            OnFocusedNodeChanged = trlsWeekFocusedNodeChanged
            object trlsWeekID: TcxDBTreeListColumn
              Visible = False
              DataBinding.FieldName = 'id'
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsWeekCaption: TcxDBTreeListColumn
              Caption.Text = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
              DataBinding.FieldName = 'caption'
              Options.Sorting = False
              Width = 111
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
            object trlsWeekAmount: TcxDBTreeListColumn
              Caption.Text = #1057#1083#1091#1078#1077#1085#1080#1081
              DataBinding.FieldName = 'amount'
              Options.Sorting = False
              Width = 63
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
          end
          object treePeriods: TcxDBTreeList
            Left = 2
            Top = 15
            Width = 280
            Height = 121
            Hint = ''
            Align = alClient
            Bands = <
              item
              end>
            DataController.DataSource = dtsrPeriods
            DataController.ParentField = 'id'
            DataController.KeyField = 'id'
            Navigator.Buttons.CustomButtons = <>
            OptionsBehavior.Sorting = False
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            PopupMenu = ppmnPeriods
            RootValue = -1
            Styles.StyleSheet = F_Main.TreeListStyleSheet
            TabOrder = 1
            OnFocusedNodeChanged = treePeriodsFocusedNodeChanged
            object treePeriodsworks_from: TcxDBTreeListColumn
              Caption.Text = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089':'
              DataBinding.FieldName = 'works_from'
              Width = 208
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Summary.FooterSummaryItems = <>
              Summary.GroupFooterSummaryItems = <>
            end
          end
        end
      end
    end
  end
  object ppmnPreachers: TPopupMenu
    Left = 458
    Top = 606
    object N1: TMenuItem
      Action = actAddPreacher
    end
    object N2: TMenuItem
      Action = actEditPreacher
    end
  end
  object qrWeek: TtkSQLiteQuery
    SQL.Strings = (
      'select'
      'w."day_of_week" as id,'
      'w."caption" as caption,'
      
        'case (select count(*) from "worship_table" ms where ms."day_of_w' +
        'eek"=w."day_of_week" and ms.[worship_table_period]=:in_worship_p' +
        'eriod)'
      'when 0 then '#39'-'#39
      
        'else (select count(*) from "worship_table" ms where ms."day_of_w' +
        'eek"=w."day_of_week" and ms.[worship_table_period]=:in_worship_p' +
        'eriod)'
      ' end amount'
      'from "week_table" w order by w."day_of_week";')
    Connection = F_Main.ZConnection
    Active = True
    Params = <
      item
        DataType = ftInteger
        Name = 'in_worship_period'
        ParamType = ptInput
        Value = 1
      end>
    Left = 74
    Top = 214
  end
  object qrPreachers: TtkSQLiteQuery
    SQL.Strings = (
      
        'select p.id, p.[person] as person_id, p."usable", ps.[caption] a' +
        's fio, p.active,p.ord,p.service_leader, ps.phone from preachers ' +
        'p'
      'join persons ps on ps.[id]=p.person order by p.ord')
    Connection = F_Main.ZConnection
    Active = True
    Params = <>
    Left = 458
    Top = 502
  end
  object dtsrPreachers: TDataSource
    DataSet = qrPreachers
    Left = 458
    Top = 550
  end
  object dtsrWeek: TDataSource
    DataSet = qrWeek
    Left = 74
    Top = 262
  end
  object ActionList: TActionList
    Left = 739
    Top = 30
    object actAddPreacher: TAction
      Category = 'Preachers'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      OnExecute = actAddPreacherExecute
    end
    object actEditPreacher: TAction
      Category = 'Preachers'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Enabled = False
      OnExecute = actEditPreacherExecute
    end
    object actMoveUp: TAction
      Category = 'Preachers'
      Enabled = False
      OnExecute = actMoveUpExecute
    end
    object actMoveDown: TAction
      Category = 'Preachers'
      Enabled = False
      OnExecute = actMoveDownExecute
    end
    object actSortUp: TAction
      Category = 'SermonSorts'
      Enabled = False
      OnExecute = actSortUpExecute
    end
    object actSortDown: TAction
      Category = 'SermonSorts'
      Enabled = False
      OnExecute = actSortDownExecute
    end
    object actWorshipAdd: TAction
      Category = 'Worships'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Enabled = False
      OnExecute = actWorshipAddExecute
    end
    object actSermonAdd: TAction
      Category = 'Sermons'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Enabled = False
      OnExecute = actSermonAddExecute
    end
    object actSermonEdit: TAction
      Category = 'Sermons'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Enabled = False
      OnExecute = actSermonEditExecute
    end
    object actSermonRemove: TAction
      Category = 'Sermons'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      OnExecute = actSermonRemoveExecute
    end
    object actSermSortAdd: TAction
      Category = 'SermonSorts'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      OnExecute = actSermSortAddExecute
    end
    object actSermSortEdit: TAction
      Category = 'SermonSorts'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Enabled = False
      OnExecute = actSermSortEditExecute
    end
    object actSermSortRemove: TAction
      Category = 'SermonSorts'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      OnExecute = actSermSortRemoveExecute
    end
    object actWorshipEdit: TAction
      Category = 'Worships'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Enabled = False
      OnExecute = actWorshipEditExecute
    end
    object actWorshipRemove: TAction
      Category = 'Worships'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      OnExecute = actWorshipRemoveExecute
    end
    object actVacuum: TAction
      Category = 'Features'
      Caption = #1059#1087#1072#1082#1086#1074#1072#1090#1100' '#1073#1072#1079#1091
      OnExecute = actVacuumExecute
    end
    object actWorshipUp: TAction
      Category = 'Worships'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1074#1077#1088#1093
      Enabled = False
      OnExecute = actWorshipUpExecute
    end
    object actWorshipDown: TAction
      Category = 'Worships'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1085#1080#1079
      Enabled = False
      OnExecute = actWorshipDownExecute
    end
    object actSermonUp: TAction
      Category = 'Sermons'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1074#1077#1088#1093
      Enabled = False
      OnExecute = actSermonUpExecute
    end
    object actSermonDown: TAction
      Category = 'Sermons'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1085#1080#1079
      Enabled = False
      OnExecute = actSermonDownExecute
    end
    object actExceedDays: TAction
      Category = 'DayOfWeek'
      Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090#1099' '#1089#1083#1091#1078#1077#1085#1080#1081'...'
      OnExecute = actExceedDaysExecute
    end
    object actWorshipPeriodAdd: TAction
      Category = 'WorshipPeriods'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      OnExecute = actWorshipPeriodAddExecute
    end
    object actWorshipPeriodEdit: TAction
      Category = 'WorshipPeriods'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Enabled = False
      OnExecute = actWorshipPeriodEditExecute
    end
    object actWorshipPeriodRemove: TAction
      Category = 'WorshipPeriods'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      OnExecute = actWorshipPeriodRemoveExecute
    end
    object actWorshipPeriodAddCopying: TAction
      Category = 'WorshipPeriods'
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077#1084'...'
      Enabled = False
      OnExecute = actWorshipPeriodAddCopyingExecute
    end
  end
  object qrWorships: TtkSQLiteQuery
    SQL.Strings = (
      
        'select wt."id",wt."ord",wt."worship_time",(select count(*) from ' +
        '"worship_sermons" ws where ws."worship"=wt."id")as sermons_amoun' +
        't'
      
        'from "worship_table" wt where wt."day_of_week"=:in_day and wt.[w' +
        'orship_table_period]=:in_worship_period'
      ' order by wt."ord"')
    Connection = F_Main.ZConnection
    Active = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'in_day'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'in_worship_period'
        ParamType = ptInput
      end>
    Left = 404
    Top = 200
  end
  object dtsrWorships: TDataSource
    DataSet = qrWorships
    Left = 404
    Top = 240
  end
  object qrSermons: TtkSQLiteQuery
    SQL.Strings = (
      
        'select s."id" as id,s."sermon_number" as sermon_number,s."worshi' +
        'p" as worship,s."sermon_sort" as sermon_sort,s."caption" as capt' +
        'ion from "v_sermons" s where s."worship"=:in_worship')
    Connection = F_Main.ZConnection
    Active = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'in_worship'
        ParamType = ptInput
      end>
    Left = 615
    Top = 229
  end
  object dtsrSermons: TDataSource
    DataSet = qrSermons
    Left = 614
    Top = 278
  end
  object qrSermonSorts: TtkSQLiteQuery
    SQL.Strings = (
      
        'select s."id",s."priority",s."caption" from "sermon_sorts" s ord' +
        'er by s."priority",s."id"')
    Connection = F_Main.ZConnection
    Active = True
    Params = <>
    Left = 113
    Top = 544
  end
  object dtsrSermonSorts: TDataSource
    DataSet = qrSermonSorts
    Left = 111
    Top = 601
  end
  object ppmnWorships: TPopupMenu
    Left = 402
    Top = 277
    object N3: TMenuItem
      Action = actWorshipAdd
    end
    object N4: TMenuItem
      Action = actWorshipEdit
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Action = actWorshipUp
    end
    object N13: TMenuItem
      Action = actWorshipDown
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = actWorshipRemove
    end
  end
  object ppmnSermons: TPopupMenu
    Left = 618
    Top = 329
    object N7: TMenuItem
      Action = actSermonAdd
    end
    object N8: TMenuItem
      Action = actSermonEdit
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Action = actSermonUp
    end
    object N16: TMenuItem
      Action = actSermonDown
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = actSermonRemove
    end
  end
  object ppmnSermonSorts: TPopupMenu
    Left = 108
    Top = 656
    object N18: TMenuItem
      Action = actSermSortAdd
    end
    object N19: TMenuItem
      Action = actSermSortEdit
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Action = actSermSortRemove
    end
  end
  object ppmnDayOfWeek: TPopupMenu
    Left = 74
    Top = 311
    object N21: TMenuItem
      Action = actExceedDays
    end
  end
  object qrPeriods: TtkSQLiteQuery
    SQL.Strings = (
      
        'select id, strftime('#39'%d.%m.%Y'#39',works_from) as works_from from wo' +
        'rship_table_period')
    Active = True
    Params = <>
    Left = 160
    Top = 47
  end
  object dtsrPeriods: TDataSource
    DataSet = qrPeriods
    Left = 162
    Top = 95
  end
  object ppmnPeriods: TPopupMenu
    Left = 82
    Top = 71
    object N22: TMenuItem
      Action = actWorshipPeriodAdd
    end
    object N23: TMenuItem
      Action = actWorshipPeriodEdit
    end
    object N26: TMenuItem
      Caption = '-'
    end
    object N27: TMenuItem
      Action = actWorshipPeriodAddCopying
    end
    object N24: TMenuItem
      Caption = '-'
    end
    object N25: TMenuItem
      Action = actWorshipPeriodRemove
    end
  end
end
