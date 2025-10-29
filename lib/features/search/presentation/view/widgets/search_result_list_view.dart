import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_error_widget.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/custom_book_item.dart';
import '../../search_cubit/search_cubit.dart';
import '../../search_cubit/search_state.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        //Add fixed width & height
                        width: 80,
                        height: 120,
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                              AppRouter.kBookDetailsView,
                              extra: state.books[index],
                            );
                          },
                          child: CustomBookImage(
                            imageUrl: state
                                .books[index].volumeInfo.imageLinks!.thumbnail,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.books[index].volumeInfo.title ??
                                  'Unknown Title',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Styles.textStyle20.copyWith(
                                fontFamily: kGtSectraFine,
                              ),
                            ),
                            const SizedBox(height: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
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
