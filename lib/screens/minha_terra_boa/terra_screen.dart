import 'package:flutter/material.dart';

class MinhaTerraBoaScreen extends StatelessWidget {
  const MinhaTerraBoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7E7),
      appBar: AppBar(
        title: const Text('Minha Terra Boa'),
        backgroundColor: const Color(0xFF8D6E63),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Frase Inspiradora
            const Text(
              '“Você é uma terra viva. Tudo o que você cultiva dentro de si floresce no mundo.”',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: Color(0xFF5D4037),
              ),
            ),
            const SizedBox(height: 24),

            // Botão "Descubra sua Terra Boa"
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/terra/teste');
              },
              icon: const Icon(Icons.search),
              label: const Text("Descubra sua Terra Boa"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6D4C41),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 36),

            // Avatar + Tipo
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xFFD7CCC8),
                  backgroundImage: const AssetImage('assets/icons/terra_boa_icon.png'),
                ),
                const SizedBox(height: 16),
                const Text(
                  "🌱 Sua Personalidade:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF5D4037),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Semeador(a) Conectado 🌿",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4E342E),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Tipo: Explorador da Verdade 🔍",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6D4C41),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "“A sabedoria é a luz que revela o invisível.”",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Color(0xFF8D6E63),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 36),

            // Botão Progresso
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/terra/progresso');
              },
              child: const Text("Progresso"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6D4C41),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Reflexo da Semana
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFCCAB91)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "📖 Reflexo da Semana:",
                    style: TextStyle(
                      color: Color(0xFF5D4037),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Você cresceu em discernimento e clareza interior.",
                    style: TextStyle(color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
