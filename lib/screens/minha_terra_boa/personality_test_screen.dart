import 'package:flutter/material.dart';
import 'personality_result_screen.dart';

class PersonalityTestScreen extends StatefulWidget {
  const PersonalityTestScreen({super.key});

  @override
  State<PersonalityTestScreen> createState() => _PersonalityTestScreenState();
}

class _PersonalityTestScreenState extends State<PersonalityTestScreen> {
  int currentQuestion = 0;
  List<dynamic> answers = List.filled(28, null);

  final List<Map<String, dynamic>> questions = [
    {'text': 'Sinto que as dificuldades revelam o quanto ainda sou fraco espiritualmente.', 'type': 'likert'},
    {'text': 'Mesmo quando tudo parece escuro, confio que Deus continua trabalhando em silêncio.', 'type': 'likert'},
    {'text': 'Costumo perder a fé quando algo que espero não acontece.', 'type': 'likert'},
    {'text': 'Persisto nos meus princípios, mesmo quando sou criticado ou ridicularizado.', 'type': 'likert'},
    {'text': 'Prefiro não me envolver com os problemas dos outros, para preservar minha paz.', 'type': 'likert'},
    {'text': 'Tenho facilidade em perceber o que alguém sente, mesmo sem palavras.', 'type': 'likert'},
    {'text': 'Evito ajudar quando sinto que não serei valorizado por isso.', 'type': 'likert'},
    {'text': 'Sinto-me realizado quando posso aliviar o sofrimento de alguém.', 'type': 'likert'},
    {'text': 'Quando preciso decidir algo importante, costumo:', 'type': 'choice', 'options': ['Confiar na minha intuição', 'Analisar todos os fatos racionalmente', 'Buscar equilíbrio entre razão e sentimento']},
    {'text': 'Em relação à fé, eu sou mais:', 'type': 'choice', 'options': ['Movido por experiências emocionais profundas', 'Movido por coerência, estudo e tradição', 'Uma mistura entre emoção e razão, dependendo da situação']},
    {'text': 'Em situações difíceis, tendo a:', 'type': 'choice', 'options': ['Refletir antes de agir, buscando sentido espiritual', 'Agir rapidamente para resolver o problema', 'Oscilar entre reflexão e ação conforme o contexto']},
    {'text': 'Quando recebo um novo ensinamento, eu geralmente:', 'type': 'choice', 'options': ['Aceito com fé, mesmo sem entender tudo', 'Questiono e busco argumentos antes de aceitar', 'Escuto, reflito, e só depois decido se aplico']},
    {'text': 'Prefiro tarefas que sejam:', 'type': 'choice', 'options': ['Abertas e com liberdade criativa', 'Bem planejadas e com estrutura clara', 'Um meio-termo: liberdade com direção']},
    {'text': 'Quando algo precisa ser feito, eu normalmente:', 'type': 'choice', 'options': ['Me antecipo e resolvo logo', 'Aguardo para ver se alguém toma a frente', 'Avalio o cenário antes de decidir se ajo ou não']},
    {'text': 'Em relação aos resultados:', 'type': 'choice', 'options': ['O mais importante é ter boas intenções', 'O mais importante é gerar frutos concretos', 'O ideal é unir intenção com entrega real']},
    {'text': 'Quando tenho uma ideia, eu costumo:', 'type': 'choice', 'options': ['Colocar em prática imediatamente', 'Refletir bastante antes de agir', 'Compartilhar com alguém antes de decidir']},
    {'text': 'Acredito que fui criado para algo maior do que apenas sobreviver.', 'type': 'likert'},
    {'text': 'Muitas vezes me sinto deslocado neste mundo, como se minha alma pertencesse a outro tempo.', 'type': 'likert'},
    {'text': 'Tenho dificuldade em me empolgar com projetos que não tenham um propósito profundo.', 'type': 'likert'},
    {'text': 'Às vezes, acho ingênuo acreditar demais nas pessoas ou em mudanças reais.', 'type': 'likert'},
    {'text': 'Quando estou confuso ou emocionalmente abalado, eu:', 'type': 'choice', 'options': ['Me recolho em silêncio e oração', 'Busco distrações para esquecer o problema', 'Converso com alguém de confiança para refletir melhor']},
    {'text': 'Em relação ao meu mundo interior, sinto que:', 'type': 'choice', 'options': ['Conheço bem minhas sombras e virtudes', 'Ainda evito olhar para dentro com profundidade', 'Tenho momentos de consciência, mas nem sempre constantes']},
    {'text': 'Para mim, o silêncio é:', 'type': 'choice', 'options': ['Um lugar de encontro com Deus', 'Algo desconfortável ou desnecessário', 'Útil em alguns momentos, mas difícil de manter']},
    {'text': 'Quando sinto um desconforto interior, costumo:', 'type': 'choice', 'options': ['Buscar discernimento espiritual', 'Ignorar e continuar a rotina', 'Tentar entender o que está por trás disso']},
    {'text': 'Tenho dentro de mim um fogo por algo que ainda não sei nomear.', 'type': 'likert'},
    {'text': 'Sinto que preciso fazer algo grandioso para dar sentido à minha existência.', 'type': 'likert'},
    {'text': 'Às vezes me envolvo tanto com um ideal que esqueço de cuidar de mim.', 'type': 'likert'},
    {'text': 'Desanimo com facilidade quando não vejo reconhecimento no que faço.', 'type': 'likert'},
  ];

  void responder(dynamic resposta) {
    setState(() {
      answers[currentQuestion] = resposta;
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pergunta = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: Text(
          'Pergunta ${currentQuestion + 1}/${questions.length}',
          style: const TextStyle(
            color: Color(0xFFFFD700),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              pergunta['text'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),
            if (pergunta['type'] == 'likert') ...[
              _buildLikertOption('😠', 'Discordo completamente', 1),
              _buildLikertOption('🙁', 'Discordo parcialmente', 2),
              _buildLikertOption('😐', 'Neutro / Não sei dizer', 3),
              _buildLikertOption('🙂', 'Concordo parcialmente', 4),
              _buildLikertOption('😄', 'Concordo completamente', 5),
            ] else ...[
              for (var option in pergunta['options'])
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEDE7DD),
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () => responder(option),
                    child: Text(option, textAlign: TextAlign.center),
                  ),
                )
            ],
            if (currentQuestion == questions.length - 1)
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    
final tipo = getResultadoFinal();
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PersonalityResultScreen(resultadoFinal: tipo),
  ),
);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1E1E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Concluir Teste',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikertOption(String emoji, String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF1ECE5),
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          minimumSize: const Size.fromHeight(52),
        ),
        onPressed: () => responder(value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }


  String getResultadoFinal() {
    // Simulação: pegar o valor médio das respostas likert (1 a 5)
    final likertScores = answers.whereType<int>().toList();
    final media = likertScores.isEmpty
        ? 3
        : likertScores.reduce((a, b) => a + b) / likertScores.length;

    if (media <= 2) return "O Vigilante da Alma";
    if (media <= 2.8) return "O Guardião da Palavra";
    if (media <= 3.4) return "O Cuidador do Jardim";
    if (media <= 3.8) return "O Construtor da Rocha";
    if (media <= 4.2) return "O Sonhador do Bem";
    if (media <= 4.6) return "O Semeador da Esperança";
    return "O Missionário da Luz";
  }

}
