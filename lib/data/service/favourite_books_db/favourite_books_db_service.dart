import 'dart:convert';

import 'package:my_books/core/local_storage/app_storage.dart';
import 'package:my_books/data/model/my_books_model.dart';

import 'i_favourite_books_db_service.dart';

class FavoriteBooksDbService implements IFavoriteBooksDbService {
  final AppStorage appStorage;
  final String boxKey = 'favoriteBooks';

  FavoriteBooksDbService({required this.appStorage});

  @override
  Future<void> saveFavoriteBooks(List<Book> books) async {
    final box = appStorage.appBox;
    final encodedBooks = jsonEncode(books.map((b) => b.toMap()).toList());
    await box?.put(boxKey, encodedBooks);
  }

  @override
  List<Book> getFavoriteBooks() {
    final box = appStorage.appBox;
    final booksString = box?.get(boxKey) as String?;
    if (booksString == null) return [];

    final decoded = jsonDecode(booksString) as List<dynamic>;
    return decoded.map((item) => Book.fromMap(item)).toList();
  }

  @override
  Future<void> clearFavorites() async {
    final box = appStorage.appBox;
    await box?.delete(boxKey);
  }
}
