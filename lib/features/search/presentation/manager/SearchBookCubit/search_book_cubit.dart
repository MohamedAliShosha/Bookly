import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_book_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> fetchSearchBooks({required String category}) async {
    if (category.isEmpty) {
      emit(
        const SearchFailure('Category is empty'),
      );
    }
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(category: category);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
