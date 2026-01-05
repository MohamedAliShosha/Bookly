import 'package:bloc/bloc.dart';
import 'package:book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'new1_books_state.dart';

class New1BooksCubit extends Cubit<New1BooksState> {
  New1BooksCubit(this.homeRepo) : super(New1BooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(New1BooksLoading());
    } else {
      emit(New1BooksPaginationLoading());
    }
    var result = await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(New1BooksFailure(failure.errorMessage));
      } else {
        emit(New1BooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(New1BooksSuccess(books));
    });
  }
}
