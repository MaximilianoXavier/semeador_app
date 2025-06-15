import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ComunidadePost {
  final String nome;
  final String tipo;
  final String texto;
  final String data;
  bool curtido;
  String? imagem;
  List<String> comentarios;

  ComunidadePost({
    required this.nome,
    required this.tipo,
    required this.texto,
    required this.data,
    this.curtido = false,
    this.imagem,
    List<String>? comentarios,
  }) : comentarios = comentarios ?? [];

  Map<String, dynamic> toMap() => {
    'nome': nome,
    'tipo': tipo,
    'texto': texto,
    'data': data,
    'imagem': imagem,
    'curtido': curtido,
    'comentarios': comentarios,
  };

  static ComunidadePost fromMap(Map<String, dynamic> map) => ComunidadePost(
    nome: map['nome'],
    tipo: map['tipo'],
    texto: map['texto'],
    imagem: map['imagem'],
    data: map['data'],
    curtido: map['curtido'] ?? false,
    comentarios: List<String>.from(map['comentarios'] ?? []),
  );
}

class ComunidadeData {
  static final ComunidadeData _instance = ComunidadeData._internal();
  factory ComunidadeData() => _instance;

  final List<ComunidadePost> posts = [];

  ComunidadeData._internal();

  Future<void> carregarPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('posts'); // <-- corrigido aqui
    posts.clear();

    if (data != null) {
      final List decoded = jsonDecode(data);
      posts.addAll(decoded.map((e) => ComunidadePost.fromMap(e)));
    }

    // Se estiver vazio após carregar, adicionar posts fictícios
    if (posts.isEmpty) {
      posts.addAll([
        ComunidadePost(
            nome: "Maria Luz",
            tipo: "Reflexão",
            texto: "Mesmo quando tudo parece escuro, a luz de Deus se manifesta. 🌟",
            data: "31 mai",
            comentarios: ["Amém!", "Lindo texto", "Muito verdadeiro"]
        ),
        ComunidadePost(
            nome: "Lucas Andrade",
            tipo: "Imagem",
            texto: "Um momento de paz na natureza.",
            data: "30 mai",
            imagem: "/storage/emulated/0/Download/paisagem1.jpg",
            comentarios: ["Que lugar abençoado!", "Quero ir aí!"]
        ),
        ComunidadePost(
            nome: "Padre João",
            tipo: "Reflexão",
            texto: "A oração é a chave do coração de Deus. Reserve um tempo hoje.",
            data: "29 mai",
            comentarios: ["Obrigado pelas palavras.", "Reflexão necessária."]
        ),
        ComunidadePost(
          nome: "Eliane Ribeiro",
          tipo: "Imagem",
          texto: "Pôr do sol abençoado.",
          data: "28 mai",
          imagem: "/storage/emulated/0/Download/por_do_sol.jpg",
        ),
        ComunidadePost(
          nome: "Tiago Farias",
          tipo: "Jornada",
          texto: "Concluí minha trilha da semana com muita gratidão! 🙏",
          data: "27 mai",
        ),
        ComunidadePost(
            nome: "Irmã Clara",
            tipo: "Oração",
            texto: "Peço orações por minha comunidade. Que Deus nos ilumine sempre.",
            data: "27 mai",
            comentarios: ["Em oração, irmã!", "Estamos com vocês."]
        ),
        ComunidadePost(
          nome: "Andressa Melo",
          tipo: "Imagem",
          texto: "Flores simples, mas com beleza divina.",
          data: "26 mai",
          imagem: "/storage/emulated/0/Download/flores.jpg",
        ),
        ComunidadePost(
          nome: "Marcos Aurélio",
          tipo: "Imagem",
          texto: "Caminho de terra, mas com fé nos passos.",
          data: "26 mai",
          imagem: "/storage/emulated/0/Download/caminho.jpg",
        ),
        ComunidadePost(
          nome: "Viviane Duarte",
          tipo: "Jornada",
          texto: "Minha jornada hoje foi de reconciliação interior. Deus é bom!",
          data: "25 mai",
        ),
        ComunidadePost(
          nome: "Samuel Oliveira",
          tipo: "Reflexão",
          texto: "Deus não falha. Ele apenas age no tempo certo. Confie!",
          data: "25 mai",
        ),
        ComunidadePost(
          nome: "Juliana Rocha",
          tipo: "Meta",
          texto: "Minha meta do dia: ouvir mais e julgar menos. ❤️",
          data: "24 mai",
        ),
        ComunidadePost(
          nome: "Frei Miguel",
          tipo: "Reflexão",
          texto: "Perdoar é libertar a alma. Reflita sobre quem você pode perdoar hoje.",
          data: "24 mai",
        ),
        ComunidadePost(
            nome: "Renata Bezerra",
            tipo: "Imagem",
            texto: "Céu azul, alma leve.",
            data: "23 mai",
            imagem: "/storage/emulated/0/Download/ceu.jpg"
        ),
        ComunidadePost(
          nome: "Eduardo Lima",
          tipo: "Jornada",
          texto: "Completei os 5 dias seguidos de jornada no Semeador! Glória a Deus!",
          data: "22 mai",
        ),
        ComunidadePost(
          nome: "Tânia Carvalho",
          tipo: "Reflexão",
          texto: "Às vezes, o silêncio também é oração. ✨",
          data: "22 mai",
        )
      ]);
      await salvarPosts();
    }
  }

  Future<void> salvarPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(posts.map((e) => e.toMap()).toList());
    await prefs.setString('posts', encoded); // <-- corrigido aqui
  }

  Future<void> adicionarPost(ComunidadePost post) async {
    posts.add(post);
    await salvarPosts();
  }

  Future<void> atualizarPostNaPosicao(int index, ComunidadePost novoPost) async {
    if (index >= 0 && index < posts.length) {
      posts[index] = novoPost;
      await salvarPosts();
    }
  }
}
