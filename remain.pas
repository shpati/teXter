unit remain;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, ClipBrd,
  ToolWin, ActnList, ImgList, TextFunctions, ReplaceFunctions, StrUtils,
  Contnrs;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FilePrintItem: TMenuItem;
    FileExitItem: TMenuItem;
    EditUndoItem: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    FontDialog1: TFontDialog;
    N5: TMenuItem;
    miEditFont: TMenuItem;
    Editor: TRichEdit;
    StatusBar: TStatusBar;
    StandardToolBar: TToolBar;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    FontSize: TEdit;
    ToolButton11: TToolButton;
    UpDown1: TUpDown;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    ToolbarImages: TImageList;
    ActionList1: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TAction;
    FileSaveCmd: TAction;
    FilePrintCmd: TAction;
    FileExitCmd: TAction;
    ToolButton1: TToolButton;
    LanguageMenu: TMenuItem;
    LanguageEnglish: TMenuItem;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditUndoCmd: TAction;
    EditFontCmd: TAction;
    FileSaveAsCmd: TAction;
    ext1: TMenuItem;
    Addtext1: TMenuItem;
    Removetext1: TMenuItem;
    ReplaceText1: TMenuItem;
    oggledarklighttheme1: TMenuItem;
    ActionList3: TActionList;
    IncreaseFontSize: TAction;
    DecreaseFontSize: TAction;
    Addfirstword1: TMenuItem;
    Addlastword1: TMenuItem;
    Removefirstword1: TMenuItem;
    Removelastword1: TMenuItem;
    Addemptylineafterstring1: TMenuItem;
    Removeemptylines1: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    Addnewlinecharacterafterstring1: TMenuItem;
    Replacetextbetweenstartofthelineandastring1: TMenuItem;
    classSecondInputHandlersublimepluginTextInputHandler1: TMenuItem;
    Removeleadingblanks1: TMenuItem;
    Removeleadingblanks2: TMenuItem;
    N8: TMenuItem;
    Keepfirstword1: TMenuItem;
    Keeplastword1: TMenuItem;
    Keeplinescontrainingstring1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Undo2: TMenuItem;
    N9: TMenuItem;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    N10: TMenuItem;
    N7: TMenuItem;
    Inserttimestampatcursorposition1: TMenuItem;
    Find1: TMenuItem;
    FindDialog1: TFindDialog;
    FindNext: TAction;
    procedure FindDialog1Find(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ActionList2Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure theme(Sender: TObject);
    procedure Increasefont(Sender: TObject);
    procedure IncreaseFontSizeExecute(Sender: TObject);
    procedure DecreaseFontSizeExecute(Sender: TObject);
    procedure wrap(Sender: TObject);
    procedure Addstringtolinestart(Sender: TObject);
    procedure Addstringtolineend(Sender: TObject);
    procedure Addnewline(Sender: TObject);
    procedure Addemptyline(Sender: TObject);
    procedure Removefirstword(Sender: TObject);
    procedure Removelastword(Sender: TObject);
    procedure Removeemptylines(Sender: TObject);
    procedure Removeleadingblanks(Sender: TObject);
    procedure Removetrailingblanks(Sender: TObject);
    procedure Removelinescontainingstring(Sender: TObject);
    procedure KeepOnlylinescontainingstring(Sender: TObject);
    procedure Keepfirstword(Sender: TObject);
    procedure Keeplastword(Sender: TObject);
    procedure Replace(Sender: TObject);
    procedure Replacetextbetweenstartofthelineandastring(Sender: TObject);
    procedure Replacetextbetweenstringandendoftheline(Sender: TObject);
    procedure Replacebetweentwostrings(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Inserttimestampatcursorposition1Click(Sender: TObject);
    procedure keypress(Sender: TObject; var Key: Char);
    procedure Findit(Sender: TObject);
    procedure FindNextExecute(Sender: TObject);

  private
    FFileName: string;
    FUpdating: Boolean;
    FDragging: Boolean;
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: string);
    procedure CheckFileSave;
    procedure SetEditRect;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
  end;

var
  MainForm: TMainForm;
  txt, oldtxt, str1: string;
  startpos: Integer;

implementation

uses REAbout, RichEdit, ShellAPI, ReInit, ReMod;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';

const
  GutterWid = 6;
{$R *.dfm}

function TMainForm.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TMainForm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TMainForm.SetFileName(const FileName: string);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [Application.Title, ExtractFileName(FileName)]);
end;

procedure TMainForm.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not Editor.Modified then
  Exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]),
    mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes: FileSave(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TMainForm.SetEditRect;
var
  R: TRect;
begin
  with Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth - GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

{ Event Handlers }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  Editor.Color := clblack;
  Editor.Font.Color := clwhite;
  Editor.Font.Size := 12;
  CurrText.Name := 'Courier New';
  CurrText.Size := 12;
  Editor.Text := '';
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := Application.Hint;
  end
  else StatusBar.SimplePanel := False;
end;

procedure TMainForm.FileNew(Sender: TObject);
begin
  SetFileName(sUntitled);
  Editor.Lines.Clear;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TMainForm.PerformFileOpen(const AFileName: string);
begin
  Editor.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor.SetFocus;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TMainForm.FileOpen(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
    Editor.ReadOnly := ofReadOnly in OpenDialog.Options;
  end;
end;

procedure TMainForm.FileSave(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
    Editor.Lines.SaveToFile(FFileName);
    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Editor.Lines.SaveToFile(SaveDialog.FileName);
    SetFileName(SaveDialog.FileName);
    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TMainForm.FilePrint(Sender: TObject);
begin
  if PrintDialog.Execute then
    Editor.Print(FFileName);
end;

procedure TMainForm.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.EditUndo(Sender: TObject);
begin
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
  if oldtxt <> '' then
  begin
    txt := Editor.Text;
    Editor.Text := oldtxt;
    oldtxt := txt;
  end;
end;

procedure TMainForm.EditCut(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TMainForm.EditCopy(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TMainForm.EditPaste(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TMainForm.HelpAbout(Sender: TObject);
begin
  with TAboutBox.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.SelectFont(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  Editor.SetFocus;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SetEditRect;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TMainForm.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TMainForm.AlignButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TMainForm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CheckFileSave;
  except
    CanClose := False;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  DragAcceptFiles(Handle, True);
  Editor.SetFocus;
  { Check if we should load a file from the command line }
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1)) else
    if FileExists('readme.txt') then PerformFileOpen('readme.txt');
end;

procedure TMainForm.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      CheckFileSave;
      PerformFileOpen(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TMainForm.SetModified(Value: Boolean);
begin
  if Value then StatusBar.Panels[1].Text := sModified
  else StatusBar.Panels[1].Text := '';
end;

procedure TMainForm.ActionList2Update(Action: TBasicAction;
  var Handled: Boolean);
begin
 { Update the status of the edit commands }
  EditCutCmd.Enabled := Editor.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if Editor.HandleAllocated then
  begin
    //EditUndoCmd.Enabled := Editor.Perform(EM_CANUNDO, 0, 0) <> 0;
    EditPasteCmd.Enabled := Editor.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
end;

procedure TMainForm.theme(Sender: TObject);
var
  font: TFontName;
  fs: Integer;
begin
  font := CurrText.Name;
  fs := CurrText.Size;
  if Editor.Color = clblack then Editor.Color := clwhite else Editor.Color := clblack;
  if Editor.Font.Color = clwhite then Editor.Font.Color := clblack else Editor.Font.Color := clwhite;
  CurrText.Name := font;
  CurrText.Size := fs;
end;

procedure TMainForm.Increasefont(Sender: TObject);
begin
  CurrText.Size := CurrText.Size + 1;
end;

procedure TMainForm.IncreaseFontSizeExecute(Sender: TObject);
begin
  CurrText.Size := CurrText.Size + 1;
end;

procedure TMainForm.DecreaseFontSizeExecute(Sender: TObject);
begin
  if CurrText.Size > 1 then CurrText.Size := CurrText.Size - 1;
end;

procedure TMainForm.wrap(Sender: TObject);
begin
  if Editor.WordWrap = True then Editor.WordWrap := False else Editor.WordWrap := True;
end;

procedure TMainForm.Addstringtolinestart(Sender: TObject);
begin
  Form1.Label2.Caption := '1';
  Form1.CheckBox1.Caption := 'Skip empty lines';
  Form1.CheckBox2.Caption := 'Add space after string';
  Form1.CheckBox2.Visible := True;
  Form1.Show;
end;

procedure TMainForm.Addstringtolineend(Sender: TObject);
begin
  Form1.Label2.Caption := '2';
  Form1.CheckBox1.Caption := 'Skip empty lines';
  Form1.CheckBox2.Caption := 'Add space before string';
  Form1.CheckBox2.Visible := True;
  Form1.Show;
end;

procedure TMainForm.Addnewline(Sender: TObject);
begin
  Form1.Label2.Caption := '3';
  Form1.CheckBox1.Caption := 'Match the case';
  Form1.CheckBox2.Caption := 'tick=before, no tick=after';
  Form1.CheckBox2.Visible := True;
  Form1.Show;
end;

procedure TMainForm.Addemptyline(Sender: TObject);
begin
  Form1.Label2.Caption := '4';
  Form1.CheckBox1.Caption := 'Match the case';
  Form1.CheckBox2.Caption := 'tick=before, no tick=after';
  Form1.CheckBox2.Visible := True;
  Form1.Show;
end;

procedure TMainForm.Removefirstword(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  RemFirstWord(txt);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Removelastword(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  RemLastWord(txt);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Removeemptylines(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  txt := AnsiReplaceStr(txt, sLineBreak + sLineBreak, sLineBreak);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Removeleadingblanks(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  RemLeadingBlanks(txt);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Removetrailingblanks(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  RemTrailingBlanks(txt);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Removelinescontainingstring(Sender: TObject);
begin
  Form1.Label2.Caption := '11';
  Form1.CheckBox1.Caption := 'Match the case';
  Form1.CheckBox2.Visible := False;
  Form1.Show;
end;

procedure TMainForm.KeepOnlylinescontainingstring(Sender: TObject);
begin
  Form1.Label2.Caption := '15';
  Form1.CheckBox1.Caption := 'Match the case';
  Form1.CheckBox2.Visible := False;
  Form1.Show;
end;

procedure TMainForm.Keepfirstword(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  KeepFirstW(txt);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Keeplastword(Sender: TObject);
var txt: string;
begin
  txt := Editor.Text;
  KeepLastW(txt);
  oldtxt := Editor.Text;
  Editor.Text := txt;
end;

procedure TMainForm.Replace(Sender: TObject);
var txt: string;
begin
  Form2.Label1.Caption := 'Enter initial string';
  Form2.Label2.Caption := '17';
  Form2.Label3.Caption := 'Enter replacement string';
  Form2.CheckBox1.Caption := 'Match the case';
  Form2.Label4.Visible := False;
  Form2.input3.Visible := False;
  Form2.Show;
end;

procedure TMainForm.Replacetextbetweenstartofthelineandastring(Sender: TObject);
var txt: string;
begin
  Form2.Label1.Caption := 'Enter boundrary ending string';
  Form2.Label2.Caption := '18';
  Form2.Label3.Caption := 'Enter replacement string';
  Form2.CheckBox1.Caption := 'Match the case';
  Form2.Label4.Visible := False;
  Form2.input3.Visible := False;
  Form2.Show;
end;

procedure TMainForm.Replacetextbetweenstringandendoftheline(Sender: TObject);
var txt: string;
begin
  Form2.Label1.Caption := 'Enter boundrary starting string';
  Form2.Label2.Caption := '19';
  Form2.Label3.Caption := 'Enter replacement string';
  Form2.CheckBox1.Caption := 'Match the case';
  Form2.Label4.Visible := False;
  Form2.input3.Visible := False;
  Form2.Show;
end;

procedure TMainForm.Replacebetweentwostrings(Sender: TObject);
var txt: string;
begin
  Form2.Label1.Caption := 'Enter boundrary starting string';
  Form2.Label2.Caption := '20';
  Form2.Label3.Caption := 'Enter boundrary ending string';
  Form2.CheckBox1.Caption := 'Match the case';
  Form2.Label4.Visible := True;
  Form2.input3.Visible := True;
  Form2.Show;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  //free
end;

procedure TMainForm.Inserttimestampatcursorposition1Click(Sender: TObject);
var
  timestamp: TDateTime;
begin
  timestamp := Now;
  Editor.SelLength := 0;
  Editor.SelText := FormatDateTime('d mmm YYYY hh:mm:ss', timestamp);
end;

procedure TMainForm.keypress(Sender: TObject; var Key: Char);
begin
  oldtxt := Editor.Text;
end;

procedure TMainForm.FindDialog1Find(Sender: TObject);
begin
  finddialog1.findtext := '';
  finddialog1.execute;
  startpos := Editor.SelStart + 1;
end;

procedure TMainForm.Findit(Sender: TObject);
var
  txt, searchstr: string;
  N, L: integer;
begin
  searchstr := FindDialog1.FindText;
  txt := Copy(Editor.Text, startpos, maxint);
  if frMatchCase in FindDialog1.Options then
    N := AnsiPos(searchstr, txt)
  else
    N := AnsiPos(AnsiLowerCase(searchstr), AnsiLowerCase(txt));
  L := Length(searchstr);
  if N > 0 then
  begin
    Editor.SelStart := startpos + N - 2;
    Editor.perform( EM_SCROLLCARET, 0, 0 );
    Editor.SelLength := L;
    startpos := Editor.SelStart + 1 + L;
  end;
  if N = 0 then
  begin
    if (startpos = Editor.SelStart + 1) then
      showmessage('No matches found.')
    else
    begin
      startpos := 1;
    end;
  end;
end;

procedure TMainForm.FindNextExecute(Sender: TObject);
begin
  Findit(Nil);
end;

end.

