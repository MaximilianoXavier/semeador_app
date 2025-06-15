
import 'package:flutter/material.dart';
import 'inspiration_quote_screen.dart';
import 'inspiration_bible_screen.dart';
import 'inspiration_meditation_screen.dart';
import 'inspiration_share_screen.dart';

class InspiracaoScreen extends StatelessWidget {
  const InspiracaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Receba Luz, Max ✨',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '“Lâmpada para os meus pés é a tua palavra” – Sl 119,105',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Inspiração Diária',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(context, 'Frase do Dia', Icons.format_quote_rounded, InspirationQuoteScreen()),
                    _buildCard(context, 'Leitura Bíblica', Icons.menu_book_rounded, InspirationBibleScreen()),
                    _buildCard(context, 'Meditação Guiada', Icons.headset_rounded, InspirationMeditationScreen()),
                    _buildCard(context, 'Compartilhar Inspiração', Icons.share_rounded, InspirationShareScreen()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFD2A679)),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
