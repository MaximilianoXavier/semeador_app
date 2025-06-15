
import 'package:flutter/material.dart';

class ComunidadeMuralOracao extends StatelessWidget {
  const ComunidadeMuralOracao({super.key});

  @override
  Widget build(BuildContext context) {
    final intencoes = [
      {"nome": "Carlos André", "pedido": "Pela recuperação da minha esposa."},
      {"nome": "Milena Souza", "pedido": "Por sabedoria nas decisões do trabalho."},
      {"nome": "Heitor S.", "pedido": "Para que minha família tenha mais união."},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("Mural de Oração", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: intencoes.length,
        itemBuilder: (context, index) {
          final item = intencoes[index];
          return Card(
            color: const Color(0xFF1A1A1A),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(item["nome"]!, style: const TextStyle(color: Colors.white)),
              subtitle: Text(item["pedido"]!, style: const TextStyle(color: Colors.white70)),
              trailing: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Você orou por ${item["nome"]}! 🙏'),
                  ));
                },
                child: const Text("Rezar", style: TextStyle(color: Colors.amberAccent)),
              ),
            ),
          );
        },
      ),
    );
  }
}
