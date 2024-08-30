object Form1: TForm1
  Left = 501
  Top = 420
  BorderStyle = bsDialog
  Caption = 'Modity Text'
  ClientHeight = 152
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
    Width = 53
    Height = 13
    Caption = 'Enter string'
  end
  object Label2: TLabel
    Left = 416
    Top = 8
    Width = 3
    Height = 13
    Caption = ' '
    Visible = False
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
    Top = 120
    Width = 105
    Height = 25
    Caption = 'Skip empty lines'
    TabOrder = 1
  end
  object CheckBox2: TCheckBox
    Left = 120
    Top = 120
    Width = 153
    Height = 25
    Caption = 'Add space after string'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 280
    Top = 120
    Width = 81
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 120
    Width = 81
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = Button2Click
  end
end
