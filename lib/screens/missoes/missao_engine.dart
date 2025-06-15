
import 'missao_model.dart';

class MissaoEngine {
  // Simulação de perfil e emoção do dia
  static const String perfil = 'contemplativo'; // ou: ativo, relacional, estratégico
  static const String emocao = 'ansiedade';     // ou: paz, gratidão, culpa

  static Missao getMissaoPersonalizada() {
    if (emocao == 'ansiedade') {
      return Missao(
        titulo: 'Silencie por 15 minutos',
        descricao: 'Fique em silêncio total e apenas respire.',
        referencia: 'Salmos 46,10',
      );
    }

    if (emocao == 'culpa') {
      return Missao(
        titulo: 'Peça perdão a alguém',
        descricao: 'Reconheça algo que você precisa curar em um relacionamento.',
        referencia: 'Mateus 5,23-24',
      );
    }

    if (emocao == 'gratidão') {
      return Missao(
        titulo: 'Escreva 5 coisas pelas quais é grato',
        descricao: 'Coloque no papel e agradeça a Deus por elas.',
        referencia: '1 Tessalonicenses 5,18',
      );
    }

    if (perfil == 'contemplativo') {
      return Missao(
        titulo: 'Leia um salmo em silêncio',
        descricao: 'Escolha um salmo e leia lentamente, com o coração.',
        referencia: 'Salmos 1,2',
      );
    }

    if (perfil == 'relacional') {
      return Missao(
        titulo: 'Faça um elogio sincero hoje',
        descricao: 'Valorize alguém com palavras construtivas.',
        referencia: 'Provérbios 16,24',
      );
    }

    return Missao(
      titulo: 'Ore por alguém que está distante',
      descricao: 'Lembre-se de uma pessoa e reze por ela hoje.',
      referencia: 'Filipenses 1,3-4',
    );
  }
}
