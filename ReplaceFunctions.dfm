object Form2: TForm2
  Left = 760
  Top = 363
  BorderStyle = bsDialog
  Caption = 'Modity Text'
  ClientHeight = 402
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = Activate
  OnCreate = Create
  OnKeyPress = Keypress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 103
    Height = 13
    Caption = 'Enter boundrary string'
  end
  object Label2: TLabel
    Left = 416
    Top = 8
    Width = 3
    Height = 13
    Caption = ' '
    Visible = False
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 114
    Height = 13
    Caption = 'Enter replacement string'
  end
  object Label4: TLabel
    Left = 8
    Top = 248
    Width = 114
    Height = 13
    Caption = 'Enter replacement string'
  end
  object input1: TMemo
    Left = 8
    Top = 24
    Width = 441
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 0
    WantTabs = True
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 368
    Width = 105
    Height = 25
    Caption = 'Match the case'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 280
    Top = 368
    Width = 81
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 368
    Width = 81
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button2Click
  end
  object input2: TMemo
    Left = 8
    Top = 144
    Width = 441
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 4
    WantTabs = True
  end
  object input3: TMemo
    Left = 8
    Top = 264
    Width = 441
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 5
    WantTabs = True
  end
end
