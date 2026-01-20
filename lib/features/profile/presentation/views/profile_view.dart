import 'package:book_store_app/Features/profile/presentation/widgets/profile_content.dart';
import 'package:book_store_app/Features/profile/presentation/widgets/profile_loading_state.dart';
import 'package:book_store_app/core/function/show_error_snack_bar.dart';
import 'package:book_store_app/core/function/show_logout_dialog.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/widgets/build_app_bar.dart';
import 'package:book_store_app/core/utils/shared_pref_helper.dart';
import 'package:book_store_app/core/utils/shared_pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? _userName;
  String? _userEmail;
  bool _isLoggingOut = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final name =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
      final email =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);

      if (mounted) {
        setState(() {
          _userName = name;
          _userEmail = email;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleLogout() async {
    final shouldLogout = await showLogoutDialog(context);
    if (!shouldLogout) return;

    setState(() => _isLoggingOut = true);

    try {
      await SharedPrefHelper.clearAllData();
      if (mounted) GoRouter.of(context).go(AppRouter.kLoginView);
    } catch (e) {
      if (mounted) {
        showErrorSnackBar(context, 'Logout failed. Please try again.');
        setState(() => _isLoggingOut = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        backgroundColor: Colors.transparent,
        context,
        leadingWidget: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: _isLoading
          ? const ProfileLoadingState()
          : ProfileContent(
              userName: _userName,
              userEmail: _userEmail,
              isLoggingOut: _isLoggingOut,
              onLogout: _handleLogout,
            ),
    );
  }
}
