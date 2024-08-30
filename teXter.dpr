program teXter;

uses
  Forms,
  reabout in 'reabout.pas' {AboutBox},
  remain in 'remain.pas' {MainForm},
  reinit in 'reinit.pas',
  TextFunctions in 'TextFunctions.pas' {Form1},
  ReplaceFunctions in 'ReplaceFunctions.pas' {Form2};

{$R texter.RES}

begin
  Application.Initialize;
  Application.Title := 'teXter';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

