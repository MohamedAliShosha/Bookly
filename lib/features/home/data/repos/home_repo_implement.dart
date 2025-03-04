import 'package:book_store_app/core/errors/failures.dart';
import 'package:book_store_app/core/utils/api_service.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService; // Creating an instance of the ApiService class

  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=programming&sorting=newest&filtering=free&filtering=free-ebooks');

      List<BookModel> books = []; // Empty list to store books
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(
          books); // Returning the right side as a list of books as Right
    } on Exception {
      return Left(
          ServerFailure()); // Returning the left side as a failure as Left
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
