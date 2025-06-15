
import 'package:flutter/material.dart';
import 'comunidade_data.dart';

class ComunidadeCommentsScreen extends StatefulWidget {
  final ComunidadePost post;
  const ComunidadeCommentsScreen({super.key, required this.post});

  @override
  State<ComunidadeCommentsScreen> createState() => _ComunidadeCommentsScreenState();
}

class _ComunidadeCommentsScreenState extends State<ComunidadeCommentsScreen> {
  final TextEditingController _controller = TextEditingController();

  void _adicionarComentario(String texto) {
    if (texto.trim().isEmpty) return;
    setState(() {
      widget.post.comentarios.add(texto.trim());
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Comentários", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: widget.post.comentarios.length,
                itemBuilder: (context, index) {
                  final comentario = widget.post.comentarios[index];
                  return Card(
                    color: const Color(0xFF1A1A1A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(comentario, style: const TextStyle(color: Colors.white)),
                      leading: const Icon(Icons.person, color: Colors.amberAccent),
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Colors.white12),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintText: "Escreva um comentário...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _adicionarComentario(_controller.text),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.send, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
