import 'package:my_books/data/model/my_books_model.dart';

abstract class IFavoriteBooksDbService {
  Future<void> saveFavoriteBooks(List<Book> books);
  List<Book> getFavoriteBooks();
  Future<void> clearFavorites();
}
