object CorrectForm: TCorrectForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1074#1077#1076#1077#1085#1080#1081
  ClientHeight = 189
  ClientWidth = 396
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
  object ConfirmBtn: TBitBtn
    Left = 0
    Top = 159
    Width = 81
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 1
    OnClick = ConfirmBtnClick
  end
end
