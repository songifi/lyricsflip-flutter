import 'package:flutter/material.dart';
import 'package:lyricsflip_flutter/core/theme/app_colors.dart';

class WalletActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const WalletActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isPrimary ? AppColors.primary : Color(0xFFf4ebff),
              shape: BoxShape.circle,
              border: Border.all(color: isPrimary ? AppColors.primary : Color(0xFFDAC2FF)),
              
            ),
            child: Icon(
              icon,
              color: isPrimary ? Colors.white : Color(0xFF090909),
              size: 24,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
} 