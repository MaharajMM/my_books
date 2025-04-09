import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/data/service/favourite_books_db/favourite_books_db_service_pod.dart';
import 'package:my_books/features/favourite/controller/notifier/favourite_books_notifier.dart';

final favoriteBooksNotifierProvider =
    StateNotifierProvider<FavoriteBooksNotifier, List<Book>>((ref) {
  final dbService = ref.watch(favoriteBooksDbServiceProvider);
  return FavoriteBooksNotifier(dbService);
});
