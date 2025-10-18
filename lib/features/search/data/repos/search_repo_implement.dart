import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/book_model/book_model.dart';
import 'search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplement(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=$category&sorting=newest&filtering=free&filtering=free-ebooks');

      List<BookModel> books = []; // Empty list
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
