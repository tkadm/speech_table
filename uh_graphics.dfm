object FH_Graphics: TFH_Graphics
  Left = 301
  Top = 229
  Caption = #1043#1088#1072#1092#1080#1082' '#1087#1088#1086#1087#1086#1074#1077#1076#1091#1102#1097#1080#1093
  ClientHeight = 684
  ClientWidth = 908
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
    Width = 908
    Height = 684
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 908
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      PopupMenu = ppmnGraphs
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 38
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076
      end
      object dblblState: TDBText
        Left = 232
        Top = 8
        Width = 97
        Height = 17
        Color = clBtnFace
        DataField = 'state_caption'
        DataSource = dtsrGraphs
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = dblblStateClick
      end
      object lblChangedGraph: TLabel
        Left = 768
        Top = 12
        Width = 100
        Height = 13
        Caption = #1043#1088#1072#1092#1080#1082' '#1080#1079#1084#1077#1085#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object cmbxGraphs: TcxLookupComboBox
        Left = 71
        Top = 6
        Properties.GridMode = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'txt'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsrGraphs
        Properties.OnEditValueChanged = cmbxGraphsPropertiesEditValueChanged
        TabOrder = 0
        Width = 145
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 33
      Width = 908
      Height = 651
      Align = alClient
      Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 2
        Top = 460
        Width = 904
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 314
        ExplicitWidth = 335
      end
      object Splitter2: TSplitter
        Left = 2
        Top = 209
        Width = 904
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = -14
        ExplicitTop = 200
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 904
        Height = 194
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 24
        object trlsSermonTypes: TcxDBTreeList
          Left = 0
          Top = 0
          Width = 425
          Height = 194
          Hint = ''
          Align = alLeft
          Bands = <
            item
            end>
          DataController.DataSource = dtsrSermonTypes
          DataController.ParentField = 'sermon_sort'
          DataController.KeyField = 'sermon_sort'
          Navigator.Buttons.CustomButtons = <>
          OptionsData.Editing = False
          OptionsData.Deleting = False
          OptionsSelection.CellSelect = False
          OptionsView.GridLines = tlglBoth
          OptionsView.ShowRoot = False
          RootValue = -1
          Styles.StyleSheet = F_Main.TreeListStyleSheet
          TabOrder = 0
          OnFocusedNodeChanged = trlsSermonTypesFocusedNodeChanged
          object trlsSermonTypescaption: TcxDBTreeListColumn
            Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'caption'
            Width = 163
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object trlsSermonTypescnt: TcxDBTreeListColumn
            Caption.Text = #1082#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'cnt'
            Width = 86
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object trlsSermonTypesprch_count: TcxDBTreeListColumn
            Caption.Text = #1082#1086#1083'-'#1074#1086' '#1087#1088#1086#1087#1086#1074#1077#1076#1085#1080#1082#1086#1074
            DataBinding.FieldName = 'prch_count'
            Width = 86
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object trlsSermonTypescof: TcxDBTreeListColumn
            Caption.Text = #1082#1086#1101#1092'.'#1089#1083#1086#1078#1085#1086#1089#1090#1080
            DataBinding.FieldName = 'cof'
            Width = 86
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
      end
      object grbxMain: TGroupBox
        Left = 2
        Top = 212
        Width = 904
        Height = 248
        Align = alTop
        Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1088#1072#1092#1080#1082
        TabOrder = 1
        ExplicitTop = 177
      end
      object grbxPrevious: TGroupBox
        Left = 2
        Top = 463
        Width = 904
        Height = 186
        Align = alClient
        Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1075#1088#1072#1092#1080#1082
        TabOrder = 2
        ExplicitTop = 460
        ExplicitHeight = 189
      end
    end
  end
  object ppmnGraphs: TPopupMenu
    Left = 690
    Top = 6
    object N3: TMenuItem
      Action = actCreateGraph
    end
    object N5: TMenuItem
      Action = actEditGraph
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1090#1072#1090#1091#1089':'
      object N13: TMenuItem
        Action = actStatusProject
      end
      object N14: TMenuItem
        Action = actStatusApproved
      end
      object N15: TMenuItem
        Action = actStatusArchive
      end
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = actSaveGraphData
    end
    object N9: TMenuItem
      Action = actRollback
    end
    object N8: TMenuItem
      Action = actClearGraphData
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = actPrintMaster
    end
    object Excel1: TMenuItem
      Action = actToExcel
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = actDeleteGraph
    end
  end
  object qrGraphs: TtkSQLiteQuery
    SQL.Strings = (
      'select p."id",strftime('#39'%d.%m.%Y'#39',p."date_from") as "date_from",'
      'strftime('#39'%d.%m.%Y'#39',p."date_to") as "date_to",'
      'p."add_empty_strings",p."show_worships_number",'
      
        'strftime('#39'%d.%m.%Y'#39',p."date_from")||'#39'-'#39'||strftime('#39'%d.%m.%Y'#39',p."' +
        'date_to") as txt,'
      'p."graph_state",'
      
        '(select gs."caption" from "graph_state" gs where gs."id"=p."grap' +
        'h_state")as state_caption,'
      
        '(select gr.[id] from "graphs" gr where gr.[date_from]=(select ma' +
        'x(h."date_from") from "graphs" h where h.[date_from]<p."date_fro' +
        'm")) as previous_id'
      'from "graphs" p order by p."date_from"')
    Connection = F_Main.ZConnection
    Params = <>
    Left = 142
    Top = 6
  end
  object dtsrGraphs: TDataSource
    DataSet = qrGraphs
    Left = 110
    Top = 6
  end
  object ActionList: TActionList
    Left = 723
    Top = 6
    object actCreateGraph: TAction
      Category = 'Graphs'
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1075#1088#1072#1092#1080#1082'...'
      OnExecute = actCreateGraphExecute
    end
    object actDeleteGraph: TAction
      Category = 'Graphs'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1072#1092#1080#1082'...'
      OnExecute = actDeleteGraphExecute
    end
    object actEditGraph: TAction
      Category = 'Graphs'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1075#1088#1072#1092#1080#1082#1072'...'
      OnExecute = actEditGraphExecute
    end
    object actToExcel: TAction
      Category = 'Graphs'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      OnExecute = actToExcelExecute
    end
    object actSaveGraphData: TAction
      Category = 'Graphs'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      ShortCut = 16467
      OnExecute = actSaveGraphDataExecute
    end
    object actClearGraphData: TAction
      Category = 'Graphs'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 16452
      OnExecute = actClearGraphDataExecute
    end
    object actPrintMaster: TAction
      Category = 'Graphs'
      Caption = #1052#1072#1089#1090#1077#1088' '#1087#1077#1095#1072#1090#1080'...'
      OnExecute = actPrintMasterExecute
    end
    object actRollback: TAction
      Category = 'Graphs'
      Caption = #1054#1090#1082#1072#1090#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Enabled = False
      ShortCut = 16466
      OnExecute = actRollbackExecute
    end
    object actStatusProject: TAction
      Tag = 1
      Category = 'Status'
      Caption = #1055#1088#1086#1077#1082#1090
      OnExecute = actStatusProjectExecute
    end
    object actStatusApproved: TAction
      Tag = 2
      Category = 'Status'
      Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085
      OnExecute = actStatusProjectExecute
    end
    object actStatusArchive: TAction
      Tag = 3
      Category = 'Status'
      Caption = #1040#1088#1093#1080#1074
      OnExecute = actStatusProjectExecute
    end
  end
  object dtsrSermonTypes: TDataSource
    DataSet = qrSermotTypes
    Left = 202
    Top = 88
  end
  object qrSermotTypes: TtkSQLiteQuery
    SQL.Strings = (
      'select gs."sermon_sort" as sermon_sort,'
      
        '       (select ss."caption" from "sermon_sorts" ss where ss."id"' +
        '=gs."sermon_sort")as caption,'
      '       count(*) as cnt,'
      
        '       (select count(*) from "preachers" pr join "preachers_abil' +
        'ity" pa on pr."id"=pa."preacher" where pa."sermon_sorts"=gs."ser' +
        'mon_sort" and pr.active=1) as prch_count,'
      
        '       (count(*)+0.0)/(select count(*) from "preachers" pr join ' +
        '"preachers_ability" pa on pr."id"=pa."preacher" where pa."sermon' +
        '_sorts"=gs."sermon_sort" and pr.active=1) as cof        '
      
        'from "v_graph_sermons" gs where gs."graphs"=:in_graph group by g' +
        's."sermon_sort" order by'
      
        '     (select count(*) from "preachers" pr join "preachers_abilit' +
        'y" pa on pr."id"=pa."preacher" where pa."sermon_sorts"=gs."sermo' +
        'n_sort" and pr.active=1), '
      
        '     (count(*)+0.0)/(select count(*) from "preachers" pr join "p' +
        'reachers_ability" pa on pr."id"=pa."preacher" where pa."sermon_s' +
        'orts"=gs."sermon_sort" and pr.active=1)desc;')
    Connection = F_Main.ZConnection
    Params = <
      item
        DataType = ftUnknown
        Name = 'in_graph'
        ParamType = ptInput
      end>
    Left = 234
    Top = 88
  end
end
