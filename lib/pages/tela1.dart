import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/filme.dart';
import '../models/diretor.dart';
import 'tela2.dart';

class Tela1 extends StatelessWidget {
  final Filme filme;
  final Diretor diretor;

  const Tela1({
    super.key,
    required this.filme,
    required this.diretor,
  });

  Future<void> abrirImdb() async {
    final url = Uri.parse(filme.linkImdb);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const fonte = 'serif';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Serviços de Entrega da Kiki',
          style: TextStyle(
            fontFamily: fonte,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF65C7F7),
              Color(0xFF81D8A0),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  filme.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: fonte,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFFF9DBB),
                      width: 3,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/imagens/capa.png',
                    height: 250,
                  ),
                ),

                const SizedBox(height: 25),

                Card(
                  color: Colors.white.withValues(alpha: 0.92),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(
                      color: Color(0xFF5DB8E8),
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const Text(
                          'SINOPSE',
                          style: TextStyle(
                            fontFamily: fonte,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3189B5),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          filme.sinopse,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontFamily: fonte,
                            fontSize: 15,
                            height: 1.45,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Card(
                  color: Colors.white.withValues(alpha: 0.92),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(
                      color: Color(0xFF76C893),
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const Text(
                          'INFORMAÇÕES',
                          style: TextStyle(
                            fontFamily: fonte,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4B9B68),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          filme.informacoesTecnicas,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontFamily: fonte,
                            fontSize: 15,
                            height: 1.45,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: abrirImdb,
                    icon: const Icon(Icons.movie),
                    label: const Text(
                      'VER NO IMDb',
                      style: TextStyle(
                        fontFamily: fonte,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color(0xFFFFD65A),
                      foregroundColor: Colors.black87,
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(
                          color: Color(0xFFE5A900),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Tela2(
                            diretor: diretor,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      'VER DIRETOR',
                      style: TextStyle(
                        fontFamily: fonte,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color(0xFFFF8FB3),
                      foregroundColor: Colors.white,
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(
                          color: Color(0xFFE7658C),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Image.asset(
                  'assets/imagens/jiji.png',
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}