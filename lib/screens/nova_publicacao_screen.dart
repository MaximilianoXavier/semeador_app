import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class NovaPublicacaoScreen extends StatefulWidget {
  const NovaPublicacaoScreen({super.key});

  @override
  State<NovaPublicacaoScreen> createState() => _NovaPublicacaoScreenState();
}

class _NovaPublicacaoScreenState extends State<NovaPublicacaoScreen> {
  final TextEditingController _controller = TextEditingController();
  String tipo = "reflexao";
  File? imagemSelecionada;
  final ImagePicker picker = ImagePicker();

  void _publicar() async {
    final texto = _controller.text.trim();
    if (texto.isEmpty && imagemSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Adicione texto ou imagem para publicar.")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList("posts") ?? [];
    final novoPost = {
      "autor": "Você",
      "tipo": tipo,
      "texto": texto,
      "moldura": "assets/frames/frame_leaf.png",
      "imagem": imagemSelecionada?.path ?? ""
    };

    raw.insert(0, jsonEncode(novoPost));
    await prefs.setStringList("posts", raw);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F1C),
      appBar: AppBar(
        title: const Text("Nova Publicação"),
        backgroundColor: const Color(0xFF0D1F1C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ChoiceChip(
                  label: const Text("✍️ Reflexão"),
                  selected: tipo == "reflexao",
                  onSelected: (val) => setState(() => tipo = "reflexao"),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text("🖼️ Imagem"),
                  selected: tipo == "imagem",
                  onSelected: (val) => setState(() => tipo = "imagem"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (tipo == "imagem") ...[
              ElevatedButton.icon(
                onPressed: () async {
                  final picked = await picker.pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    setState(() {
                      imagemSelecionada = File(picked.path);
                    });
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text("Selecionar imagem"),
              ),
              const SizedBox(height: 12),
              if (imagemSelecionada != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(imagemSelecionada!, height: 180),
                ),
              const SizedBox(height: 20),
            ],
            TextField(
              controller: _controller,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: tipo == "reflexao"
                    ? "Escreva sua reflexão..."
                    : "Descreva a imagem...",
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade800,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: _publicar,
              icon: const Icon(Icons.upload_rounded),
              label: const Text("Publicar", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}