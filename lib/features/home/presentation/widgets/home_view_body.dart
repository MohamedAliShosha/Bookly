// import 'package:book_store_app/Features/home/presentation/widgets/featured_books_list_view_bloc_consumer.dart';
// import 'package:book_store_app/Features/home/presentation/widgets/newest_books_list_view_bloc_consumer.dart';
// import 'package:book_store_app/core/utils/styles.dart';

// import 'package:flutter/material.dart';
// import 'custom_app_bar.dart';

// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});

//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }

// class _HomeViewBodyState extends State<HomeViewBody> {

//   @override
//   Widget build(BuildContext context) {
//     return const CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 15,
//                 ),
//                 child: CustomAppBar(),
//               ),
//               FeaturedBooksListViewBlocConsumer(),
//               SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Text(
//                   'Newest Books',
//                   style: Styles.textStyle18,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//         SliverFillRemaining(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: NewestBooksListViewBlocConsumer(),
//           ),
//         ),
//       ],
//     );
//   }
// }
