import 'package:flutter/material.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../core/theme/app_colors.dart';

class MultiplayerWagerResultSheet extends StatelessWidget {
  final int points;
  final bool isWin;
  final String winnerName;
  final String prizeAmount;
  final String wagerAmount;
  final List<Map<String, String>> rankings;
  final VoidCallback onShare;
  final VoidCallback onAction;
  final VoidCallback onClose;

  const MultiplayerWagerResultSheet({
    super.key,
    required this.points,
    required this.isWin,
    required this.winnerName,
    required this.prizeAmount,
    required this.wagerAmount,
    required this.rankings,
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
            isWin ? 'assets/img/win.png' : 'assets/img/exclamation.png',
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
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00D6B3),
                  ),
                ),
                TextSpan(
                  text: ' - You ${isWin ? 'won' : 'lost'}${isWin ? '🏆' : '😔'}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildInfoRow('Winner', isWin ? 'You' : '$winnerName (678 Pts)'),
          _buildInfoRow('Prize Won', prizeAmount, isHighlighted: true),
          _buildInfoRow('Wager Amount', wagerAmount),
          _buildInfoRow('Second Place', rankings[0]['name']! + ' (' + rankings[0]['points']! + ')'),
          _buildInfoRow('Third Place', rankings[1]['name']! + ' (' + rankings[1]['points']! + ')'),
          const SizedBox(height: 32),
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

  Widget _buildInfoRow(String label, String value, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isHighlighted ? AppColors.primary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
} 