import 'package:my_books/core/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: BooksRoute.page,
      path: '/',
      initial: true,
    ),
  ];
}
