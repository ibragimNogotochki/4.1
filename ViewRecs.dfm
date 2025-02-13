object ViewForm: TViewForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1074#1077#1076#1077#1085#1080#1081
  ClientHeight = 172
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
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
end
