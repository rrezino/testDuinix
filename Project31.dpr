program Project31;

uses
  Vcl.Forms,
  Test2 in 'Test2.pas' {Form36};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm36, Form36);
  Application.Run;
end.
