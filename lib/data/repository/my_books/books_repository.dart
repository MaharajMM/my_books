import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:my_books/const/app_urls.dart';
import 'package:my_books/data/model/error_model.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/shared/exception/base_exception.dart';

import 'i_books_repository.dart';

class BooksRepository implements IBooksRepository {
  final Dio dio;
  BooksRepository({
    required this.dio,
  });

  @override
  Future<Result<MyBooksModel, APIException>> getAllBooks() async {
    final result = await dio.get(AppUrls.booksUrl);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(MyBooksModel.fromMap(result.data));
    } else {
      final errorModel = ErrorModel.fromMap(result.data);
      return Error(
        APIException(
          errorMessage: '${errorModel.error}',
        ),
      );
    }
  }
}
