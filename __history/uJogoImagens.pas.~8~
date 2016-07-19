unit uJogoImagens;

interface

uses Classes, Graphics, SysUtils, ExtCtrls;

type
ELimiteJogo = class(Exception);

TTipoJogoImagem = (JImgSuperior, JImgInferior);


TJogoImagens = class(TComponent)
private
  FImagensSuperiores: TList;
  FImagensInferiores: TList;
protected
  function GetTipoJogoList(const TipoJogoImagem: TTipoJogoImagem): TList;
public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;

  procedure AddImagem(const TipoJogoImagem: TTipoJogoImagem; var Img:  TImage);

  function JogarImagem(const TipoJogoImagem: TTipoJogoImagem; Img: TImage): Boolean;
published

end;


implementation


{ TJogoImagens }

procedure TJogoImagens.AddImagem(const TipoJogoImagem: TTipoJogoImagem;
  var Img: TImage);
begin
    GetTipoJogoList(TipoJogoImagem).Add(Img);
end;

constructor TJogoImagens.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FImagensSuperiores := TList.Create;
  FImagensInferiores := TList.Create;
end;

destructor TJogoImagens.Destroy;
begin
  FreeAndNil(FImagensSuperiores);
  FreeAndNil(FImagensInferiores);
  inherited;
end;

function TJogoImagens.GetTipoJogoList(
  const TipoJogoImagem: TTipoJogoImagem): TList;
begin
    if TipoJogoImagem = JImgSuperior  then
      Result := FImagensSuperiores
    else
      Result := FImagensInferiores;
end;

function TJogoImagens.JogarImagem(const TipoJogoImagem: TTipoJogoImagem;
  Img: TImage): Boolean;
  var listImg: TList;
      listDest: TList;
      var i: Integer;
      imgDest: TImage;
begin
    if img.Picture.Graphic = nil then
      Exit;

    listImg := GetTipoJogoList(TipoJogoImagem);

    if TipoJogoImagem = JImgSuperior then
        listDest := FImagensInferiores
    else
       listDest := FImagensSuperiores;


    for I := 0 to listDest.Count - 1 do
    begin
      imgDest := TImage(listDest.List[I]);
      if imgDest.Picture.Graphic = nil then
      begin
          imgDest.Picture := Img.Picture;
          Break;
      end
      else
        if I = listDest.Count - 1 then
          raise ELimiteJogo.Create('Imagem não pode ser movida.');
    end;
    i := listImg.IndexOf(Img);
    if i  >= 0 then
      TImage(listImg.List[i]).Picture := nil
    else
      raise EListError.Create('Não foi encontrado a imagem na lista de imagens para mover.');
end;


end.
