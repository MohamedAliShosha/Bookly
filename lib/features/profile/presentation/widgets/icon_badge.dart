import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconBadge({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
