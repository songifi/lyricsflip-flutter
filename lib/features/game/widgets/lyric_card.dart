import 'package:flutter/material.dart';

class LyricCard extends StatelessWidget {
  final String lyric;
  final Widget logo;
  final VoidCallback? onRefresh;

  const LyricCard({
    super.key,
    required this.lyric,
    required this.logo,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF70E3C7),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: Colors.white,
          width: 10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                logo,
                const SizedBox(height: 32),
                Text(
                  lyric,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 32),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LyricFlip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '...join the fun',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text('🎵💙'),
                  ],
                ),
              ],
            ),
          ),
          if (onRefresh != null)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.refresh, color: Color(0xFF70E3C7)),
                  onPressed: onRefresh,
                ),
              ),
            ),
          // Add a subtle pattern overlay for texture
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/img/noise.png',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 