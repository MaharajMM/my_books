import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/model/my_books_model.dart';

class FavoriteBooksNotifier extends StateNotifier<List<Book>> {
  FavoriteBooksNotifier() : super([]);

  void toggleFavorite(Book book) {
    if (state.any((b) => b.key == book.key)) {
      state = state.where((b) => b.key != book.key).toList(); // remove
    } else {
      state = [...state, book]; // add
    }
  }

  bool isFavorite(Book book) {
    return state.any((b) => b.key == book.key);
  }
}
