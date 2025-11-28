import 'package:bloc/bloc.dart';
import '../../../data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks(
      {required String category, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }
    var result = await homeRepo.fetchSimilarBooks(
      category: category,
      pageNumber: pageNumber,
    );
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailure((failure.errorMessage)));
      } else {
        emit(SimilarBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
