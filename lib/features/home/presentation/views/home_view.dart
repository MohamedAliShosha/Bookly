import 'package:book_store_app/Features/home/presentation/widgets/custom_app_bar.dart';
import 'package:book_store_app/Features/home/presentation/widgets/custom_drawer.dart';
import 'package:book_store_app/Features/home/presentation/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:book_store_app/Features/home/presentation/widgets/newest_books_list_view_bloc_consumer.dart';
import 'package:book_store_app/core/utils/styles.dart';
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

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeaturedBooksListViewBlocConsumer(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListViewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}
