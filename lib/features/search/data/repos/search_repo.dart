import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks(
      {required String category});
}
