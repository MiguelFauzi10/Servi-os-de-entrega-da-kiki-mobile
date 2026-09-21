class Elenco {
  final String nome;
  final String personagem;

  Elenco({
    required this.nome,
    required this.personagem,
  });

  factory Elenco.fromJson(Map<String, dynamic> json) {
    return Elenco(
      nome: json['nome'],
      personagem: json['personagem'],
    );
  }
}