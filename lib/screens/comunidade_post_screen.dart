import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'comunidade_data.dart';

class ComunidadePostScreen extends StatefulWidget {
  final String? textoOriginal;
  final String? tipoOriginal;
  final int? indiceEdicao;

  const ComunidadePostScreen({
    super.key,
    this.textoOriginal,
    this.tipoOriginal,
    this.indiceEdicao,
  });

  @override
  State<ComunidadePostScreen> createState() => _ComunidadePostScreenState();
}

class _ComunidadePostScreenState extends State<ComunidadePostScreen> {
  late TextEditingController _controller;
  String tipoSelecionado = 'Reflexão';
  final List<String> tipos = ['Reflexão', 'Meta', 'Oração'];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.textoOriginal ?? '');
    if (widget.tipoOriginal != null) {
      tipoSelecionado = mapearTipo(widget.tipoOriginal!);
    }
  }

  String mapearTipo(String tipo) {
    final normalizado = tipo.toLowerCase();
    if (normalizado.contains('reflex')) return 'Reflexão';
    if (normalizado.contains('meta')) return 'Meta';
    if (normalizado.contains('orac')) return 'Oração';
    return 'Reflexão';
  }

  void _publicarPost() async {
    if (_controller.text.trim().isEmpty) return;

    final novoPost = ComunidadePost(
      nome: "Você",
      tipo: tipoSelecionado,
      texto: _controller.text.trim(),
      data: DateFormat('dd MMM').format(DateTime.now()),
    );

    if (widget.indiceEdicao != null) {
      await ComunidadeData().atualizarPostNaPosicao(widget.indiceEdicao!, novoPost);
    } else {
      await ComunidadeData().adicionarPost(novoPost);
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(widget.indiceEdicao != null
            ? "Post atualizado com sucesso!"
            : "Post publicado na Comunidade!"),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(
          widget.indiceEdicao != null ? "Editar Publicação" : "Nova Publicação",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: tipoSelecionado,
              dropdownColor: const Color(0xFF1A1A1A),
              style: const TextStyle(color: Colors.white),
              items: tipos.map((tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  tipoSelecionado = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Digite sua mensagem...",
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
                filled: true,
                fillColor: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _publicarPost,
              icon: const Icon(Icons.send, color: Colors.white),
              label: Text(
                widget.indiceEdicao != null ? "Salvar" : "Publicar",
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
