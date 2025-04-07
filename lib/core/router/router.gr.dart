// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

import 'package:auto_route/auto_route.dart' as _i2;
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:my_books/features/books/view/books_page.dart' as _i1;

/// generated route for
/// [_i1.BooksPage]
class BooksRoute extends _i2.PageRouteInfo<void> {
  const BooksRoute({List<_i2.PageRouteInfo>? children})
      : super(
          BooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.BooksPage();
    },
  );
}
