
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../screens/comunidade_data.dart';

class JourneyReflexaoScreen extends StatefulWidget {
  const JourneyReflexaoScreen({super.key});

  @override
  State<JourneyReflexaoScreen> createState() => _JourneyReflexaoScreenState();
}

class _JourneyReflexaoScreenState extends State<JourneyReflexaoScreen> {
  final TextEditingController _controller = TextEditingController();
  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('reflexao_' + today, _controller.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Salvo com sucesso!')),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) Navigator.pushReplacementNamed(context, '/journey/steps');
  }

  void _compartilharNaComunidade() {
    if (_controller.text.trim().isEmpty) return;
    ComunidadeData().adicionarPost(ComunidadePost(
      nome: "Você",
      tipo: "Reflexão",
      texto: _controller.text.trim(),
      data: DateFormat('dd MMM').format(DateTime.now()),
    ));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Reflexão publicada na Comunidade!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Reflexão do Dia'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '“Uma reflexão sincera é um espelho para a alma.” 💭',
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                hintText: 'Ex: Aprendi a ter mais paciência',
                hintStyle: const TextStyle(color: Colors.white38),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 6,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _compartilharNaComunidade,
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text("Compartilhar na Comunidade", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9800),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Salvar e Voltar', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
