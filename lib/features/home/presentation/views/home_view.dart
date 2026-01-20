import 'package:book_store_app/Features/home/presentation/widgets/custom_app_bar.dart';
import 'package:book_store_app/Features/home/presentation/widgets/custom_drawer.dart';
import 'package:book_store_app/Features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: drawerAppBar(
            context: context,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
      ),
      key: scaffoldKey,
      body: HomeViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
