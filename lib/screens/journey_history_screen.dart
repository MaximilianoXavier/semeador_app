
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class JourneyHistoryScreen extends StatefulWidget {
  const JourneyHistoryScreen({super.key});

  @override
  State<JourneyHistoryScreen> createState() => _JourneyHistoryScreenState();
}

class _JourneyHistoryScreenState extends State<JourneyHistoryScreen> {
  late SharedPreferences _prefs;
  List<Map<String, String>> _historico = [];

  @override
  void initState() {
    super.initState();
    _loadHistorico();
  }

  Future<void> _loadHistorico() async {
    _prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> dados = [];

    DateTime hoje = DateTime.now();
    for (int i = 0; i < 30; i++) {
      DateTime data = hoje.subtract(Duration(days: i));
      String dataFormatada = DateFormat('yyyy-MM-dd').format(data);

      String? meta = _prefs.getString('meta_$dataFormatada');
      String? emocoes = _prefs.getString('emocao_$dataFormatada');
      String? reflexao = _prefs.getString('reflexao_$dataFormatada');
      String? gratidao = _prefs.getString('gratidao_$dataFormatada');
      String? espiritual = _prefs.getString('espiritual_$dataFormatada');

      if (meta != null || emocoes != null || reflexao != null || gratidao != null || espiritual != null) {
        dados.add({
          'data': dataFormatada,
          'meta': meta ?? '-',
          'emocoes': emocoes ?? '-',
          'reflexao': reflexao ?? '-',
          'gratidao': gratidao ?? '-',
          'espiritual': espiritual ?? '-',
        });
      }
    }

    setState(() {
      _historico = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico da Jornada')),
      body: _historico.isEmpty
          ? const Center(child: Text('Nenhum dia salvo ainda.'))
          : ListView.builder(
              itemCount: _historico.length,
              itemBuilder: (context, index) {
                final item = _historico[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 20, color: Colors.redAccent),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat('dd/MM/yyyy').format(DateTime.parse(item['data']!)),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildResumoLinha("🌱 Meta", item['meta']!),
                        _buildResumoLinha("😊 Emoção", item['emocoes']!),
                        _buildResumoLinha("💭 Reflexão", item['reflexao']!),
                        _buildResumoLinha("🕊️ Gratidão", item['gratidao']!),
                        _buildResumoLinha("✨ Espiritual", item['espiritual']!),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildResumoLinha(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "$titulo: $valor",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
