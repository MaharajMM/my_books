import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/data/repository/my_books/books_repository_pod.dart';

final booksProvider = FutureProvider.autoDispose<MyBooksModel>(
  (ref) async {
    final result = await ref.watch(booksRepoProvider).getAllBooks();
    return result.when(
      (booksModel) {
        return booksModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
);
