import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/diretor.dart';
import 'tela3.dart';

class Tela2 extends StatelessWidget {
  final Diretor diretor;

  const Tela2({
    super.key,
    required this.diretor,
  });

  Future<void> abrirLinkProducao() async {
    final url = Uri.parse(diretor.linkProducao);

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
        title: Text(
          'Diretor - ${diretor.nome}',
          style: const TextStyle(
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
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
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
                        'assets/imagens/miyazaki.png',
                        width: 120,
                        height: 165,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Card(
                        color: Colors.white.withValues(alpha: 0.92),
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(
                            color: Color(0xFF5DB8E8),
                            width: 3,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'APRESENTANDO O DIRETOR',
                                style: TextStyle(
                                  fontFamily: fonte,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3189B5),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                diretor.biografia,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontFamily: fonte,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Image.asset(
                  'assets/imagens/kiki_voando.png',
                  height: 170,
                ),

                const SizedBox(height: 15),

                Card(
                  color: Colors.white.withValues(alpha: 0.92),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(
                      color: Color(0xFFFFB84D),
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const Text(
                          'VISÃO DO DIRETOR',
                          style: TextStyle(
                            fontFamily: fonte,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE28A18),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          diretor.visaoSobreFilme,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontFamily: fonte,
                            fontSize: 15,
                            height: 1.45,
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
                    onPressed: abrirLinkProducao,
                    icon: const Icon(Icons.play_circle),
                    label: const Text(
                      'VER VÍDEO DA PRODUÇÃO',
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
                          builder: (context) => const Tela3(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      'VER AVALIAÇÕES',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}