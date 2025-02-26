object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lab4.1 451004 '#1040#1082#1080#1084#1077#1085#1082#1086' '#1040#1069
  ClientHeight = 174
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  object AddNewBtn: TBitBtn
    Left = 8
    Top = 8
    Width = 105
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102#13#10#1079#1072#1087#1080#1089#1100
    TabOrder = 0
    OnClick = AddRecsClick
  end
  object ViewRecs: TBitBtn
    Left = 8
    Top = 63
    Width = 105
    Height = 49
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100#13#10#1079#1072#1087#1080#1089#1080
    TabOrder = 1
    OnClick = ViewRecsClick
  end
  object DeleteRecs: TBitBtn
    Left = 151
    Top = 63
    Width = 105
    Height = 49
    Caption = #1059#1076#1072#1083#1080#1090#1100#13#10#1079#1072#1087#1080#1089#1080
    TabOrder = 2
    OnClick = DeleteRecsClick
  end
  object CorrectRecs: TBitBtn
    Left = 151
    Top = 8
    Width = 105
    Height = 49
    Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100#13#10#1079#1072#1087#1080#1089#1080
    TabOrder = 3
    OnClick = CorrectRecsClick
  end
  object ConfirmBtn: TBitBtn
    Left = 96
    Top = 128
    Width = 75
    Height = 38
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100#13#10#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 4
    OnClick = ConfirmBtnClick
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 216
    object Instruction: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
    end
    object AboutDev: TMenuItem
      Caption = #1054' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1077
      OnClick = AboutDevClick
    end
  end
end
