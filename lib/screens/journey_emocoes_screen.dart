
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class JourneyEmocoesScreen extends StatefulWidget {
  const JourneyEmocoesScreen({super.key});

  @override
  State<JourneyEmocoesScreen> createState() => _JourneyEmocoesScreenState();
}

class _JourneyEmocoesScreenState extends State<JourneyEmocoesScreen> {
  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final List<Map<String, String>> _emocoes = [
    {'emoji': '😀', 'label': 'Feliz'},
    {'emoji': '😊', 'label': 'Agradecido'},
    {'emoji': '😐', 'label': 'Neutro'},
    {'emoji': '😔', 'label': 'Triste'},
    {'emoji': '😢', 'label': 'Chateado'},
    {'emoji': '😠', 'label': 'Irritado'},
  ];

  String? _emojiSelecionado;
  final TextEditingController _controller = TextEditingController();

  Future<void> _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('emocao_$today', '${_emojiSelecionado ?? ""} ${_controller.text}');
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Emoção salva com sucesso!')),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) Navigator.pushReplacementNamed(context, '/journey/steps');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text('Emoção do Dia'),
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Como você está se sentindo hoje?',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: _emocoes.map((data) {
                final bool selecionado = data['emoji'] == _emojiSelecionado;
                return GestureDetector(
                  onTap: () => setState(() => _emojiSelecionado = data['emoji']),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: selecionado ? const Color(0xFFFFF3E0) : const Color(0xFF1E1E1E),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selecionado ? const Color(0xFFFF9800) : Colors.white24,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          data['emoji']!,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data['label']!,
                        style: const TextStyle(fontSize: 12, color: Colors.white70),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              "Reconhecer sua emoção é o primeiro passo para cultivar equilíbrio interior. 🌿",
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                hintText: 'Ex: Me sinto calmo e confiante',
                hintStyle: TextStyle(color: Colors.white38),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9800),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Salvar e Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
