import '../../../../Features/home/data/models/book_model/book_model.dart';

import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
