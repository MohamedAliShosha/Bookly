import 'package:book_store_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context,
    {Color? backgroundColor, Widget? icon}) {
  return AppBar(
    backgroundColor: backgroundColor ?? ColorsManager.kPrimaryColor,
    elevation: 0,
    leading: icon ??
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsManager.kSecondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
  );
}
