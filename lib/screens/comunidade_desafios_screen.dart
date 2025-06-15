
import 'package:flutter/material.dart';

class ComunidadeDesafiosScreen extends StatelessWidget {
  const ComunidadeDesafiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conquistas = [
      {"nome": "Heitor Oliveira", "meta": "21 dias de gratidão", "medalha": "🥇"},
      {"nome": "Lucas Semeador", "meta": "Reflexão diária por 7 dias", "medalha": "🥈"},
      {"nome": "Maria Clara", "meta": "1 semana de oração noturna", "medalha": "🥉"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("Conquistas Compartilhadas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: conquistas.length,
        itemBuilder: (context, index) {
          final c = conquistas[index];
          return Card(
            color: const Color(0xFF1A1A1A),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Text(c["medalha"]!, style: const TextStyle(fontSize: 32)),
              title: Text(c["nome"]!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text(c["meta"]!, style: const TextStyle(color: Colors.white70)),
            ),
          );
        },
      ),
    );
  }
}
