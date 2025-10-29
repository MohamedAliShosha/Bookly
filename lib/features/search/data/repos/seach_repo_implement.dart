import '../../../../Core/errors/failures.dart';
import '../../../home/data/models/book_model/book_model.dart';
import 'search_repo.dart';
import '../../../../core/services/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplement(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=$category&sorting=newest&filtering=free&filtering=free-ebooks');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
