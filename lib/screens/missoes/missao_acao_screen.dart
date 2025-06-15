
import 'package:flutter/material.dart';

class MissaoAcaoScreen extends StatelessWidget {
  const MissaoAcaoScreen({super.key});

  List<Map<String, dynamic>> getMissoesSociais() {
    return [
      {
        'titulo': 'Monte uma cesta básica',
        'descricao': 'Arrecade alimentos e entregue a uma família em necessidade.',
        'icone': Icons.shopping_basket_rounded
      },
      {
        'titulo': 'Doe roupas ou calçados',
        'descricao': 'Selecione itens em bom estado e leve a um abrigo ou instituição.',
        'icone': Icons.checkroom_rounded
      },
      {
        'titulo': 'Visite um hospital',
        'descricao': 'Leve palavras de conforto e presença aos doentes.',
        'icone': Icons.local_hospital_rounded
      },
      {
        'titulo': 'Ajude alguém em silêncio',
        'descricao': 'Ofereça ajuda sem se anunciar. Deus vê o que é feito no oculto.',
        'icone': Icons.volunteer_activism_rounded
      },
      {
        'titulo': 'Reúna um grupo para servir',
        'descricao': 'Convide amigos ou comunidade para fazer uma ação conjunta.',
        'icone': Icons.groups_2_rounded
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final missoes = getMissoesSociais();

    return Scaffold(
      backgroundColor: const Color(0xFF0D1E1A),
      appBar: AppBar(
        title: const Text('Missões Sociais'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '“A fé sem obras é morta. Mas a missão em ação é vida que transborda.”',
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: missoes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = missoes[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A2A26),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(item['icone'], color: Color(0xFFD2A679), size: 32),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['titulo'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['descricao'],
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // ação futura: criar missão personalizada
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text('Criar minha própria missão'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
