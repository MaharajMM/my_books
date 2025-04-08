import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/favourite/controller/notifier/favourite_books_notifier.dart';

final favoriteBooksProvider = StateNotifierProvider<FavoriteBooksNotifier, List<Book>>((ref) {
  return FavoriteBooksNotifier();
});
