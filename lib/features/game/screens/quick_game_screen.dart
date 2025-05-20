import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dropdown.dart';

class QuickGameScreen extends StatefulWidget {
  const QuickGameScreen({super.key});

  @override
  State<QuickGameScreen> createState() => _QuickGameScreenState();
}

class _QuickGameScreenState extends State<QuickGameScreen> {
  String? selectedGenre;
  String? selectedDifficulty;
  String? selectedDuration;

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
            const SizedBox(height: 16),
            const Text(
              'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum,',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            AppDropdown(
              label: 'Genre',
              value: selectedGenre,
              items: const ['Pop', 'Hip Hop', 'R&B', 'Rock', 'Country'],
              onChanged: (value) => setState(() => selectedGenre = value),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              label: 'Difficulty Level',
              value: selectedDifficulty,
              items: const ['Easy', 'Medium', 'Hard', 'Expert'],
              onChanged: (value) => setState(() => selectedDifficulty = value),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              label: 'Duration',
              value: selectedDuration,
              items: const ['1 minute', '2 minutes', '5 minutes', '10 minutes'],
              onChanged: (value) => setState(() => selectedDuration = value),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.lightbulb_outline,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'INSTRUCTION',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'A card displaying a lyric from a song will appear along with a list of possible answers. Your goal is to select the correct answer as quickly as possible.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            AppButton(
              text: 'Start Game',
              onPressed: () {
                context.go('/game');
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
} 