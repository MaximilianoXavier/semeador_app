
import 'package:flutter/material.dart';

class ComunidadeScreen extends StatelessWidget {
  const ComunidadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Participe, Max 🤝',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '"Onde dois ou três estiverem reunidos em meu nome..." – Mt 18,20',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Comunidade',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildMenuItem(
                context,
                icon: Icons.forum,
                label: 'Publicações da Comunidade',
                routeName: '/comunidade/feed',
              ),
              _buildMenuItem(
                context,
                icon: Icons.group,
                label: 'Grupos de Jornada',
                routeName: '/comunidade/mensagens',
              ),
              _buildMenuItem(
                context,
                icon: Icons.emoji_events,
                label: 'Conquistas Compartilhadas',
                routeName: '/comunidade/desafios',
              ),
              _buildMenuItem(
                context,
                icon: Icons.lightbulb,
                label: 'Inspire outros',
                routeName: '/comunidade/nova-postagem',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String label,
      required String routeName}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[700]!),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.amberAccent),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
