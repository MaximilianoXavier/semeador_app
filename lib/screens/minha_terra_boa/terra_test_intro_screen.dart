
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TerraTestIntroScreen extends StatelessWidget {
  final bool jaFezTeste;

  const TerraTestIntroScreen({super.key, this.jaFezTeste = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF8F1),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
        title: Text(
          "Descubra sua Terra Boa",
          style: GoogleFonts.merriweather(
            color: Colors.brown[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.spa, size: 48, color: Colors.brown),
            const SizedBox(height: 24),
            Text(
              "Este teste foi criado para te ajudar a reconhecer qual tipo de 'Terra Boa' há dentro de você.",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(fontSize: 16, color: Colors.brown[700]),
            ),
            const SizedBox(height: 16),
            Text(
              "Ele é baseado em símbolos espirituais e te levará a refletir sobre seus valores, percepções e sementes interiores.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.brown[600]),
            ),
            const SizedBox(height: 24),
            Text(
              "Responda com sinceridade. Aqui não há certo ou errado — apenas o terreno da sua alma.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.brown[400]),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/personalidade/teste');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[700],
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Começar o Teste", style: TextStyle(color: Colors.white)),
            ),
            if (jaFezTeste) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/personalidade/resultado');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.brown),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Ver Resultado",
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/personalidade/teste');
                },
                child: const Text(
                  "🔄 Já fez? Refazer o teste",
                  style: TextStyle(color: Colors.brown, fontSize: 13, decoration: TextDecoration.underline),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
