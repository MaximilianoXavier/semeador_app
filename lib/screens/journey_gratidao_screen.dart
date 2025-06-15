
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class JourneyGratidaoScreen extends StatefulWidget {
  const JourneyGratidaoScreen({super.key});

  @override
  State<JourneyGratidaoScreen> createState() => _JourneyGratidaoScreenState();
}

class _JourneyGratidaoScreenState extends State<JourneyGratidaoScreen> {
  final TextEditingController _controller = TextEditingController();
  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  Future<void> _loadSavedText() async {
    final prefs = await SharedPreferences.getInstance();
    final savedText = prefs.getString('gratidao_$today') ?? '';
    setState(() {
      _controller.text = savedText;
    });
  }

  Future<void> _saveTextAndGoBack() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('gratidao_$today', _controller.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Gratidão registrada com sucesso!')),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) Navigator.pushReplacementNamed(context, '/journey/steps');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Gratidão do Dia'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Cultivar gratidão transforma o ordinário em extraordinário. 🌟",
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'O que você agradece hoje?',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveTextAndGoBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF9800),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                ),
                child: const Text(
                  'Salvar e Voltar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
