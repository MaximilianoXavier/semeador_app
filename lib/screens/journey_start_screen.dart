import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JourneyStartScreen extends StatelessWidget {
  const JourneyStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Começar a Jornada')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/journey/seeds_icon.svg',
            height: 100,
            placeholderBuilder: (context) => const Icon(Icons.spa, size: 80),
          ),
          const SizedBox(height: 20),
          const Text(
            'Prepare seu coração para iniciar uma jornada de autoconhecimento.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/journey/steps');
            },
            child: const Text('Começar agora'),
          ),
        ],
      ),
    );
  }
}