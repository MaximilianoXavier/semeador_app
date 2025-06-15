
import 'package:flutter/material.dart';

class JourneyTrilhasScreen extends StatelessWidget {
  const JourneyTrilhasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> trilhas = [
      {
        "titulo": "Trilha da Gratidão",
        "descricao": "Desenvolva o hábito de agradecer mesmo nos dias difíceis.",
        "icone": Icons.volunteer_activism_rounded,
      },
      {
        "titulo": "Trilha do Perdão",
        "descricao": "Libere o perdão para se libertar interiormente.",
        "icone": Icons.healing_rounded,
      },
      {
        "titulo": "Trilha da Confiança",
        "descricao": "Fortaleça sua fé em Deus e no caminho que está trilhando.",
        "icone": Icons.shield_moon_rounded,
      },
      {
        "titulo": "Trilha do Silêncio",
        "descricao": "Aprenda a escutar sua alma e acolher o silêncio interior.",
        "icone": Icons.self_improvement_rounded,
      },
      {
        "titulo": "Trilha da Humildade",
        "descricao": "Caminhe com simplicidade e reconheça sua verdadeira essência.",
        "icone": Icons.emoji_people_rounded,
      },
      {
        "titulo": "Trilha da Esperança",
        "descricao": "Redescubra a luz mesmo em meio às sombras.",
        "icone": Icons.wb_twilight_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Trilhas da Jornada',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          itemCount: trilhas.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final trilha = trilhas[index];
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(trilha["icone"], color: Color(0xFFD2A679), size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trilha["titulo"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          trilha["descricao"],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      size: 16, color: Colors.white24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
