import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/game_info_bar.dart';
import '../widgets/lyric_card.dart';
import '../widgets/answer_option.dart';
import '../widgets/multiplayer_wager_result_sheet.dart';
import '../../../shared/widgets/app_logo.dart';

class WagerMultiplayerGameScreen extends StatefulWidget {
  const WagerMultiplayerGameScreen({super.key});

  @override
  State<WagerMultiplayerGameScreen> createState() => _WagerMultiplayerGameScreenState();
}

class _WagerMultiplayerGameScreenState extends State<WagerMultiplayerGameScreen> {
  int selectedIndex = -1;
  bool isGameComplete = false;
  bool didWin = false;

  void _showResultBottomSheet() {
    if (selectedIndex == -1) return;

    // Simulate game completion
    setState(() {
      isGameComplete = true;
      didWin = selectedIndex == 0;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return MultiplayerWagerResultSheet(
          points: 368,
          isWin: didWin,
          winnerName: 'theXaxxo',
          prizeAmount: '12,000 STRK (120 USD)',
          wagerAmount: '10,000 STRK (100 USD)',
          rankings: [
            {'name': didWin ? 'theXaxxo' : 'You', 'points': '345'},
            {'name': 'theXaxxo', 'points': '345'},
          ],
          onShare: () {
            // Implement share logic
            Navigator.pop(context);
          },
          onAction: () {
            Navigator.pop(context);
            if (didWin) {
              // Handle claim earning
            } else {
              // Reset game
              setState(() {
                selectedIndex = -1;
                isGameComplete = false;
              });
            }
          },
          onClose: () {
            Navigator.pop(context);
          },
        );
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
          onPressed: () => context.go('/home'),
        ),
        title: const Text(
          'Wager (Multi Player)',
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
              timeLeft: '09:48',
              streakCount: '3/5',
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