import 'package:flutter/material.dart';

class JourneyPremiumScreen extends StatelessWidget {
  const JourneyPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Versão Premium')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Desbloqueie conteúdos exclusivos:\n'
          '• Reflexões em áudio\n'
          '• Jornadas personalizadas\n'
          '• Exportação completa do histórico\n'
          '• Teste de personalidade e mais!',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}