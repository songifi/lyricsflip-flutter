import 'package:flutter/material.dart';
import 'package:lyricsflip_flutter/features/more/screens/badges_screen.dart';
import 'package:lyricsflip_flutter/features/more/screens/overview_screen.dart';
import 'package:lyricsflip_flutter/features/more/screens/profile_screen.dart';
import 'package:lyricsflip_flutter/features/notifications/screens/notifications_screen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'core/providers/theme_provider.dart';
import 'features/auth/providers/username_provider.dart';
import 'features/auth/screens/splash_screen.dart';
import 'features/auth/screens/create_username_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/create_account_screen.dart';
import 'features/auth/screens/onboarding_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/game/screens/quick_game_screen.dart';
import 'features/game/screens/game_screen.dart';
import 'features/game/screens/wager_setup_screen.dart';
import 'features/game/screens/wager_game_screen.dart';
import 'features/game/screens/wager_multiplayer_setup_screen.dart';
import 'features/game/screens/wager_multiplayer_invite_screen.dart';
import 'features/game/screens/wager_multiplayer_waiting_screen.dart';
import 'features/game/screens/wager_multiplayer_game_screen.dart';
import 'features/game/screens/join_challenge_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/create-username',
      builder: (context, state) => const CreateUsernameScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/create-account',
      builder: (context, state) => const CreateAccountScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/quick-game',
      builder: (context, state) => const QuickGameScreen(),
    ),
    GoRoute(path: '/game', builder: (context, state) => const GameScreen()),
    GoRoute(
      path: '/wager-setup',
      builder: (context, state) => const WagerSetupScreen(),
    ),
    GoRoute(
      path: '/wager-game',
      builder: (context, state) => const WagerGameScreen(),
    ),
    GoRoute(
      path: '/wager-multiplayer-setup',
      builder: (context, state) => const WagerMultiplayerSetupScreen(),
    ),
    GoRoute(
      path: '/wager-multiplayer-invite',
      builder: (context, state) => const WagerMultiplayerInviteScreen(),
    ),
    GoRoute(
      path: '/wager-multiplayer-waiting',
      builder: (context, state) => const WagerMultiplayerWaitingScreen(),
    ),
    GoRoute(
      path: '/wager-multiplayer-game',
      builder: (context, state) => const WagerMultiplayerGameScreen(),
    ),
    GoRoute(
      path: '/join-challenge',
      builder: (context, state) => const JoinChallengeScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/overview',
      builder: (context, state) => const OverviewScreen(),
    ),
    GoRoute(
      path: '/badges',
      builder: (context, state) => const BadgesScreen(),
    ),
  ],
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UsernameProvider()),
      ],
      child: AppRoot(),
    ),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      title: 'LyricFlip',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}
