
import 'package:flutter/material.dart';

class MissaoEvangelizarScreen extends StatelessWidget {
  const MissaoEvangelizarScreen({super.key});

  List<Map<String, dynamic>> getMissoesEvangelizadoras() {
    return [
      {
        'titulo': 'Compartilhe um versículo',
        'descricao': 'Envie uma mensagem bíblica para um amigo ou grupo.',
        'icone': Icons.sms_rounded
      },
      {
        'titulo': 'Grave um vídeo com uma palavra de fé',
        'descricao': 'Poste nas redes sociais algo que inspire os corações.',
        'icone': Icons.videocam_rounded
      },
      {
        'titulo': 'Organize um momento de oração',
        'descricao': 'Reúna pessoas para rezar por uma causa ou intenção.',
        'icone': Icons.group_rounded
      },
      {
        'titulo': 'Convide alguém para a igreja',
        'descricao': 'Estenda um convite a quem está afastado da fé.',
        'icone': Icons.handshake_rounded
      },
      {
        'titulo': 'Testemunhe sua fé com simplicidade',
        'descricao': 'Conte como Deus tem agido na sua vida — com verdade.',
        'icone': Icons.campaign_rounded
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final missoes = getMissoesEvangelizadoras();

    return Scaffold(
      backgroundColor: const Color(0xFF0D1E1A),
      appBar: AppBar(
        title: const Text('Missões Evangelizadoras'),
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
              '“Ide por todo o mundo e pregai o evangelho a toda criatura.” — Mc 16,15',
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
          ],
        ),
      ),
    );
  }
}
