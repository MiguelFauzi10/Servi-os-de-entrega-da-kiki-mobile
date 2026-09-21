class Diretor {
  final String nome;
  final String biografia;
  final String visaoSobreFilme;
  final String linkProducao;
  final String linkOficial;

  Diretor({
    required this.nome,
    required this.biografia,
    required this.visaoSobreFilme,
    required this.linkProducao,
    required this.linkOficial,
  });

  factory Diretor.fromJson(Map<String, dynamic> json) {
    return Diretor(
      nome: json['nome'],
      biografia: json['biografia'],
      visaoSobreFilme: json['visaoSobreFilme'],
      linkProducao: json['linkProducao'],
      linkOficial: json['linkOficial'],
    );
  }
}