import 'package:flutter/material.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../core/theme/app_colors.dart';

class WagerResultSheet extends StatelessWidget {
  final int points;
  final bool isWin;
  final String score;
  final String odds;
  final String wagerAmount;
  final String winAmount;
  final VoidCallback onShare;
  final VoidCallback onAction;
  final VoidCallback onClose;

  const WagerResultSheet({
    super.key,
    required this.points,
    required this.isWin,
    required this.score,
    required this.odds,
    required this.wagerAmount,
    required this.winAmount,
    required this.onShare,
    required this.onAction,
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
          const SizedBox(height: 20),
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
                TextSpan(
                  text: ' - You ${isWin ? 'won' : 'lost'}${isWin ? '🏆' : '😔'}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildInfoRow('Scores', score),
          _buildInfoRow('Odds', odds, showIcon: !isWin),
          _buildInfoRow('Wager Amount', wagerAmount),
          _buildInfoRow('You Win', winAmount, isHighlighted: isWin),
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
                  text: isWin ? 'Claim Earning' : 'Play Again',
                  onPressed: onAction,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlighted = false, bool showIcon = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isHighlighted ? AppColors.primary : Colors.black,
            ),
          ),
          if (showIcon) ...[
            const SizedBox(width: 8),
            const Icon(Icons.cancel, color: Colors.red, size: 20),
          ],
        ],
      ),
    );
  }
} 