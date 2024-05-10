import 'package:dio/dio.dart';
import 'package:lc_airline/core/network/interceptors/logger_interceptor.dart';
import 'package:lc_airline/core/storage/cache_data.dart';
import 'package:lc_airline/core/storage/cache_data_impl.dart';
import 'package:logger/logger.dart';

import '../exceptions/api_error.dart';
// import 'app_interceptor.dart';

/// To use this class just call
/// final networkProvider = NetworkProvider();
// networkProvider.call(path, method);
/// This class should be injected to all your services class that need to make network calls
class NetworkProvider {
  static const int connectTimeOut = 30000;
  static const int receiveTimeOut = 30000;
  late Dio dio;
  String baseUrl = "";
  final CacheData _cachedData = CacheDataImpl();
  final logger = Logger(
    printer: PrettyPrinter(
      printEmojis: false,
    ),
  );

  NetworkProvider({String? authToken}) {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: connectTimeOut),
      receiveTimeout: const Duration(milliseconds: receiveTimeOut),
      baseUrl: baseUrl,)
    );
    dio.interceptors.addAll([
      LoggingInterceptor(),
      InterceptorsWrapper(
          onRequest:(options, handler) async {
            options.headers["Accept"] = "application/json";
            options.headers["Content-Type"] = "application/json";

            String? token = await _cachedData.getToken();
            // String? token = accessTokenResponse?.accessToken;

            if (token != null && token.isNotEmpty) {
              options.headers["Authorization"] = "Bearer $token";
            }
            logger.i("${options.method} REQUEST: >>>>>> ${options.baseUrl+options.path}");

            return handler.next(options); //continue
          },
          onResponse:(response, handler) {
            // Do something with response data
            logger.d(response.data);
            return handler.next(response); // continue
          },
          onError: (DioException e, handler) {
            // Do something with response error
            logger.w(e.response?.data);
            logger.w(e.message);
            return  handler.next(e);//continue
          }
      )
    ]);
  }

  NetworkProvider.test(this.dio);

  Future<Response> call(String path, RequestMethod method, {
    Map<String, dynamic>? queryParams, data,
    FormData? formData,
  }) async {
    Response response;
    var params = queryParams ?? <String, dynamic>{};
    params.addAll(requiredParams);
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(path, queryParameters: params, data: data);
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.patch:
          response = await dio.patch(path, queryParameters: params, data: data);
          break;
        case RequestMethod.put:
          response = await dio.put(path, queryParameters: params, data: data);
          break;
        case RequestMethod.delete:
          response =
          await dio.delete(path, queryParameters: params, data: data);
          break;
        case RequestMethod.upload:
          response = await dio.post(path, queryParameters: params, data: data);
          break;
      }
      return response;
    } on DioException catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      return Future.error(apiError, stackTrace);
    }
  }

  Map<String, dynamic> get requiredParams {
    //Todo add all required params for your endpoint here if any
    var params = <String, dynamic>{};
    return params;
  }
}

enum RequestMethod { post, get, put, delete, upload, patch }
