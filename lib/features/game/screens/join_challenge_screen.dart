import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/challenge_details_sheet.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_input.dart';

class JoinChallengeScreen extends StatefulWidget {
  const JoinChallengeScreen({super.key});

  @override
  State<JoinChallengeScreen> createState() => _JoinChallengeScreenState();
}

class _JoinChallengeScreenState extends State<JoinChallengeScreen> {
  final _codeController = TextEditingController();

  void _showChallengeDetails() {
    if (_codeController.text.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChallengeDetailsSheet(
        code: 'LF34567QW',
        wagerAmount: '18,000 STRK (120 USD)',
        participants: 'Three (3)',
        payout: '80,000 STRK (800 USD)',
        creator: 'thetimileyin',
        walletBalance: '200,789 STRK',
        onJoin: null,
      ),
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
          'Join a challenge',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum,',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            AppInput(
              controller: _codeController,
              hintText: 'Enter challenge code',
              label: 'Enter code',
              isRounded: false,
            ),
            const Spacer(),
            AppButton(
              text: 'Join Challenge',
              onPressed: _showChallengeDetails,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
} 