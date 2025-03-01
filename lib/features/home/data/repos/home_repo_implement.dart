import 'package:book_store_app/core/errors/failures.dart';
import 'package:book_store_app/features/home/data/models/book_model.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement implements HomeRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
