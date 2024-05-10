import 'package:dio/dio.dart';

class ApiError {
  int? errorType = 0;
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioException) {
      DioException dioError = error; // as DioError;
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection failed\nplease check your internet connection";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Connection timeout";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Timeout error";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad certificate";
          break;
        case DioExceptionType.badResponse:
          errorType = dioError.response!.statusCode!;
          errorDescription = extractDescriptionFromResponse(dioError.response!);
          // errorDescription = "Oops! an error occurred";
          break;
        case DioExceptionType.cancel:
          errorDescription = "Request cancelled";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Oops! error occurred,\nplease check your internet connection and try again";
          break;
        case DioExceptionType.unknown:
          errorDescription = "Unknown error occurred, please try again";
          break;
      }
    } else {
      errorDescription = "Unknown error occurred, please try again";
    }
  }

  String extractDescriptionFromResponse(Response response) {
    String message = "";
    try {
      message = response.data["message"]??response.data?.toString()??response.statusMessage ??"Oops! an error occurred";
    } catch (error) {
      message = response.data["message"]??response.data?.toString()??response.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}