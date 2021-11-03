unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,UForInParser;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 s:string;
begin
 for s in StringParser('11,22,33,44,55',',') do
  Memo1.Lines.add(s);
 for s in StringParser('one two three four five',' ') do
  Memo1.Lines.add(s);
 for s in StringParser('Test1;Test2;Test3;Test4;Test5',';') do
  Memo1.Lines.add(s);
 for s in StringParser('1;2;3;4;5',';') do
  Memo1.Lines.add(s);
end;

end.
