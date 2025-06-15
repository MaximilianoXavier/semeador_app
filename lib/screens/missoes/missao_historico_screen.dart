
import 'package:flutter/material.dart';
import 'missao_model.dart';
import 'missao_data.dart';

class MissaoHistoricoScreen extends StatelessWidget {
  const MissaoHistoricoScreen({super.key});

  // Simulação de histórico local (em produção seria persistido com SharedPreferences ou backend)
  List<Missao> getHistorico() {
    return [
      Missao(
        titulo: 'Acolha alguém hoje',
        descricao: 'Pratique a escuta ativa com alguém que precisa ser ouvido.',
        referencia: 'Romanos 15,7',
      ),
      Missao(
        titulo: 'Agradeça em oração',
        descricao: 'Faça uma oração de gratidão antes de dormir.',
        referencia: '1 Tessalonicenses 5,18',
      ),
      Missao(
        titulo: 'Silencie por 15 minutos',
        descricao: 'Fique em silêncio total e apenas respire.',
        referencia: 'Salmos 46,10',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final historico = getHistorico();

    return Scaffold(
      backgroundColor: const Color(0xFF0D1E1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Histórico de Missões'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: historico.isEmpty
            ? const Center(
                child: Text(
                  'Nenhuma missão concluída ainda.',
                  style: TextStyle(color: Colors.white70),
                ),
              )
            : ListView.separated(
                itemCount: historico.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final missao = historico[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A2A26),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          missao.titulo,
                          style: const TextStyle(
                            color: Color(0xFFFFD54F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                  );
                },
              ),
      ),
    );
  }
}
