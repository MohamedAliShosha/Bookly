part of 'new1_books_cubit.dart';

sealed class New1BooksState extends Equatable {
  const New1BooksState();

  @override
  List<Object> get props => [];
}

class New1BooksInitial extends New1BooksState {}

class New1BooksLoading extends New1BooksState {}

class New1BooksPaginationLoading extends New1BooksState {}

class New1BooksSuccess extends New1BooksState {
  final List<BookModel> books;

  const New1BooksSuccess(this.books);
}

class New1BooksFailure extends New1BooksState {
  final String errMessage;

  const New1BooksFailure(this.errMessage);
}

class New1BooksPaginationFailure extends New1BooksState {
  final String errMessage;

  const New1BooksPaginationFailure(this.errMessage);
}
