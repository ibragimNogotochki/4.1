object CorrectForm: TCorrectForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1074#1077#1076#1077#1085#1080#1081
  ClientHeight = 161
  ClientWidth = 390
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
    Width = 388
    Height = 145
    FixedCols = 0
    TabOrder = 0
    OnSelectCell = ShowGridSelectCell
    ColWidths = (
      82
      69
      64
      64
      83)
  end
end
