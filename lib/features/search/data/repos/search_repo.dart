import 'package:book_store_app/core/errors/failures.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks(
      {required String category});
}
