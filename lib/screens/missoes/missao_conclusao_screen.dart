
import 'package:flutter/material.dart';
import 'dart:math';

class MissaoConclusaoScreen extends StatelessWidget {
  const MissaoConclusaoScreen({super.key});

  String getPalavraInspiradora() {
    const palavras = [
      'Você é luz no caminho de alguém.',
      'Que a paz habite em você.',
      'Missão concluída com fé!',
      'Pequenos atos têm grande valor.',
      'Deus viu o seu gesto.',
      'Continue semeando o bem.',
      'Gratidão transforma o coração.',
    ];
    return palavras[Random().nextInt(palavras.length)];
  }

  @override
  Widget build(BuildContext context) {
    final mensagem = getPalavraInspiradora();

    return Scaffold(
      backgroundColor: const Color(0xFF0D1E1A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events_rounded,
                  color: Color(0xFFFFD54F), size: 80),
              const SizedBox(height: 24),
              const Text(
                'Missão concluída!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/missoes'));
                },
                icon: const Icon(Icons.home_rounded),
                label: const Text('Voltar às Missões'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
