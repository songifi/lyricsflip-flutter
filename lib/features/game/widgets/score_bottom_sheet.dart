import 'package:flutter/material.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../core/theme/app_colors.dart';

class ScoreBottomSheet extends StatelessWidget {
  final int points;
  final VoidCallback onShare;
  final VoidCallback onPlayAgain;
  final VoidCallback onClose;

  const ScoreBottomSheet({
    super.key,
    required this.points,
    required this.onShare,
    required this.onPlayAgain,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: onClose,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/img/win.png',
            height: 80,
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$points Points',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
                const TextSpan(
                  text: ' - You are amazing🔥',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'You are giving off vibes of a true music lover, maybe play again and get the chance to win you yourself a badge',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'Share',
                  onPressed: onShare,
                  filled: false,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  text: 'Play Again',
                  onPressed: onPlayAgain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 