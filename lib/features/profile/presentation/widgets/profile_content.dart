import 'package:book_store_app/Features/profile/presentation/widgets/logout_button.dart';
import 'package:book_store_app/Features/profile/presentation/widgets/profile_header.dart';
import 'package:book_store_app/Features/profile/presentation/widgets/profile_info_section.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  final String? userName;
  final String? userEmail;
  final bool isLoggingOut;
  final VoidCallback onLogout;

  const ProfileContent({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.isLoggingOut,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(userName: userName, userEmail: userEmail),
            const SizedBox(height: 30),
            ProfileInfoSection(userName: userName, userEmail: userEmail),
            const SizedBox(height: 30),
            LogoutButton(isLoggingOut: isLoggingOut, onLogout: onLogout),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
