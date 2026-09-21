class Filme {
  final String titulo;
  final String tituloOriginal;
  final String ano;
  final String duracao;
  final String pais;
  final String genero;
  final String sinopse;
  final String informacoesTecnicas;
  final String linkImdb;
  final String linkOficial;

  Filme({
    required this.titulo,
    required this.tituloOriginal,
    required this.ano,
    required this.duracao,
    required this.pais,
    required this.genero,
    required this.sinopse,
    required this.informacoesTecnicas,
    required this.linkImdb,
    required this.linkOficial,
  });

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      titulo: json['titulo'],
      tituloOriginal: json['tituloOriginal'],
      ano: json['ano'],
      duracao: json['duracao'],
      pais: json['pais'],
      genero: json['genero'],
      sinopse: json['sinopse'],
      informacoesTecnicas: json['informacoesTecnicas'],
      linkImdb: json['linkImdb'],
      linkOficial: json['linkOficial'],
    );
  }
}