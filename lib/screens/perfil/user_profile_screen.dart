
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String nome = '';
  String email = '';
  String? nascimento;
  String? genero;
  String? profissao;
  String? experiencia;
  double progresso = 0.0;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nome = prefs.getString('nome') ?? '';
      email = prefs.getString('email') ?? 'exemplo@email.com';
      nascimento = prefs.getString('nascimento');
      genero = prefs.getString('genero');
      profissao = prefs.getString('profissao');
      experiencia = prefs.getString('experiencia');
      progresso = calcularProgresso();
    });
  }

  double calcularProgresso() {
    int total = 5;
    int preenchidos = 0;
    if (nome.isNotEmpty) preenchidos++;
    if (nascimento != null && nascimento!.isNotEmpty) preenchidos++;
    if (genero != null && genero!.isNotEmpty) preenchidos++;
    if (profissao != null && profissao!.isNotEmpty) preenchidos++;
    if (experiencia != null && experiencia!.isNotEmpty) preenchidos++;
    return preenchidos / total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F1C),
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/avatar_placeholder.png'),
            ),
            const SizedBox(height: 16),
            Text(
              nome.isNotEmpty ? nome : 'Nome não informado',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: const TextStyle(fontSize: 14, color: Colors.white54),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progresso,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFE6C76B)),
            ),
            const SizedBox(height: 8),
            Text(
              'Perfil ${(progresso * 100).toInt()}% completo',
              style: const TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 24),
            buildInfoRow('Data de nascimento', nascimento),
            buildInfoRow('Gênero', genero),
            buildInfoRow('Profissão', profissao),
            buildInfoRow('Experiência missionária', experiencia),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Editar perfil'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile/editar').then((_) => carregarDados());
              },
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text('Alterar senha'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile/senha');
              },
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn');
                Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String? valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(
            child: Text(
              valor?.isNotEmpty == true ? valor! : 'Não informado',
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
