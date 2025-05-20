import 'package:flutter/material.dart';

class GameModeCard extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Widget icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final String? backgroundImage;

  const GameModeCard({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Stack(
          children: [
            if (backgroundImage != null)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.55,
                  child: Image.asset(
                    backgroundImage!,
                    height: 80,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 