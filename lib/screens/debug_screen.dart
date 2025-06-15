
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  Map<String, String> _dados = {};

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    final allKeys = prefs.getKeys();

    Map<String, String> resultado = {};
    for (var key in allKeys) {
      final valor = prefs.getString(key) ?? '';
      resultado[key] = valor;
    }

    setState(() {
      _dados = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chavesOrdenadas = _dados.keys.toList()..sort();

    return Scaffold(
      appBar: AppBar(title: const Text('🔍 Dados no SharedPreferences')),
      body: _dados.isEmpty
          ? const Center(child: Text('Nenhum dado encontrado.'))
          : ListView.builder(
              itemCount: chavesOrdenadas.length,
              itemBuilder: (context, index) {
                final key = chavesOrdenadas[index];
                return ListTile(
                  title: Text(key),
                  subtitle: Text(_dados[key]!),
                );
              },
            ),
    );
  }
}
