import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/features/books/controller/notifier/books_notifer.dart';
import 'package:my_books/features/books/state/recipes_state.dart';

final booksProvider = AsyncNotifierProvider.autoDispose<BooksAsyncNotifier, BooksState>(
  BooksAsyncNotifier.new,
);
