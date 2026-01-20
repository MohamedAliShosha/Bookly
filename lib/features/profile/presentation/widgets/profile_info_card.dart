import 'package:book_store_app/Features/profile/presentation/widgets/icon_badge.dart';
import 'package:book_store_app/Features/profile/presentation/widgets/info_card_content.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconBadge(icon: icon, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: InfoCardContent(title: title, value: value),
          ),
        ],
      ),
    );
  }
}
