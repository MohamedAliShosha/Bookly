import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/core/widgets/custom_error_widget.dart';
import 'package:book_store_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_store_app/features/search/presentation/manager/SearchBookCubit/search_book_cubit.dart';
import 'package:book_store_app/features/search/presentation/widgets/search_result_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        } else if (state is SearchSuccess) {
          print('state is success');
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            // itemExtent: 100, // used to set the height of each item
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,
                      extra: state.books[index]);
                },
                child: SearchResultListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return const CustomErrorWidget(errorMessage: 'Something went wrong!');
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nothing To Show',
                style: Styles.textStyle18,
              ),
            ],
          );
        }
      },
    );
  }
}
