
import 'package:flutter/material.dart';

class ComunidadeProfilePreviewScreen extends StatelessWidget {
  final String nome;
  final String tipo;
  final String frase;
  final String imagem;

  const ComunidadeProfilePreviewScreen({
    super.key,
    required this.nome,
    required this.tipo,
    required this.frase,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Perfil", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(imagem),
            ),
            const SizedBox(height: 20),
            Text(nome, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(tipo, style: const TextStyle(color: Colors.amberAccent, fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              '"$frase"',
              style: const TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/perfil');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              ),
              child: const Text("Ver perfil completo", style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
