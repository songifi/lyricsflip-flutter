import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go("/profile"),
        ),
        title: const Text(
          'Badges',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Badges',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '6/48 of badges unlocked',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.8,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final isLocked = index >= 6;
                return _buildBadgeItem(isLocked: isLocked);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeItem({bool isLocked = false}) {
    return Column(
      children: [
        Stack(
          children: [
            if (isLocked)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock,
                  color: Colors.black38,
                  size: 24,
                ),
              )
            else
              Stack(
                children: [
                  Image.asset(
                    'assets/img/badge-icon.png',
                    width: 60,
                    height: 60,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Text(
                        '3X',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Music Connoisseur',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isLocked ? Colors.black38 : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
} 