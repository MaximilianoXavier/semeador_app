
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1F1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icon/semeador_logo.png',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bem-vindo ao Semeador',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Uma jornada de autoconhecimento, inspiração e propósito.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      Navigator.pushReplacementNamed(context, '/comunidade/feed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE6C76B),
                      minimumSize: Size(double.infinity, 50),
                      foregroundColor: Color(0xFF0D1F1C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Entrar'),
                  ),
                  SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () async {
                      try {
                        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                        if (googleUser == null) return;

                        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
                        final credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );

                        await FirebaseAuth.instance.signInWithCredential(credential);
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', true);
                        Navigator.pushReplacementNamed(context, '/comunidade/feed');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Erro ao entrar com o Google: $e')),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Color(0xFFE6C76B)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_logo.png',
                          height: 22,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Entrar com o Google',
                          style: TextStyle(color: Color(0xFFE6C76B)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Text(
                      'Criar nova conta',
                      style: TextStyle(color: Color(0xFFE6C76B)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
