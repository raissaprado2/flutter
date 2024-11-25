import 'package:flutter/material.dart';
import '../controller/AnimalController.dart';

class AnimalView extends StatefulWidget {
  @override
  _AnimalViewState createState() => _AnimalViewState();
}

class _AnimalViewState extends State<AnimalView> {
  final AnimalController controller = AnimalController();
  bool isFavorite = false;  // Variável para controlar o estado de favorito

  @override
  Widget build(BuildContext context) {
    final animal = controller.animal;
    final anunciante = controller.anunciante;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Animal'),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,  // Ícone de coração
              color: isFavorite ? Colors.red : Colors.grey,  // Cor do ícone
              size: 28.0, // Tamanho do ícone
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;  // Alterna o estado de favorito
              });
              // Aqui pode adicionar lógica para salvar esse favorito (ex: no banco de dados)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/pitbull.jpg', // Caminho correto para a imagem nos assets
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Nome e idade do animal
                  Center(
                    child: Text(
                      '${animal.nome} - ${animal.idadeMeses} meses',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8),
                  // História do animal
                  Text(
                    'História de ${animal.nome}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    animal.historia,
                    style: TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  // Botão de contato
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para entrar em contato
                      },
                      child: Text(
                        "Entrar em contato",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB6EB7A),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Características
                  Text(
                    "Características",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: animal.caracteristicas
                        .map(
                          (caracteristica) => Chip(
                            label: Text(
                              caracteristica,
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Color(0xFFB6EB7A),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 24),
                  // Localização
                  Text(
                    "Localização",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Mapa aqui",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Anunciante
                  Text(
                    "Anunciante",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome: ${anunciante.nome}",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Telefone: ${anunciante.telefone}",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Email: ${anunciante.email}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  // Lógica para adotar
                },
                child: Text("Adote"),
              ),
              TextButton(
                onPressed: () {
                  // Lógica para colaboração
                },
                child: Text("Colabore"),
              ),
              TextButton(
                onPressed: () {
                  // Lógica para divulgar
                },
                child: Text("Divulgue"),
              ),
              TextButton(
                onPressed: () {
                  // Lógica para acessar o perfil
                },
                child: Text("Perfil"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
