program JogoImagem;

uses
  Forms,
  uMainJogoImagens in 'uMainJogoImagens.pas' {FrmJogoImagens},
  uJogoImagens in 'uJogoImagens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmJogoImagens, FrmJogoImagens);
  Application.Run;
end.
