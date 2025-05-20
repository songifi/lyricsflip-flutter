import 'package:flutter/material.dart';

class GameInfoBar extends StatelessWidget {
  final String timeLeft;
  final String streakCount;
  final String score;

  const GameInfoBar({
    super.key,
    required this.timeLeft,
    required this.streakCount,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Time Left:', style: TextStyle(fontSize: 13, color: Colors.black45)),
              Text(timeLeft, style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              const Text('Streak Count', style: TextStyle(fontSize: 13, color: Colors.black45)),
              Row(
                children: [
                  Text(streakCount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 2),
                  const Text('🔥', style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Scores:', style: TextStyle(fontSize: 13, color: Colors.black45)),
              Text(score, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
} 