
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ResumoScreen extends StatefulWidget {
  const ResumoScreen({super.key});

  @override
  State<ResumoScreen> createState() => _ResumoScreenState();
}

class _ResumoScreenState extends State<ResumoScreen> {
  bool carregando = true;

  String nomeUsuario = "Cael Xavier";
  String tituloPerfil = "Visionário e Explorador";
  String personalidade = "Leonardo da Vinci";
  String frase = "A inovação e a criatividade são as forças que me impulsionam para novos horizontes.";

  String meta = "";
  String emocao = "";
  String aprendizado = "";
  String gratidao = "";
  String espiritualidade = "";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    setState(() {
      meta = prefs.getString('meta_' + today) ?? "Sem meta registrada.";
      emocao = prefs.getString('emocao_' + today) ?? "Sem emoções registradas.";
      aprendizado = prefs.getString('reflexao_' + today) ?? "Sem aprendizados registrados.";
      gratidao = prefs.getString('gratidao_' + today) ?? "Sem gratidão registrada.";
      espiritualidade = prefs.getString('espiritual_' + today) ?? "Sem conexão espiritual registrada.";
      carregando = false;
    });
  }

  Widget linhaResumo(IconData icone, String label, String conteudo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, size: 22, color: Colors.teal),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 16),
                children: [
                  TextSpan(text: "$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: conteudo),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return const Scaffold(
        backgroundColor: Color(0xFFFFFDF6),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFDF6), Color(0xFFF8F3E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Resumo da Jornada", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 24),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/user_placeholder.png"),
                ),
                const SizedBox(height: 16),
                Text(nomeUsuario, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(tituloPerfil, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.teal)),
                const SizedBox(height: 4),
                Text("Inspiração de hoje em $personalidade",
                    style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54)),
                const SizedBox(height: 16),
                Text("“$frase”", textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black87)),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Resumo do Dia", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                ),
                const SizedBox(height: 12),
                linhaResumo(Icons.track_changes_rounded, "Meta", meta),
                linhaResumo(Icons.emoji_emotions_outlined, "Emoção", emocao),
                linhaResumo(Icons.check_circle_outline, "Reflexão", aprendizado),
                linhaResumo(Icons.favorite_border, "Gratidão", gratidao),
                linhaResumo(Icons.self_improvement, "Espiritualidade", espiritualidade),
                const SizedBox(height: 36),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/publicar');
                  },
                  icon: const Icon(Icons.upload_rounded),
                  label: const Text("Deseja publicar?", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: const Icon(Icons.home_rounded),
                  label: const Text("Voltar à Página Inicial", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
