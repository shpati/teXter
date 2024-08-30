unit ReplaceFunctions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    input1: TMemo;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    input2: TMemo;
    Label4: TLabel;
    input3: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Keypress(Sender: TObject; var Key: Char);
    procedure Create(Sender: TObject);
    procedure Activate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ReplaceText;

var
  Form2: TForm2;

implementation

uses TextFunctions, remain;

{$R *.dfm}

//-------------------------------------

procedure ReplaceText;
var
  str1, str2, str3: string;
  Lines: TStringList;
  i: Integer;
  startPos, endPos, len: Integer;
  inputText, outputText: string;
begin
  txt := MainForm.Editor.Text;

  if Form2.Label2.Caption = '17' then
  begin
    str1 := Form2.input1.Text;
    str2 := Form2.input2.Text;
    if Form2.CheckBox1.Checked = true then
      txt := StringReplace(txt, str1, str2, [rfReplaceAll]) else
      txt := StringReplace(txt, str1, str2, [rfReplaceAll, rfIgnoreCase]);
  end;

  if Form2.Label2.Caption = '18' then
  begin
    str1 := Form2.input1.Text;
    str2 := Form2.input2.Text;
    Lines := TStringList.Create;
    try
      Lines.Text := txt;
      if Form2.CheckBox1.Checked = true then
      begin
        for i := 0 to Lines.Count - 1 do
          if AnsiPos(str1, Lines[i]) > 0 then
            Lines[i] := str2 + AnsiRightStr(Lines[i], Length(Lines[i]) -
              AnsiPos(str1, Lines[i]) - Length(str1) + 1);
      end else
      begin
        for i := 0 to Lines.Count - 1 do
          if AnsiPos(AnsiLowerCase(str1), AnsiLowerCase(Lines[i])) > 0 then
            Lines[i] := str2 + AnsiRightStr(Lines[i], Length(Lines[i]) -
              AnsiPos(AnsiLowerCase(str1), AnsiLowerCase(Lines[i])) -
              Length(str1) + 1);
      end;
      txt := Lines.Text;
    finally
      Lines.Free;
    end;
  end;

  if Form2.Label2.Caption = '19' then
  begin
    str1 := Form2.input1.Text;
    str2 := Form2.input2.Text;
    Lines := TStringList.Create;
    try
      Lines.Text := txt;
      if Form2.CheckBox1.Checked = true then
      begin
        for i := 0 to Lines.Count - 1 do
          if AnsiPos(str1, Lines[i]) > 0 then
            Lines[i] := AnsiLeftStr(Lines[i], AnsiPos(str1, Lines[i]) - 1) + str2;
      end else
      begin
        for i := 0 to Lines.Count - 1 do
          if AnsiPos(AnsiLowerCase(str1), AnsiLowerCase(Lines[i])) > 0 then
            Lines[i] := AnsiLeftStr(Lines[i], AnsiPos(AnsiLowerCase(str1),
              AnsiLowerCase(Lines[i])) - 1) + str2;
      end;
      txt := Lines.Text;
    finally
      Lines.Free;
    end;
  end;

  if Form2.Label2.Caption = '20' then
  begin
    str1 := Form2.input1.Text;
    str2 := Form2.input2.Text;
    str3 := Form2.input3.Text;
    inputText := txt;
    outputText := '';
    repeat
      begin
        if Form2.CheckBox1.Checked = True then
          startPos := AnsiPos(str1, inputText) else
          startPos := AnsiPos(AnsiLowerCase(str1), AnsiLowerCase(inputText));
        if startPos = 0 then exit;
        outputText := outputText + AnsiLeftStr(inputText, startPos - 1);
        inputText := AnsiRightStr(inputText, Length(inputText) - startPos - Length(str1) + 1);
        if Form2.CheckBox1.Checked = True then
          endPos := AnsiPos(str2, inputText) else
          endPos := AnsiPos(AnsiLowerCase(str2), AnsiLowerCase(inputText));
        if endPos > 0 then
        begin
          len := endPos - 1;
          outputText := outputText + str3;
          inputText := AnsiRightStr(inputText, Length(inputText) - len - Length(str2));
        end
        else
        begin
          len := Length(inputText);
        end;
        if Form2.CheckBox1.Checked = True then
          startPos := AnsiPos(str1, inputText) else
          startPos := AnsiPos(AnsiLowerCase(str1), AnsiLowerCase(inputText));
        outputText := outputText + AnsiLeftStr(inputText, startPos - 1);
        inputText := AnsiRightStr(inputText, Length(inputText) - startPos + 1);
      end;
    until startpos = 0;
    txt := outputText + inputText;
  end;
  oldtxt := MainForm.Editor.Text;
  //Implement changes
  MainForm.Editor.Text := txt;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ReplaceText;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.Keypress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Form2.Close;
end;

procedure TForm2.Create(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TForm2.Activate(Sender: TObject);
var nr: Integer;
  cap: string;
begin
  nr := strtoint(Form2.Label2.Caption);
  cap := StringReplace(MainForm.MainMenu.Items.Items[2][nr - 1].Caption,
    '&', '', [rfReplaceAll, rfIgnoreCase]);
  cap := StringReplace(cap, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Form2.Caption := cap;
end;

end.

