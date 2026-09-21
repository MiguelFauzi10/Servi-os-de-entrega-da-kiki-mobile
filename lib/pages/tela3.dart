import 'package:flutter/material.dart';

import '../models/avaliacao.dart';
import '../services/avaliacao_service.dart';
import '../services/dados_service.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    const fonte = 'serif';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Avaliações',
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
          child: FutureBuilder<List<Avaliacao>>(
            future: DadosService.carregarAvaliacoes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Erro ao carregar as avaliações.',
                    style: TextStyle(
                      fontFamily: fonte,
                      color: Colors.white,
                    ),
                  ),
                );
              }

              final avaliacoes = snapshot.data ?? [];

              return Column(
                children: [
                  const SizedBox(height: 18),

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
                      'assets/imagens/kiki_padaria.png',
                      height: 160,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 10),
                      itemCount: avaliacoes.length,
                      itemBuilder: (context, index) {
                        final avaliacao = avaliacoes[index];

                        return Card(
                          color: Colors.white.withValues(alpha: 0.92),
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                              color: index.isEven
                                  ? const Color(0xFF5DB8E8)
                                  : const Color(0xFF76C893),
                              width: 3,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  avaliacao.comentario,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontFamily: fonte,
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 22,
                                      color: Color(0xFFFFB300),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      avaliacao.pontuacao,
                                      style: const TextStyle(
                                        fontFamily: fonte,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          AvaliacaoService.abrirLinkAdoroCinema();
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: const Text(
                          'VER CRÍTICAS NO ADOROCINEMA',
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}