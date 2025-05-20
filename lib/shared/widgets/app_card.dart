import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const AppCard({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFF6EE7B7),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 6,
        ),
      ),
      child: child,
    );
  }
}
