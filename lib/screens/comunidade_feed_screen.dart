import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'comunidade_comments_screen.dart';
import 'comunidade_data.dart';
import 'comunidade_post_screen.dart';

class ComunidadeFeedScreen extends StatefulWidget {
  const ComunidadeFeedScreen({super.key});

  @override
  State<ComunidadeFeedScreen> createState() => _ComunidadeFeedScreenState();
}

class _ComunidadeFeedScreenState extends State<ComunidadeFeedScreen> {
  String? avatarUsuario;
  List<Map<String, dynamic>> posts = [];
  Set<String> curtidas = {};
  Set<String> expandido = {};

  Future<ui.Image> _getImageDimensions(File file) async {
    final completer = Completer<ui.Image>();
    final image = FileImage(file);
    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
      }),
    );
    return completer.future;
  }

  Widget _imagemAdaptada(String path) {
    final file = File(path);
    return FutureBuilder<ui.Image>(
      future: _getImageDimensions(file),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          final img = snapshot.data!;
          final vertical = img.height > img.width;
          return Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: vertical
                  ? Image.file(file, fit: BoxFit.fitHeight)
                  : AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.file(file, fit: BoxFit.cover),
              ),
            ),
          );
        } else {
          return const SizedBox(height: 180);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    carregarPosts();
    carregarCurtidas();
    carregarAvatar();
  }

  Future<void> carregarPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList("posts") ?? [];
    setState(() {
      posts = raw.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    });
  }

  Future<void> carregarCurtidas() async {
    final prefs = await SharedPreferences.getInstance();
    final salvas = prefs.getStringList("curtidas") ?? [];
    setState(() {
      curtidas = salvas.toSet();
    });
  }

  Future<void> carregarAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      avatarUsuario = prefs.getString('avatar');
    });
  }

  Future<void> alternarCurtir(String id) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (curtidas.contains(id)) {
        curtidas.remove(id);
      } else {
        curtidas.add(id);
      }
      prefs.setStringList("curtidas", curtidas.toList());
    });
  }

  String tipoEmoji(String tipo) {
    switch (tipo) {
      case 'reflexao':
        return '✍️';
      case 'imagem':
        return '🖼️';
      case 'jornada':
        return '🌱';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/comunidade/meu-perfil'),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/icons/avatar_usuario_topo.png'),
              ),
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Semeador", style: GoogleFonts.pacifico(fontSize: 26, color: Colors.white)),
            Text("Comunidade Cristã", style: GoogleFonts.merriweather(fontSize: 14, color: Colors.white70)),
          ],
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'assets/images/fundo_jesus_semeador.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          posts.isEmpty
              ? const Center(
            child: Text("Nenhuma publicação ainda.", style: TextStyle(color: Colors.white70)),
          )
              : ListView.builder(
            itemCount: posts.length,
            padding: const EdgeInsets.only(bottom: 100, top: 16),
            itemBuilder: (context, index) {
              final post = posts[index];
              final id = post['id'] ?? index.toString();
              final texto = post['texto'] ?? '';
              final imagem = post['imagem'];
              final mostrarTudo = expandido.contains(id);
              final limite = (imagem == null || imagem.toString().isEmpty) ? 900 : 120;
              final precisaExpandir = texto.length > limite;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 40, 32, 40),
                    decoration: BoxDecoration(
                      color: const Color(0xCC1E2D2A),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Você • ${tipoEmoji(post['tipo'] ?? '')}",
                            style: const TextStyle(
                                color: Colors.tealAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        if ((imagem ?? '').toString().isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _imagemAdaptada(imagem),
                          ),
                        if (texto.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedCrossFade(
                                firstChild: Text(
                                  texto,
                                  maxLines: (imagem == null || imagem.toString().isEmpty)
                                      ? 25
                                      : 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                secondChild: Text(
                                  texto,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                crossFadeState: mostrarTudo
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 200),
                              ),
                              if (precisaExpandir)
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (expandido.contains(id)) {
                                        expandido.remove(id);
                                      } else {
                                        expandido.add(id);
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      mostrarTudo ? "Ver menos" : "Ver mais",
                                      style: const TextStyle(
                                          color: Colors.tealAccent, fontSize: 13),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert, color: Colors.white60),
                            onSelected: (value) {
                              if (value == 'editar') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ComunidadePostScreen(
                                      textoOriginal: post['texto'],
                                      tipoOriginal: post['tipo'],
                                      indiceEdicao: index,
                                    ),
                                  ),
                                ).then((value) => carregarPosts());
                              } else if (value == 'excluir') {
                                setState(() {
                                  posts.removeAt(index);
                                  SharedPreferences.getInstance().then((prefs) {
                                    prefs.setStringList("posts",
                                        posts.map((e) => jsonEncode(e)).toList());
                                  });
                                });
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(
                                value: 'editar',
                                child: Text('Editar'),
                              ),
                              PopupMenuItem(
                                value: 'excluir',
                                child: Text('Excluir'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(post['data'] ?? '',
                                style: const TextStyle(
                                    color: Colors.white30, fontSize: 12)),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                curtidas.contains(id)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: curtidas.contains(id)
                                    ? Colors.redAccent
                                    : Colors.white54,
                                size: 20,
                              ),
                              onPressed: () => alternarCurtir(id),
                            ),
                            IconButton(
                              icon: const Icon(Icons.chat_bubble_outline,
                                  color: Colors.white70, size: 20),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ComunidadeCommentsScreen(
                                      post: ComunidadePost(
                                        nome: post['nome'] ?? 'Você',
                                        tipo: post['tipo'] ?? 'reflexao',
                                        texto: post['texto'] ?? '',
                                        data: post['data'] ?? 'hoje',
                                        curtido: post['curtido'] ?? false,
                                        comentarios: List<String>.from(
                                            post['comentarios'] ?? []),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Compartilhado!")),
                                );
                              },
                              child: const Icon(Icons.share,
                                  color: Colors.greenAccent, size: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 24,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: avatarUsuario != null
                          ? FileImage(File(avatarUsuario!))
                          : const AssetImage('assets/icons/avatar_usuario_card.png')
                      as ImageProvider,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Navigator.pushNamed(context, '/comunidade/nova-reflexao').then((value) {
              if (value == true) carregarPosts();
            });
          },
          child: Image.asset("assets/icons/semente_plus_marrom.png", width: 76),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/perfil'),
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/menu'),
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                color: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/comunidade/chat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
