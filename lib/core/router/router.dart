import 'package:auto_route/auto_route.dart';
import 'package:my_books/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
      children: [
        RedirectRoute(
          path: '',
          redirectTo: 'books',
        ),
        AutoRoute(
          page: BooksRoute.page,
          path: 'books',
        ),
        AutoRoute(
          page: FavouriteRoute.page,
          path: 'favourite',
        ),
      ],
    ),
    AutoRoute(
      page: BookDetailsRoute.page,
      path: '/books-details',
    ),
  ];
}
