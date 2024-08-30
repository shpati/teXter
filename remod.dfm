object TextForm: TTextForm
  Left = 284
  Top = 219
  Width = 296
  Height = 541
  Caption = 'Modify Text'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 240
    Width = 25
    Height = 17
    Caption = 'and'
  end
  object Label2: TLabel
    Left = 8
    Top = 368
    Width = 212
    Height = 13
    Caption = 'The following modifications will be performed:'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 129
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = '[Select action]'
    OnChange = UpdateText
    Items.Strings = (
      'Add '
      'Delete '
      'Replace ')
  end
  object ComboBox2: TComboBox
    Left = 144
    Top = 8
    Width = 129
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = '[Select type]'
    OnChange = UpdateText
    Items.Strings = (
      'String '
      'Line '
      'Empty Line ')
  end
  object ComboBox3: TComboBox
    Left = 8
    Top = 112
    Width = 265
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = '[Select position]'
    OnChange = UpdateText
    Items.Strings = (
      'Before '
      'After '
      'Containing '
      'Between ')
  end
  object TextBox: TMemo
    Left = 8
    Top = 384
    Width = 265
    Height = 73
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object String1: TMemo
    Left = 8
    Top = 160
    Width = 265
    Height = 73
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 4
    WantTabs = True
    OnChange = UpdateText
  end
  object String2: TMemo
    Left = 7
    Top = 280
    Width = 265
    Height = 73
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 5
    WantTabs = True
    OnChange = UpdateText
  end
  object NewText: TMemo
    Left = 7
    Top = 32
    Width = 265
    Height = 73
    ScrollBars = ssBoth
    TabOrder = 6
    WantTabs = True
    OnChange = UpdateText
  end
  object Button1: TButton
    Left = 168
    Top = 464
    Width = 105
    Height = 33
    Caption = 'Modify'
    TabOrder = 7
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 472
    Width = 153
    Height = 17
    Caption = 'Apply to selected text only'
    TabOrder = 8
  end
  object ComboBox4: TComboBox
    Left = 7
    Top = 136
    Width = 265
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = '[Select location]'
    OnChange = UpdateText
    Items.Strings = (
      'String '
      'Line Start '
      'Line End '
      'Empty Line ')
  end
  object ComboBox5: TComboBox
    Left = 7
    Top = 256
    Width = 265
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = '[Select location]'
    OnChange = UpdateText
    Items.Strings = (
      'String '
      'Line Start '
      'Line End '
      'Empty Line ')
  end
end
