
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class JourneyMetaScreen extends StatefulWidget {
  const JourneyMetaScreen({super.key});

  @override
  State<JourneyMetaScreen> createState() => _ScreenState();
}

class _ScreenState extends State<JourneyMetaScreen> {
  final TextEditingController _controller = TextEditingController();
  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('meta_' + today, _controller.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Salvo com sucesso!')),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) Navigator.pushReplacementNamed(context, '/journey/steps');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text('Meta do Dia'),
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Defina sua meta para hoje',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                border: OutlineInputBorder(),
                hintText: 'Ex: Meditar por 10 minutos',
                hintStyle: TextStyle(color: Colors.white38),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
              ),
              style: TextStyle(color: Colors.white),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            const Text(
              "Registrar sua meta é como plantar uma semente de intenção. Ela cresce com cada atitude ao longo do dia. 🌱",
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF9800),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Salvar e Voltar'),
            )
          ],
        ),
      ),
    );
  }
}
