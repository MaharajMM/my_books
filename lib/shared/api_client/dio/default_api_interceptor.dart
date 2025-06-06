import 'package:my_books/shared/api_client/dio/default_api_error_handler.dart';
import 'package:dio/dio.dart';

// coverage:ignore-file

///This one is default interceptor which includes default api
///error handler
class DefaultAPIInterceptor extends Interceptor {
  DefaultAPIInterceptor({required this.dio});
  final Dio dio;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    defaultAPIErrorHandler(err, handler, dio);
  }
}
