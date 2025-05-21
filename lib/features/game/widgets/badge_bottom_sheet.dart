import 'package:flutter/material.dart';
import '../../../shared/widgets/app_button.dart';

class BadgeBottomSheet extends StatelessWidget {
  final String badgeName;
  final VoidCallback onShare;
  final VoidCallback onViewBadge;
  final VoidCallback onClose;

  const BadgeBottomSheet({
    super.key,
    required this.badgeName,
    required this.onShare,
    required this.onViewBadge,
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
            'assets/img/badge.png',
            height: 80,
          ),
          const SizedBox(height: 24),
          const Text(
            'You just earned a new badge',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'You just earned yourself a new badge. "$badgeName". Well donee 👏',
            textAlign: TextAlign.center,
            style: const TextStyle(
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
                  text: 'View Badge',
                  onPressed: onViewBadge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 