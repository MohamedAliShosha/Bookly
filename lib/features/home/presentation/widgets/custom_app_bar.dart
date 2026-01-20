import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

AppBar drawerAppBar(
    {required BuildContext context, void Function()? onPressed}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: onPressed,
    ),
    centerTitle: true,
    title: Image.asset(
      AssetsData.logo,
      height: 18,
    ),
    actions: [
      IconButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kSearchView);
        },
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 22,
        ),
      ),
    ],
  );
}
