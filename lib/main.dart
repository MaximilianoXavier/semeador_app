
import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/comunidade_feed_screen.dart';
import 'screens/comunidade_screen.dart';
import 'screens/inspiration/inspiration_screen.dart';
import 'screens/gamificacao_screen.dart';
import 'screens/debug_screen.dart';
import 'screens/premium_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/nova_publicacao_screen.dart';
import 'screens/comunidade_post_screen.dart';
import 'screens/comunidade_comments_screen.dart';
import 'screens/comunidade_mural_oracao.dart';
import 'screens/comunidade_desafios_screen.dart';
import 'screens/comunidade_mensagens_screen.dart';
import 'screens/insights_screen.dart';
import 'screens/minha_terra_boa/personality_test_screen.dart';
import 'screens/minha_terra_boa/personality_result_screen.dart';
import 'screens/resumo_screen.dart';
import 'screens/perfil/user_profile_screen.dart';
import 'screens/perfil/user_profile_edit_screen.dart';
import 'screens/perfil/user_profile_password_screen.dart';
import 'screens/minha_terra_boa/terra_screen.dart';
import 'screens/minha_terra_boa/terra_timeline_screen.dart';
import 'screens/minha_terra_boa/terra_history_screen.dart';
import 'screens/minha_terra_boa/terra_progress_screen.dart';
import 'screens/minha_terra_boa/terra_test_intro_screen.dart';
import 'screens/missoes/missao_home_screen.dart';
import 'screens/missoes/missao_detalhe_screen.dart';
import 'screens/missoes/missao_conclusao_screen.dart';
import 'screens/missoes/missao_historico_screen.dart';
import 'screens/missoes/missao_acao_screen.dart';
import 'screens/missoes/missao_evangelizar_screen.dart';
import 'screens/missoes/missao_catalogo_screen.dart';
import 'screens/journey_screen.dart';
import 'screens/journey_steps_screen.dart';
import 'screens/journey_meta_screen.dart';
import 'screens/journey_emocoes_screen.dart';
import 'screens/journey_reflexao_screen.dart';
import 'screens/journey_gratidao_screen.dart';
import 'screens/journey_spiritual_screen.dart';
import 'screens/journey_history_screen.dart';
import 'screens/journey_premium_screen.dart';
import 'screens/journey_contentamento_screen.dart';
import 'screens/journey_trilhas_screen.dart';

void main() {
  runApp(const SemeadorApp());
}

class SemeadorApp extends StatelessWidget {
  const SemeadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semeador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/comunidade/feed': (context) => ComunidadeFeedScreen(),
        '/comunidade': (context) => ComunidadeScreen(),
        '/home': (context) => HomeScreen(),
        '/menu': (context) => HomeScreen(),
        '/premium': (context) => PremiumScreen(),
        '/inspiracao': (context) => InspiracaoScreen(),
        '/gamificacao': (context) => GamificacaoScreen(),
        '/debug': (context) => const DebugScreen(),
        '/comunidade/chat': (context) => ChatScreen(),
        '/comunidade/nova-reflexao': (context) => NovaPublicacaoScreen(),
        '/comunidade/nova-postagem': (context) => ComunidadePostScreen(),
        '/comunidade/mural-oracao': (context) => ComunidadeMuralOracao(),
        '/comunidade/desafios': (context) => ComunidadeDesafiosScreen(),
        '/comunidade/mensagens': (context) => ComunidadeMensagensScreen(),
        '/perfil': (context) => UserProfileScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/profile/editar': (context) => const UserProfileEditScreen(),
        '/profile/senha': (context) => const UserProfilePasswordScreen(),
        '/insights': (context) => InsightsScreen(),
        '/resumo': (context) => ResumoScreen(),
        '/personalidade/teste': (context) => const PersonalityTestScreen(),
        '/terra': (context) => const MinhaTerraBoaScreen(),
        '/terra/teste': (context) => const TerraTestIntroScreen(),
        '/terra/timeline': (context) => const TerraTimelineScreen(),
        '/terra/historico': (context) => const TerraHistoryScreen(),
        '/terra/progresso': (context) => const TerraProgressScreen(),
        '/missoes': (context) => const MissaoHomeScreen(),
        '/missoes/detalhe': (context) => const MissaoDetalheScreen(),
        '/missoes/conclusao': (context) => const MissaoConclusaoScreen(),
        '/missoes/historico': (context) => const MissaoHistoricoScreen(),
        '/missoes/acao': (context) => const MissaoAcaoScreen(),
        '/missoes/evangelizar': (context) => const MissaoEvangelizarScreen(),
        '/missoes/catalogo': (context) => const MissaoCatalogoScreen(),
        '/journey': (context) => const JourneyScreen(),
        '/journey/steps': (context) => const JourneyStepsScreen(),
        '/journey/meta': (context) => const JourneyMetaScreen(),
        '/journey/emocoes': (context) => const JourneyEmocoesScreen(),
        '/journey/reflexao': (context) => const JourneyReflexaoScreen(),
        '/journey/gratidao': (context) => const JourneyGratidaoScreen(),
        '/journey/espiritual': (context) => const JourneySpiritualScreen(),
        '/journey/historico': (context) => const JourneyHistoryScreen(),
        '/journey/premium': (context) => const JourneyPremiumScreen(),
        '/journey/contentamento': (context) => const JourneyContentamentoScreen(),
        '/journey/trilhas': (context) => const JourneyTrilhasScreen(),
      },
    );
  }
}
