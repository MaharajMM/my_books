// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:my_books/features/books/view/books_page.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:my_books/data/model/my_books_model.dart' as _i7;
import 'package:my_books/features/book_details/view/book_details_page.dart' as _i1;
import 'package:my_books/features/favourite/view/favourite_page.dart' as _i3;
import 'package:my_books/features/home/view/home_page.dart' as _i4;

/// generated route for
/// [_i1.BookDetailsPage]
class BookDetailsRoute extends _i5.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i6.Key? key,
    required _i7.Book book,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BookDetailsRoute.name,
          args: BookDetailsRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookDetailsRouteArgs>();
      return _i1.BookDetailsPage(
        key: args.key,
        book: args.book,
      );
    },
  );
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({
    this.key,
    required this.book,
  });

  final _i6.Key? key;

  final _i7.Book book;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [_i2.BooksPage]
class BooksRoute extends _i5.PageRouteInfo<void> {
  const BooksRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.BooksPage();
    },
  );
}

/// generated route for
/// [_i3.FavouritePage]
class FavouriteRoute extends _i5.PageRouteInfo<void> {
  const FavouriteRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavouritePage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}
