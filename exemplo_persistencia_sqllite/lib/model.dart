class ContatoModel {
  // Atributos
  int id;
  String nome;
  String email;
  String telefone;
  String endereco;
  String login; // Novo atributo para login

  // Construtor
  ContatoModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.login, // Adicionando login ao construtor
  });

  // Mapeamento
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'login': login, // Adicionando login ao mapa
    };
  }

  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      login: map['login'], // Obtendo login do mapa
    );
  }
}
