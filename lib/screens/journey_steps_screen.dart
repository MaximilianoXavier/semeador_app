
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class JourneyStepsScreen extends StatefulWidget {
  const JourneyStepsScreen({super.key});

  @override
  State<JourneyStepsScreen> createState() => _JourneyStepsScreenState();
}

class _JourneyStepsScreenState extends State<JourneyStepsScreen> {
  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final Map<String, String> etapas = {
    'meta': 'Meta do Dia',
    'emocao': 'Emoção do Dia',
    'gratidao': 'Gratidão do Dia',
    'espiritual': 'Momento Espiritual',
    'reflexao': 'Reflexão do Dia',
  };

  final Map<String, String> rotas = {
    'meta': '/journey/meta',
    'emocao': '/journey/emocoes',
    'reflexao': '/journey/reflexao',
    'gratidao': '/journey/gratidao',
    'espiritual': '/journey/espiritual',
  };

  Map<String, bool> status = {};

  @override
  void initState() {
    super.initState();
    _carregarStatus();
  }

  Future<void> _carregarStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, bool> tempStatus = {};

    for (final etapa in etapas.keys) {
      final valor = prefs.getString('${etapa}_$today');
      tempStatus[etapa] = valor != null && valor.trim().isNotEmpty;
    }

    setState(() {
      status = tempStatus;
    });
  }

  bool get todasCompletas => status.values.every((v) => v);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        title: const Text(
          'Etapas da Jornada',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF0D0D0D),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _saudacao(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Hoje é um ótimo dia para plantar palavras de esperança. 🌱",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: etapas.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final chave = etapas.keys.elementAt(index);
                  final concluida = status[chave] ?? false;

                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: concluida ? const Color(0xFF4CAF50) : const Color(0xFF1A1A1A),
                    title: Text(
                      etapas[chave]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: concluida ? Colors.white : Colors.white,
                      ),
                    ),
                    trailing: concluida
                        ? const Icon(Icons.check_circle_rounded, color: Colors.white)
                        : const Icon(Icons.radio_button_unchecked, color: Colors.white38),
                    onTap: () {
                      Navigator.pushNamed(context, rotas[chave]!).then((_) {
                        _carregarStatus();
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SafeArea(
              minimum: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.lightbulb_outline),
                    label: const Text("Inspiração do dia"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: todasCompletas ? const Color(0xFFFF9800) : Colors.grey[800],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    onPressed: todasCompletas
                        ? () => Navigator.pushNamed(context, '/resumo')
                        : null,
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/comunidade/feed');
                    },
                    child: const Text(
                      'Ir para Comunidade Cristã',
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _saudacao() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Bom dia!";
    if (hour < 18) return "Boa tarde!";
    return "Boa noite!";
  }
}
