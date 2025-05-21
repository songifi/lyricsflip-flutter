import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {
            context.go("/home")
          }
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          const NotificationItem(
            icon: Icons.celebration,
            title: 'You won a challenge!',
            message: 'Congratulations! You won 400 USD in the challenge.',
            time: '2 mins ago',
            isUnread: true,
          ),
          const NotificationItem(
            icon: Icons.person_add,
            title: 'New challenger joined',
            message: 'theXaxxo joined your challenge.',
            time: '5 mins ago',
            isUnread: true,
          ),
          const NotificationItem(
            icon: Icons.wallet,
            title: 'Wallet funded',
            message: 'Your wallet has been funded with 400 USD.',
            time: '10 mins ago',
            isUnread: false,
          ),
          const NotificationItem(
            icon: Icons.emoji_events,
            title: 'Challenge completed',
            message: 'Your challenge has been completed successfully.',
            time: '1 hour ago',
            isUnread: false,
          ),
          const NotificationItem(
            icon: Icons.sports_esports,
            title: 'New challenge available',
            message: 'A new challenge is waiting for you!',
            time: '2 hours ago',
            isUnread: false,
          ),
        ],
      ),
    );
  }
} 