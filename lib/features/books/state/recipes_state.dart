import 'package:my_books/data/model/my_books_model.dart';

sealed class BooksState {
  const BooksState();
}

class BooksInitialState implements BooksState {
  final List<Book> books;
  final bool hasMore;
  final int currentPage;
  final String? error;

  const BooksInitialState({
    required this.books,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
  });

  BooksInitialState copyWith({
    List<Book>? books,
    bool? hasMore,
    int? currentPage,
    String? error,
  }) {
    return BooksInitialState(
      books: books ?? this.books,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
    );
  }
}

class LoadingBooksState implements BooksState {
  final List<Book> currentBooks;

  const LoadingBooksState({
    required this.currentBooks,
  });
}

class LoadingMoreBooksState implements BooksState {
  final List<Book> currentBooks;
  final int currentPage;

  const LoadingMoreBooksState({
    required this.currentBooks,
    required this.currentPage,
  });
}

class BooksLoadErrorState implements BooksState {
  final String error;
  final List<Book> lastKnownBooks;

  const BooksLoadErrorState({
    required this.error,
    required this.lastKnownBooks,
  });
}

class BooksFetchErrorState implements BooksState {
  final String error;
  const BooksFetchErrorState(this.error);
}

class NoBooksFoundState implements BooksState {
  const NoBooksFoundState();
}
