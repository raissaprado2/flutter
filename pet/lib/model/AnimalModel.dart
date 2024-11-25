class Animal {
  final String nome;
  final int idadeMeses;
  final String historia;
  final List<String> caracteristicas;
  final String localizacao;
  final String imagemUrl;

  Animal({
    required this.nome,
    required this.idadeMeses,
    required this.historia,
    required this.caracteristicas,
    required this.localizacao,
    required this.imagemUrl,
  });
}

class Anunciante {
  final String nome;
  final String telefone;
  final String email;

  Anunciante({
    required this.nome,
    required this.telefone,
    required this.email,
  });

  get endereco => null;
}
