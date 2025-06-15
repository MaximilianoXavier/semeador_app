
import 'package:flutter/material.dart';

class MissaoHomeScreen extends StatelessWidget {
  const MissaoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menus = [
      {
        "titulo": "Missão do Dia",
        "descricao": "Receba uma sugestão personalizada do que viver hoje.",
        "icone": Icons.bolt_rounded,
        "rota": "/missoes"
      },
      {
        "titulo": "Missões Espirituais",
        "descricao": "Silêncio, oração, perdão, fé e gratidão.",
        "icone": Icons.self_improvement_rounded,
        "rota": "/missoes/catalogo"
      },
      {
        "titulo": "Missões Sociais",
        "descricao": "Doe seu tempo, ajude um abrigo, sirva com o coração.",
        "icone": Icons.volunteer_activism_rounded,
        "rota": "/missoes/acao"
      },
      {
        "titulo": "Missões Evangelizadoras",
        "descricao": "Leve a Palavra aos jovens, enfermos e quem precisa ouvir.",
        "icone": Icons.campaign_rounded,
        "rota": "/missoes/evangelizar"
      },
      {
        "titulo": "Histórico de Missões",
        "descricao": "Veja as missões que você já concluiu.",
        "icone": Icons.history_rounded,
        "rota": "/missoes/historico"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D1E1A),
      appBar: AppBar(
        title: const Text('Missões do Semeador'),
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
              '“Servir ao Senhor com alegria é o verdadeiro sentido da missão. '
              'Quem se doa, floresce.”',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: menus.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = menus[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, item['rota']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2A26),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(item["icone"], color: Color(0xFFD2A679), size: 32),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["titulo"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item["descricao"],
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
