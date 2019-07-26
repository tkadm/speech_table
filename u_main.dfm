object F_Main: TF_Main
  Left = 297
  Top = 153
  Caption = #1043#1088#1072#1092#1080#1082' '#1087#1088#1086#1087#1086#1074#1077#1076#1091#1102#1097#1080#1093
  ClientHeight = 654
  ClientWidth = 1033
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcnMain: TcxPageControl
    Left = 0
    Top = 0
    Width = 1033
    Height = 654
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tbshGraphs
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 650
    ClientRectLeft = 4
    ClientRectRight = 1029
    ClientRectTop = 24
    object tbshGraphs: TcxTabSheet
      Caption = #1043#1088#1072#1092#1080#1082#1080
      ImageIndex = 0
    end
    object tbshOptions: TcxTabSheet
      Caption = #1054#1087#1094#1080#1080
      ImageIndex = 1
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfFlat
    SkinName = 'Blue'
    Left = 608
    Top = 32
  end
  object StyleRepository: TcxStyleRepository
    Left = 664
    Top = 32
    PixelsPerInch = 96
    object StyleBkGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14680063
    end
    object StyleSelected: TcxStyle
      AssignedValues = [svColor]
      Color = 16749987
    end
    object TreeListStyleSheet: TcxTreeListStyleSheet
      Styles.Background = StyleBkGround
      Styles.Content = StyleBkGround
      Styles.Inactive = StyleSelected
      Styles.Selection = StyleSelected
      BuiltIn = True
    end
  end
  object ZConnection: TtkSQLiteConnection
    AfterConnect = ZConnectionAfterConnect
    DBFileName = 'Data.db3'
    Connected = True
    Left = 636
    Top = 32
  end
end
