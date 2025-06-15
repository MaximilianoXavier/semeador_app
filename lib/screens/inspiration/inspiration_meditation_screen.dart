
import 'package:flutter/material.dart';

class InspirationMeditationScreen extends StatelessWidget {
  const InspirationMeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Meditação Guiada'),
      ),
      body: const Center(
        child: Icon(Icons.headset_rounded, size: 100, color: Colors.white70),
      ),
    );
  }
}
