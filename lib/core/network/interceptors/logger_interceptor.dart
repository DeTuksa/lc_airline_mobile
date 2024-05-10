import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final logger = Logger(
    printer: PrettyPrinter(
      printEmojis: false,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("${options.method} REQUEST: >>>>>> ${options.baseUrl+options.path}");
    if(options.method == "GET") {
      logger.i("QueryParams: >>>>>> ${options.queryParameters}");
    } else {
      logger.i("QueryParams: >>>>>> ${options.queryParameters}");
      logger.i("Body: >>>>>> ${options.data}");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(response.data);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.w(err.response?.data);
    return super.onError(err, handler);
  }
}