object CorrectSelectedForm: TCorrectSelectedForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1079#1072#1087#1080#1089#1080
  ClientHeight = 83
  ClientWidth = 576
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 244
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1085#1085#1099#1077' '#1086' '#1087#1088#1080#1073#1086#1088#1077'(ESC '#1076#1083#1103' '#1074#1099#1093#1086#1076#1072'):'
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 64
    Height = 15
    Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
  end
  object Label3: TLabel
    Left = 165
    Top = 24
    Width = 83
    Height = 15
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 254
    Top = 24
    Width = 66
    Height = 15
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
  end
  object Label5: TLabel
    Left = 381
    Top = 24
    Width = 103
    Height = 15
    Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
  end
  object Label6: TLabel
    Left = 88
    Top = 24
    Width = 59
    Height = 15
    Caption = #1062#1077#1085#1072'('#1082#1086#1087'.)'
  end
  object InvNumEdit: TEdit
    Left = 8
    Top = 45
    Width = 74
    Height = 23
    TabOrder = 0
    OnChange = InvNumEditChange
    OnKeyPress = BlockNonNums
  end
  object NameEdit: TEdit
    Left = 165
    Top = 45
    Width = 83
    Height = 23
    TabOrder = 1
    OnChange = NameEditChange
  end
  object ProdDateEdit: TEdit
    Left = 381
    Top = 45
    Width = 103
    Height = 23
    MaxLength = 10
    TabOrder = 2
    OnChange = ProdDateEditChange
  end
  object PurposeEdit: TEdit
    Left = 254
    Top = 45
    Width = 121
    Height = 23
    TabOrder = 3
    OnChange = PurposeEditChange
  end
  object WriteBtn: TBitBtn
    Left = 490
    Top = 45
    Width = 78
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Enabled = False
    TabOrder = 4
    OnClick = WriteBtnClick
  end
  object PriceEdit: TEdit
    Left = 88
    Top = 45
    Width = 71
    Height = 23
    TabOrder = 5
    OnChange = PriceEditChange
    OnKeyPress = BlockNonNums
  end
  object DeleteBtn: TBitBtn
    Left = 490
    Top = 14
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 6
    OnClick = DeleteBtnClick
  end
  object SaveDialog1: TSaveDialog
    Filter = #1041#1080#1085#1072#1088#1085#1099#1081' '#1092#1072#1081#1083'(.bin)|*.bin'
    Left = 8
    Top = 72
  end
end
