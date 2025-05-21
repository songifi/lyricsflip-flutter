import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import 'game_mode_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome👋',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          const Text(
            'thetimileyin48',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Text(
            'CHOOSE YOUR PREFERRED GAME MODE',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.1),
          ),
          const SizedBox(height: 16),
          GameModeCard(
            backgroundColor: const Color(0xFFF6F1FA),
            borderColor: Color(0xFFDAC2FF),
            icon: const CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(Icons.flash_on, color: Colors.white),
            ),
            title: 'Quick Game',
            description: 'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
            onTap: () {
              context.go('/quick-game');
            },
            backgroundImage: 'assets/img/lines-1.png',
          ),
          GameModeCard(
            backgroundColor: const Color(0xFFE6F2F7),
            borderColor: const Color(0xFFD9E3E8),
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF3F8AB6),
              child: Icon(Icons.monetization_on, color: Colors.white),
            ),
            title: 'Wager (Single Player)',
            description: 'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
            onTap: () {
              context.go('/wager-setup');
            },
            backgroundImage: 'assets/img/lines-2.png',
          ),
          GameModeCard(
            backgroundColor: const Color(0xFFFAF1E8),
            borderColor: const Color(0xFFFCE0C5),
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFDF7A16),
              child: Icon(Icons.handshake, color: Colors.white),
            ),
            title: 'Wager (Multi Player)',
            description: 'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
            onTap: () {
              context.go("/wager-multiplayer-setup");
            },
            backgroundImage: 'assets/img/lines-3.png',
          ),
          GameModeCard(
            backgroundColor: const Color(0xFFFBEEF3),
            borderColor: const Color(0xFFF3CDDC),
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF7D1D3F),
              child: Icon(Icons.track_changes, color: Colors.white),
            ),
            title: 'Join a Challenge',
            description: 'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
            onTap: () {
              context.go('/join-challenge');
            },
            backgroundImage: 'assets/img/lines-4.png',
          ),
        ],
      ),
    );
  }
} 