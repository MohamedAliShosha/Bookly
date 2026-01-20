import 'package:book_store_app/Features/profile/presentation/widgets/logout_button_content.dart';
import 'package:book_store_app/Features/profile/presentation/widgets/logout_loading_indicator.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final bool isLoggingOut;
  final VoidCallback onLogout;

  const LogoutButton({
    super.key,
    required this.isLoggingOut,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: isLoggingOut ? null : onLogout,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          disabledBackgroundColor: Colors.grey[400],
        ),
        child: isLoggingOut
            ? const LogoutLoadingIndicator()
            : const LogoutButtonContent(),
      ),
    );
  }
}
