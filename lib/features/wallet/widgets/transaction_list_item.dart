import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final String subAmount;
  final bool isPositive;

  const TransactionListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.subAmount,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF5F6FA),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFDBE2E8)),
            ),
            child: Icon(icon, size: 20, color: Color(0xFF6B82A2)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isPositive ? const Color(0xFF0AC660) : Colors.black,
                ),
              ),
              Text(
                subAmount,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 