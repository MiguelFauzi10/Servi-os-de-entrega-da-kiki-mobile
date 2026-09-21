class Avaliacao {
  final String comentario;
  final String pontuacao;

  Avaliacao({
    required this.comentario,
    required this.pontuacao,
  });

  factory Avaliacao.fromJson(Map<String, dynamic> json) {
    return Avaliacao(
      comentario: json['comentario'],
      pontuacao: json['pontuacao'],
    );
  }
}