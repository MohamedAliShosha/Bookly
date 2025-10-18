import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService; // Creating an instance of the ApiService class

  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=general&sorting=newest&filtering=free&filtering=free-ebooks');

      List<BookModel> books = []; // Empty list to store books
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(
          books); // Returning the right side as a list of books as Right
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        ); // Returning the left side as a failure as Left
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=programming&filtering=free&filtering=free-ebooks'); // Removing the sorting parameter

      List<BookModel> books = []; // Empty list to store books
      for (var item in data['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }
      return Right(
          books); // Returning the right side as a list of books as Right
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        ); // Returning the left side as a failure as Left
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
