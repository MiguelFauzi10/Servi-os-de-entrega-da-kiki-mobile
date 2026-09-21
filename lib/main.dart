import 'package:flutter/material.dart';

import 'models/filme.dart';
import 'models/diretor.dart';
import 'services/dados_service.dart';
import 'pages/tela1.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serviços de Entrega da Kiki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: true,
      ),
      home: const CarregandoApp(),
    );
  }
}

class CarregandoApp extends StatelessWidget {
  const CarregandoApp({super.key});

  Future<List<Object>> carregar() async {
    final Filme filme = await DadosService.carregarFilme();
    final Diretor diretor = await DadosService.carregarDiretor();

    return [filme, diretor];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Object>>(
      future: carregar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Erro ao carregar os dados:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        final filme = snapshot.data![0] as Filme;
        final diretor = snapshot.data![1] as Diretor;

        return Tela1(
          filme: filme,
          diretor: diretor,
        );
      },
    );
  }
}