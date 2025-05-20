import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';

class ChallengeDetailsSheet extends StatelessWidget {
  final String code;
  final String wagerAmount;
  final String participants;
  final String payout;
  final String creator;
  final String walletBalance;
  final VoidCallback? onJoin;

  const ChallengeDetailsSheet({
    super.key,
    required this.code,
    required this.wagerAmount,
    required this.participants,
    required this.payout,
    required this.creator,
    required this.walletBalance,
    this.onJoin,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [   
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
                'Join a challenge - $code',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
          const Text(
            'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum,',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoRow('Wager Amount', wagerAmount),
          _buildInfoRow('No of Participant', participants),
          _buildInfoRow('Payout if won', payout, isHighlighted: true),
          _buildInfoRow('Creator', creator),
          const SizedBox(height: 24),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(
                'Wallet Balance: $walletBalance',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                  filled: false,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  text: 'Join Challenge',
                  onPressed: () {
                    Navigator.pop(context);
                    context.go('/wager-multiplayer-game');
                  },
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
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isHighlighted ? const Color(0xFF7A1DFF) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
} 