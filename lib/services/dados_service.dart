import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/filme.dart';
import '../models/diretor.dart';
import '../models/avaliacao.dart';
import '../models/elenco.dart';

class DadosService {
  static Future<Map<String, dynamic>> carregarDados() async {
    final arquivo = await rootBundle.loadString('assets/dados.json');
    return jsonDecode(arquivo);
  }

  static Future<Filme> carregarFilme() async {
    final dados = await carregarDados();
    return Filme.fromJson(dados['filme']);
  }

  static Future<Diretor> carregarDiretor() async {
    final dados = await carregarDados();
    return Diretor.fromJson(dados['diretor']);
  }

  static Future<List<Avaliacao>> carregarAvaliacoes() async {
    final dados = await carregarDados();

    return (dados['avaliacoes'] as List)
        .map((item) => Avaliacao.fromJson(item))
        .toList();
  }

  static Future<List<Elenco>> carregarElenco() async {
    final dados = await carregarDados();

    return (dados['elenco'] as List)
        .map((item) => Elenco.fromJson(item))
        .toList();
  }

  static Future<List<String>> carregarCuriosidades() async {
    final dados = await carregarDados();

    return List<String>.from(dados['curiosidades']);
  }
}