import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

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
          'Overview',
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
              'Your Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Your games by numbers',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  _buildStatItem('600 USD', 'Total Tokens Earned'),
                  const Divider(height: 32, color: Color(0xffeeeeee),),
                  Row(
                    children: [
                      Expanded(child: _buildStatItem('870', 'Total Games Played')),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.black12,
                      ),
                      Expanded(child: _buildStatItem('1209th', 'Ranking')),
                    ],
                  ),
                  const Divider(height: 32, color: Color(0xffeeeeee),),
                  Row(
                    children: [
                      Expanded(child: _buildStatItem('870', 'Total Games Won')),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.black12,
                      ),
                      Expanded(child: _buildStatItem('678', 'Total Games Loss')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
} 