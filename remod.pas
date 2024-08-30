unit remod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TTextForm = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    TextBox: TMemo;
    String1: TMemo;
    String2: TMemo;
    NewText: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    ComboBox4: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox5: TComboBox;
    procedure UpdateText(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TextForm: TTextForm;

implementation

{$R *.dfm}

procedure TTextForm.UpdateText(Sender: TObject);
begin
  if ComboBox2.Text = 'Empty Line ' then
  begin
  NewText.Text := '';
  NewText.Enabled := False;
  end else NewText.Enabled := True;
  if ComboBox3.Text = 'Between ' then ComboBox5.Enabled := True else ComboBox5.Enabled := False;
  if String1.Text = 'String ' then String1.Enabled := True else String1.Enabled := False;
  if String2.Text = 'String ' then String2.Enabled := True else String2.Enabled := False;
  TextBox.Text := ComboBox1.Text + ComboBox2.Text + NewText.Text + ComboBox3.Text
  + ComboBox4.Text + String1.Text + ComboBox5.Text + String2.Text;
end;

end.
