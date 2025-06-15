
import 'package:flutter/material.dart';

class ComunidadeMensagensScreen extends StatelessWidget {
  const ComunidadeMensagensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grupos = ["Grupo Jornada 1", "Grupo Esperança", "Reflexões Diárias"];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("Grupos de Jornada", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: grupos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(grupos[index], style: const TextStyle(color: Colors.white)),
            leading: const Icon(Icons.group, color: Colors.amberAccent),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Abrindo o grupo: ${grupos[index]}'),
              ));
            },
          );
        },
      ),
    );
  }
}
