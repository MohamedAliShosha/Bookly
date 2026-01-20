import 'package:book_store_app/Features/profile/presentation/widgets/custom_log_out_alert_dialog.dart';
import 'package:book_store_app/constants.dart';
import 'package:flutter/material.dart';

Future<bool> showLogoutDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => const CustomLogOutAlertDialog(
          logoutButtonColor: Colors.redAccent,
          cancelButtonColor: Colors.white,
          contentTextColor: Colors.white,
          titleTextColor: Colors.white,
          dialogBackgroundColor: kPrimaryColor,
          logoutButtonText: 'Logout',
          cancelButtonText: 'Cancel',
          titleText: 'Confirm Logout',
          contentText: 'Are you sure you want to logout?',
        ),
      ) ??
      false;
}
