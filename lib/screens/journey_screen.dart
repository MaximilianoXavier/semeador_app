
import 'package:flutter/material.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> journeyOptions = [
      {
        "icon": Icons.directions_walk_rounded,
        "label": "Etapas da Jornada",
        "route": "/journey/steps"
      },
      {
        "icon": Icons.favorite_border_rounded,
        "label": "Diário de Contentamento",
        "route": "/journey/contentamento"
      },
      {
        "icon": Icons.track_changes_rounded,
        "label": "Trilhas da Jornada",
        "route": "/journey/trilhas"
      },
      {
        "icon": Icons.history_rounded,
        "label": "Histórico da Jornada",
        "route": "/journey/historico"
      },
      {
        "icon": Icons.lock_rounded,
        "label": "Conteúdos Premium",
        "route": null
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cada dia é uma nova oportunidade para cultivar a terra do coração. '
                'A Jornada diária é o momento sagrado de plantar, cuidar e crescer por dentro.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '“Ensina-nos a contar os nossos dias” – Salmo 90,12',
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
                'Minha Jornada',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: journeyOptions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = journeyOptions[index];
                    final isLocked = item['route'] == null;
                    return GestureDetector(
                      onTap: isLocked
                          ? null
                          : () => Navigator.pushNamed(context, item['route']),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: isLocked
                              ? Colors.white10
                              : const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isLocked ? Colors.white24 : Colors.white12,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item['icon'],
                              color: isLocked ? Colors.white38 : Color(0xFFD2A679),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              item['label'],
                              style: TextStyle(
                                color: isLocked ? Colors.white38 : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
