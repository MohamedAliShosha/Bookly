import 'package:book_store_app/Features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String? userName;
  final String? userEmail;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const CustomProfileCircleAvatar(),
          const SizedBox(height: 20),
          Text(
            userName ?? 'No Name Available',
            style: const TextStyle(
              fontFamily: kGtSectraFine,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            userEmail ?? 'No Email Available',
            style: TextStyle(
              fontFamily: kGtSectraFine,
              fontSize: 16,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
