import '../model/AnimalModel.dart';

class AnimalController {
  final Animal animal = Animal(
    nome: "Julie",
    idadeMeses: 3,
    historia:
        "Julie é uma cadelinha branca muito carinhosa e adora brincar. Está procurando um lar cheio de amor!",
    caracteristicas: [
      "Dócil",
      "Carinhoso",
      "Brincalhão",
      "Sociável",
      "Branco",
      "Amoroso",
      "Elétrico",
      "Leal",
      "Gosta de crianças",
      "Vacinado",
    ],
    localizacao: "São Paulo, SP, Avenida X, 123",
    imagemUrl: "assets/pitbull.jpg",  // Usando o caminho do asset
  );

  final Anunciante anunciante = Anunciante(
    nome: "João Silva",
    telefone: "11999999999",
    email: "joao@gmail.com",
  );
}