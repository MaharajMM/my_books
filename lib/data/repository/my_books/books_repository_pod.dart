import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/repository/my_books/books_repository.dart';
import 'package:my_books/data/repository/my_books/i_books_repository.dart';
import 'package:my_books/shared/api_client/dio/dio_client_provider.dart';

//the access point for the controller of the ui to interact with the state
final booksRepoProvider = Provider.autoDispose<IBooksRepository>(
  (ref) {
    return BooksRepository(dio: ref.watch(dioProvider));
  },
);
