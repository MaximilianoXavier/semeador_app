
import 'package:flutter/material.dart';

class InspirationShareScreen extends StatelessWidget {
  const InspirationShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Compartilhar Inspiração'),
      ),
      body: const Center(
        child: Text(
          'Compartilhe sua inspiração com o mundo!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
