unit TextFunctions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    input1: TMemo;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Create(Sender: TObject);
    procedure Keypress(Sender: TObject; var Key: Char);
    procedure Activate(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure AddStringToStartOfLine(var Text: string; const str: string; skipempty: Boolean);
procedure AddStringToEndOfLine(var Text: string; const str: string; skipempty: Boolean);
procedure AddEOL(var Text: string; const str: string; const separator: string);
procedure RemFirstWord(var Text: string);
procedure RemLastWord(var Text: string);
procedure RemLeadingBlanks(var Text: string);
procedure RemTrailingBlanks(var Text: string);
procedure RemLineContainingString(var Text: string; var str: string);
procedure KeepLineContainingString(var Text: string; var str: string);
procedure KeepFirstW(var Text: string);
procedure KeepLastW(var Text: string);
procedure ReplaceString(var Text: string; var str: string);
procedure ModifyText;
procedure Findit(Sender: TObject);

var
  Form1: TForm1;

implementation

uses remain;

{$R *.dfm}

procedure Findit(Sender: TObject);
var
  txt, searchstr: string;
  N, L, startpos: integer;
begin
  searchstr := MainForm.FindDialog1.FindText;
  txt := Copy(MainForm.Editor.Text, startpos, maxint);
  if frMatchCase in MainForm.FindDialog1.Options then
    N := AnsiPos(searchstr, txt)
  else
    N := AnsiPos(AnsiLowerCase(searchstr), AnsiLowerCase(txt));
  L := Length(searchstr);
  if N > 0 then
  begin
    MainForm.Editor.SelStart := startpos + N - 2;
    MainForm.Editor.SelLength := L;
    startpos := MainForm.Editor.SelStart + 1 + L;
  end;
  if N = 0 then
  begin
    if (startpos = MainForm.Editor.SelStart + 1) then
      showmessage('No matches found.')
    else
    begin
      startpos := 1;
    end;
  end;
end;

procedure AddStringToStartOfLine(var Text: string; const str: string; skipempty: Boolean);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      if not ((skipempty = true) and (Lines[i] = '')) then Lines[i] := str + Lines[i];
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure AddStringToEndOfLine(var Text: string; const str: string; skipempty: Boolean);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      if not ((skipempty = true) and (Lines[i] = '')) then Lines[i] := Lines[i] + str;
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure AddEOL(var Text: string; const str: string; const separator: string);
var
  outputText, stri: string;
  index, searchLength: Integer;
begin
  outputText := '';
  if Form1.CheckBox1.Checked = false then
    stri := AnsiLowerCase(str) else stri := str;
  searchLength := Length(str);
  index := 1;
  while index <= Length(Text) do
  begin
    if AnsiLowerCase(Copy(Text, index, searchLength)) = stri then
    begin
      if Form1.CheckBox2.Checked = true then
        outputText := outputText + separator + Copy(Text, index, searchLength)
      else
        outputText := outputText + Copy(Text, index, searchLength) + separator;
      Inc(index, searchLength);
    end
    else
    begin
      outputText := outputText + Text[index];
      Inc(index);
    end;
  end;
  Text := outputText;
end;

procedure RemFirstWord(var Text: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
    begin
      if AnsiPos(' ', Lines[i]) = 0 then Lines[i] := '' else
        Lines[i] := AnsiRightStr(Lines[i], Length(Lines[i]) - AnsiPos(' ', Lines[i]));
    end;
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure RemLastWord(var Text: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      Lines[i] := AnsiLeftStr(Lines[i], LastDelimiter(' ', Lines[i]) - 1);
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure RemLeadingBlanks(var Text: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      Lines[i] := TrimLeft(Lines[i]);
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure RemTrailingBlanks(var Text: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      Lines[i] := TrimRight(Lines[i]);
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure RemLineContainingString(var Text: string; var str: string);
var
  Lines, Lines2: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  Lines2 := TStringList.Create;
  try
    Lines.Text := Text;
    if Form1.CheckBox1.Checked = True then
    begin
      for i := 0 to Lines.Count - 1 do
        if AnsiPos(str, Lines[i]) = 0 then Lines2.Add(Lines[i])
    end
    else
    begin
      for i := 0 to Lines.Count - 1 do
        if AnsiPos(AnsiLowerCase(str), AnsiLowerCase(Lines[i])) = 0 then Lines2.Add(Lines[i]);
    end;
    Text := Lines2.Text;
  finally
    Lines.Free;
  end;
end;

procedure KeepLineContainingString(var Text: string; var str: string);
var
  Lines, Lines2: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  Lines2 := TStringList.Create;
  try
    Lines.Text := Text;
    if Form1.CheckBox1.Checked = True then
    begin
      for i := 0 to Lines.Count - 1 do
        if AnsiPos(str, Lines[i]) <> 0 then Lines2.Add(Lines[i])
    end
    else
    begin
      for i := 0 to Lines.Count - 1 do
        if AnsiPos(AnsiLowerCase(str), AnsiLowerCase(Lines[i])) <> 0 then Lines2.Add(Lines[i]);
    end;
    Text := Lines2.Text;
  finally
    Lines.Free;
  end;
end;

procedure KeepFirstW(var Text: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      Lines[i] := AnsiLeftStr(Lines[i], AnsiPos(' ', Lines[i]) - 1);
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure KeepLastW(var Text: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := Text;
    for i := 0 to Lines.Count - 1 do
      Lines[i] := AnsiRightStr(Lines[i], Length(Lines[i]) - LastDelimiter(' ', Lines[i]));
    Text := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure ReplaceString(var Text: string; var str: string);
begin
  Text := AnsiReplaceStr(Text, str, '')
end;

//-------------------------------------

procedure ModifyText;
var
  str1: string;
  skipempty: Boolean;
begin
  txt := MainForm.Editor.Text;
  if Form1.Label2.Caption = '1' then
  begin
    str1 := Form1.input1.Text;
    if Form1.CheckBox1.Checked = true then skipempty := true else skipempty := false;
    if Form1.CheckBox2.Checked = true then str1 := str1 + ' ';
    AddStringToStartOfLine(txt, str1, skipempty);
  end;

  if Form1.Label2.Caption = '2' then
  begin
    str1 := Form1.input1.Text;
    if Form1.CheckBox1.Checked = true then skipempty := true else skipempty := false;
    if Form1.CheckBox2.Checked = true then str1 := ' ' + str1;
    AddStringToEndOfLine(txt, str1, skipempty);
  end;

  if Form1.Label2.Caption = '3' then
  begin
    str1 := Form1.input1.Text;
    AddEOL(txt, str1, sLineBreak);
  end;

  if Form1.Label2.Caption = '4' then
  begin
    str1 := Form1.input1.Text;
    AddEOL(txt, str1, sLineBreak + sLineBreak);
  end;

  if Form1.Label2.Caption = '11' then
  begin
    str1 := Form1.input1.Text;
    RemLineContainingString(txt, str1);
  end;

  if Form1.Label2.Caption = '15' then
  begin
    str1 := Form1.input1.Text;
    KeepLineContainingString(txt, str1);
  end;

  if Form1.Label2.Caption = '0' then
  begin
    Findit(nil);
  end;

  oldtxt := MainForm.Editor.Text;
  //Implement changes
  MainForm.Editor.Text := txt;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ModifyText;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Create(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TForm1.Keypress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TForm1.Activate(Sender: TObject);
var nr: Integer;
  cap: string;
begin
  nr := strtoint(Form1.Label2.Caption);
  if nr > 0 then
  begin
  cap := StringReplace(MainForm.MainMenu.Items.Items[2][nr - 1].Caption,
    '&', '', [rfReplaceAll, rfIgnoreCase]);
  cap := StringReplace(cap, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Form1.Caption := cap;
  end;
end;

end.

