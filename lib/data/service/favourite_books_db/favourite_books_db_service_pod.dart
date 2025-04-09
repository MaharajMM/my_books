import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/core/local_storage/app_storage_pod.dart';
import 'package:my_books/data/service/favourite_books_db/favourite_books_db_service.dart';

final favoriteBooksDbServiceProvider = Provider.autoDispose<FavoriteBooksDbService>(
  (ref) {
    return FavoriteBooksDbService(appStorage: ref.watch(appStorageProvider));
  },
);
