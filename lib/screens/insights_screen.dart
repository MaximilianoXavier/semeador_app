import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class InsightsScreen extends StatefulWidget {
  @override
  _InsightsScreenState createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final TextEditingController _insightController = TextEditingController();
  String _registroSalvo = '';

  @override
  void initState() {
    super.initState();
    _carregarInsight();
  }

  void _carregarInsight() async {
    final prefs = await SharedPreferences.getInstance();
    final dataHoje = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final insight = prefs.getString('insight_$dataHoje');

    if (insight != null) {
      setState(() {
        _registroSalvo = insight;
      });
    }
  }

  void _salvarInsight() async {
    final texto = _insightController.text.trim();
    if (texto.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final dataHoje = DateFormat('yyyy-MM-dd').format(DateTime.now());

    await prefs.setString('insight_$dataHoje', texto);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Insight salvo com sucesso!')),
    );

    setState(() {
      _registroSalvo = texto;
      _insightController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Insights e Aprendizados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Que aprendizado ou insight você teve hoje?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _insightController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: Percebi que o silêncio me ajuda a clarear a mente...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarInsight,
              child: const Text('Salvar Insight'),
            ),
            const SizedBox(height: 30),
            if (_registroSalvo.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📘 Insight de hoje:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _registroSalvo,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
