import 'package:flutter/material.dart';
import '../widgets/game_info_bar.dart';
import '../widgets/lyric_card.dart';
import '../widgets/answer_option.dart';
import '../widgets/score_bottom_sheet.dart';
import '../widgets/badge_bottom_sheet.dart';
import '../../../shared/widgets/app_logo.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int selectedIndex = -1;
  bool hasBadge = false;

  void _showBadgeBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BadgeBottomSheet(
          badgeName: 'Music Connoisseur',
          onShare: () {
            // Implement share logic
            Navigator.pop(context);
          },
          onViewBadge: () {
            // Implement view badge logic
            Navigator.pop(context);
          },
          onClose: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showResultBottomSheet() {
    if (selectedIndex == -1) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        if (hasBadge) {
          return BadgeBottomSheet(
            badgeName: 'Music Connoisseur',
            onShare: () {
              Navigator.pop(context);
            },
            onViewBadge: () {
              Navigator.pop(context);
            },
            onClose: () {
              Navigator.pop(context);
            },
          );
        } else {
          return ScoreBottomSheet(
            points: 368,
            onShare: () {
              // Implement share logic
              Navigator.pop(context);
            },
            onPlayAgain: () {
              Navigator.pop(context);
              _showBadgeBottomSheet();
            },
            onClose: () {
              Navigator.pop(context);
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/quick-game'),
        ),
        
        title: const Text(
          'Quick Game',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GameInfoBar(
              timeLeft: '59:00',
              streakCount: '12',
              score: '456',
            ),
            LyricCard(
              lyric: '"All I know is that when I dey\ncock, I hit and go\nAll I know is that when I been\nshoot, I hit their own"',
              logo: const AppLogo(
                fontSize: 48,
                isGameLogo: true,
              ),
              onRefresh: () {
              },
            ),
            const SizedBox(height: 14),
            AnswerOption(
              title: 'Pakurumo',
              subtitle: 'Wizkid & Samklef',
              selected: selectedIndex == 0,
              onTap: () {
                setState(() => selectedIndex = 0);
                _showResultBottomSheet();
              },
            ),
            AnswerOption(
              title: "Don't Let Me Down",
              subtitle: 'Chainsmokers',
              selected: selectedIndex == 1,
              onTap: () {
                setState(() => selectedIndex = 1);
                _showResultBottomSheet();
              },
            ),
            AnswerOption(
              title: 'Blood on The Dance Floor',
              subtitle: 'ODUMODUBLVCK Bloody Civilian & Wale',
              selected: selectedIndex == 2,
              onTap: () {
                setState(() => selectedIndex = 2);
                _showResultBottomSheet();
              },
            ),
            AnswerOption(
              title: "God's Plan",
              subtitle: 'Drake',
              selected: selectedIndex == 3,
              onTap: () {
                setState(() => selectedIndex = 3);
                _showResultBottomSheet();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
} 