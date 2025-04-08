import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/data/repository/my_books/books_repository_pod.dart';
import 'package:my_books/features/books/state/recipes_state.dart';

class BooksAsyncNotifier extends AutoDisposeAsyncNotifier<BooksState> {
  static const int _fetchRecord = 10;

  @override
  Future<BooksState> build() async {
    return _fetchInitialRecipe();
  }

  Future<BooksState> _fetchInitialRecipe() async {
    state = const AsyncData(LoadingBooksState(currentBooks: []));

    try {
      final result = await ref.read(booksRepoProvider).getAllBooks(
            offset: 0,
            pageLimit: _fetchRecord,
          );

      return result.when(
        (booksModel) {
          if (booksModel.works!.isEmpty) {
            return const NoBooksFoundState();
          }

          return BooksInitialState(
            books: booksModel.works!,
            hasMore: booksModel.works!.length >= _fetchRecord,
            currentPage: 1,
          );
        },
        (error) => BooksFetchErrorState(error.errorMessage),
      );
    } catch (e) {
      return BooksFetchErrorState(e.toString());
    }
  }

  Future<void> loadNextPage() async {
    final currentState = state.value;
    if (currentState == null || currentState is! BooksInitialState || !currentState.hasMore) {
      return;
    }

    final nextPage = currentState.currentPage + 1;
    final offset = (nextPage * _fetchRecord) + 1;
    final currentBooks = currentState.books;

    // Only show loading indicator for new items
    state = AsyncData(
      LoadingMoreBooksState(
        currentBooks: currentBooks,
        currentPage: nextPage,
      ),
    );

    try {
      final result = await ref.read(booksRepoProvider).getAllBooks(
            offset: offset,
            pageLimit: _fetchRecord,
          );

      state = AsyncData(
        await result.when(
          (booksModel) {
            if (booksModel.works == null || booksModel.works!.isEmpty) {
              return const NoBooksFoundState();
            }
            final List<Book> newBooks = [...currentBooks, ...booksModel.works!];
            return BooksInitialState(
              books: newBooks,
              hasMore: booksModel.works!.length >= _fetchRecord,
              currentPage: nextPage,
            );
          },
          (error) => BooksLoadErrorState(
            error: error.errorMessage,
            lastKnownBooks: currentBooks,
          ),
        ),
      );
    } catch (e) {
      state = AsyncData(
        BooksLoadErrorState(
          error: e.toString(),
          lastKnownBooks: currentBooks,
        ),
      );
    }
  }

  Future<void> refresh() async {
    final currentState = state.value;
    if (currentState is BooksInitialState) {
      state = AsyncData(LoadingBooksState(currentBooks: currentState.books));
    } else {
      state = const AsyncData(LoadingBooksState(currentBooks: []));
    }
    await _fetchInitialRecipe();
  }
}
