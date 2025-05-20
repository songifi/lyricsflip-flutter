import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool enabled;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool isRounded;

  const AppInput({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    this.isRounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          onChanged: onChanged,
          style: GoogleFonts.inter(fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: isRounded ? BorderRadius.circular(28) : BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: isRounded ? BorderRadius.circular(28) : BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: isRounded ? BorderRadius.circular(28) : BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
      ],
    );
  }
} 