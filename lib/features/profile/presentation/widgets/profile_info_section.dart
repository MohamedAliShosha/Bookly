import 'package:book_store_app/Features/profile/presentation/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';

class ProfileInfoSection extends StatelessWidget {
  final String? userName;
  final String? userEmail;

  const ProfileInfoSection({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ProfileInfoCard(
            icon: Icons.person,
            title: 'Username',
            value: userName ?? 'Not available',
            color: Colors.blue,
          ),
          const SizedBox(height: 15),
          ProfileInfoCard(
            icon: Icons.email,
            title: 'Email Address',
            value: userEmail ?? 'Not available',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
