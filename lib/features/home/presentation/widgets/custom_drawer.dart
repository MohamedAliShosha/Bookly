import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPrimaryColor,
        child: const Padding(
          padding: EdgeInsets.only(top: 50),
          child: ProfileListTile(),
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                onTap: () {
                  context.pop();
                  context.push(AppRouter.kProfileView);
                },
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: kGtSectraFine,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
