import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppStatusType { error, success, info }

class AppStatusMessage extends StatelessWidget {
  final String message;
  final AppStatusType type;

  const AppStatusMessage({
    super.key,
    required this.message,
    this.type = AppStatusType.info,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;
    switch (type) {
      case AppStatusType.error:
        color = Colors.red;
        icon = Icons.error;
        break;
      case AppStatusType.success:
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      default:
        color = Colors.blue;
        icon = Icons.info;
    }
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: GoogleFonts.inter(fontSize: 12, color: color),
          ),
        ),
      ],
    );
  }
} 