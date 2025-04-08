import 'package:multiple_result/multiple_result.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/shared/exception/base_exception.dart';

abstract class IBooksRepository {
  Future<Result<MyBooksModel, APIException>> getAllBooks();
}
