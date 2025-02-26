object ViewForm: TViewForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1074#1077#1076#1077#1085#1080#1081
  ClientHeight = 195
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object ShowGrid: TStringGrid
    Left = 0
    Top = 8
    Width = 505
    Height = 153
    FixedCols = 0
    TabOrder = 0
    ColWidths = (
      82
      69
      92
      144
      94)
  end
  object CheckBox1: TCheckBox
    Left = 6
    Top = 170
    Width = 540
    Height = 17
    Caption = 
      #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '#1079#1072#1076#1072#1085#1080#1077#1084'('#1062#1077#1085#1072' '#1085#1077' '#1073#1086#1083#1077#1077' 1000 '#1082#1086#1087', '#1087#1088#1086 +
      #1080#1079#1074#1077#1076#1077#1085#1099' '#1088#1072#1085#1077#1077' 1999 '#1075#1086#1076#1072')'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
end
