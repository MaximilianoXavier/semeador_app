
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String saudacao;

  final List<Map<String, dynamic>> modules = [
    {'label': 'Jornada', 'icon': Icons.pool, 'route': '/journey'}, {'label': 'Perfil', 'icon': Icons.person_outline, 'route': '/profile'}, {'label': 'Minha Terra Boa', 'icon': Icons.terrain, 'route': '/terra'}, {'label': 'Comunidade', 'icon': Icons.menu_book_outlined, 'route': '/comunidade'}, {'label': 'Inspiração', 'icon': Icons.auto_awesome, 'route': '/inspiracao'}, {'label': 'Missões', 'icon': Icons.flag, 'route': '/missoes'}, {'label': 'Debug', 'icon': Icons.bug_report, 'route': '/debug'}
  ];

  @override
  void initState() {
    super.initState();
    saudacao = gerarSaudacao();
  }

  String gerarSaudacao() {
    final hora = DateTime.now().hour;
    if (hora >= 5 && hora < 12) return 'Bom dia';
    if (hora >= 12 && hora < 18) return 'Boa tarde';
    return 'Boa noite';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "${saudacao}, Max!",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '"O homem interior se renova\n de dia em dia."',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '2 Cor. 4,16',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: modules.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    final mod = modules[index];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, mod['route']),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  mod['icon'],
                                  size: 30,
                                  color: mod['label'] == 'Debug'
                                      ? Colors.white30
                                      : const Color(0xFFE6C76B),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  mod['label'],
                                  style: TextStyle(
                                    color: mod['label'] == 'Debug'
                                        ? Colors.white30
                                        : Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.chevron_right,
                                color: mod['label'] == 'Debug'
                                    ? Colors.white24
                                    : Colors.white38),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
