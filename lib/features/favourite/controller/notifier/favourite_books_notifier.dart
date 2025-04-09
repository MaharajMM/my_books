import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/data/service/favourite_books_db/i_favourite_books_db_service.dart';

class FavoriteBooksNotifier extends StateNotifier<List<Book>> {
  final IFavoriteBooksDbService dbService;

  FavoriteBooksNotifier(this.dbService) : super([]) {
    _loadFavorites();
  }

  void _loadFavorites() {
    final saved = dbService.getFavoriteBooks();
    state = saved;
  }

  void toggleFavorite(Book book) async {
    final isFav = isFavorite(book);

    if (isFav) {
      state = state.where((b) => b.key != book.key).toList();
    } else {
      state = [...state, book];
    }

    // Save to local storage
    await dbService.saveFavoriteBooks(state);
  }

  bool isFavorite(Book book) {
    return state.any((b) => b.key == book.key);
  }

  Future<void> clearAllFavorites() async {
    state = [];
    await dbService.clearFavorites();
  }
}
