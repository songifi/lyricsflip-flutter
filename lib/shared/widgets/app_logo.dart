import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  final double fontSize;
  final MainAxisAlignment alignment;
  final bool isGameLogo;
  final Color? textColor;
  final Color? accentColor;

  const AppLogo({
    super.key,
    this.fontSize = 40,
    this.alignment = MainAxisAlignment.center,
    this.isGameLogo = false,
    this.textColor,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isGameLogo) {
      return Image.asset(
        'assets/img/card_img.png',
        height: fontSize * 1.5,
      );
    }

    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          'Lyric',
          style: GoogleFonts.bricolageGrotesque(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
          ),
        ),
        Text(
          'Flip',
          style: GoogleFonts.bricolageGrotesque(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: accentColor ?? const Color(0xFF6EE7B7),
          ),
        ),
      ],
    );
  }
} 