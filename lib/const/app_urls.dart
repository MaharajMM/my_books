import 'package:my_books/const/env/env.dart';

/// This class helping putting all
/// the urls needed in apps
class AppUrls {
  AppUrls._();

  static String baseUrl = Env.developmentBaseUrl;
  static String loginUrl = "/api/login";
}
