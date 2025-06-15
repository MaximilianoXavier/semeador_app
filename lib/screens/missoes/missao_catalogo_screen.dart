
import 'package:flutter/material.dart';
import 'missao_model.dart';
import 'missao_detalhe_screen.dart';

class MissaoCatalogoScreen extends StatelessWidget {
  const MissaoCatalogoScreen({super.key});

  List<Missao> getTodasMissoes() {
    return [
      Missao(
        titulo: 'Reze por alguém que você não gosta',
        descricao: 'Coloque essa pessoa diante de Deus com sinceridade.',
        referencia: 'Mateus 5,44',
      ),
      Missao(
        titulo: 'Escreva uma carta de gratidão',
        descricao: 'Entregue ou envie para alguém que marcou sua vida.',
        referencia: 'Filipenses 1,3',
      ),
      Missao(
        titulo: 'Silencie por 15 minutos',
        descricao: 'Fique em silêncio total e apenas respire.',
        referencia: 'Salmos 46,10',
      ),
      Missao(
        titulo: 'Leia um salmo em voz alta',
        descricao: 'Dê voz à Palavra e escute o que ela diz ao seu coração.',
        referencia: 'Salmos 1,2',
      ),
      Missao(
        titulo: 'Faça algo bom por alguém sem ser visto',
        descricao: 'A bondade anônima transforma o mundo em segredo.',
        referencia: 'Mateus 6,3-4',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final missoes = getTodasMissoes();

    return Scaffold(
      backgroundColor: const Color(0xFF0D1E1A),
      appBar: AppBar(
        title: const Text('Catálogo de Missões'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          itemCount: missoes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final missao = missoes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MissaoDetalheScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A26),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      missao.titulo,
                      style: const TextStyle(
                        color: Color(0xFFFFD54F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      missao.descricao,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '📖 ${missao.referencia}',
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
