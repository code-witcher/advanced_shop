import 'package:advanced_shop/data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  success(Failure(ResponseCode.success, ResponseMessage.success)),
  noContent(Failure(ResponseCode.noContent, ResponseMessage.noContent)),
  badRequest(Failure(ResponseCode.badRequest, ResponseMessage.badRequest)),
  forbidden(Failure(ResponseCode.forbidden, ResponseMessage.forbidden)),
  unauthorized(
      Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized)),
  notFount(Failure(ResponseCode.notFount, ResponseMessage.notFount)),
  internetServerError(
    Failure(
      ResponseCode.success,
      ResponseMessage.internetServerError,
    ),
  ),

  /// Local Status code.
  connectTimeout(
    Failure(
      ResponseCode.connectTimeout,
      ResponseMessage.connectTimeout,
    ),
  ),
  receiveTimeout(
    Failure(
      ResponseCode.receiveTimeout,
      ResponseMessage.receiveTimeout,
    ),
  ),
  cancel(
    Failure(
      ResponseCode.cancel,
      ResponseMessage.cancel,
    ),
  ),
  sendTimeout(
    Failure(
      ResponseCode.sendTimeout,
      ResponseMessage.sendTimeout,
    ),
  ),
  cacheError(
    Failure(
      ResponseCode.cacheError,
      ResponseMessage.cacheError,
    ),
  ),
  noInternetConnection(
    Failure(
      ResponseCode.noInternetConnection,
      ResponseMessage.noInternetConnection,
    ),
  ),
  DEFAULT(
    Failure(
      ResponseCode.DEFAULT,
      ResponseMessage.DEFAULT,
    ),
  );

  final Failure value;
  const DataSource(this.value);
}

class ResponseCode {
  static const success = 200; // Success with data.
  static const noContent = 201; // Success with no data (no content).
  static const badRequest = 400; // Failed API reject the request.
  static const forbidden = 403; // API rejected the request.
  static const unauthorized = 401; // User is not authorized.
  static const notFount = 404; // Found no data.
  static const internetServerError = 500; // Crash in server side.

  /// Local Status code.
  static const connectTimeout = -1;
  static const receiveTimeout = -3;
  static const cancel = -2;
  static const sendTimeout = -4;
  static const cacheError = -5;
  static const noInternetConnection = -6;
  static const DEFAULT = -7;
}

class ResponseMessage {
  static const success = 'Success'; // Success with data.
  static const noContent = 'Success'; // Success with no data (no content).
  static const badRequest =
      'Bad request, Try again later'; // Failed API reject the request.
  static const forbidden =
      'Forbidden request, try again with valid request'; // API rejected the request.
  static const unauthorized = 'User in unauthorized'; // User is not authorized.
  static const notFount = 'No data found'; // Found no data.
  static const internetServerError =
      'Something went wrong, please try again.'; // Crash in server side.

  /// Local Status code.
  static const connectTimeout = 'Timeout error, try again later.';
  static const receiveTimeout = 'Timeout error, try again later';
  static const cancel = 'Request was cancelled, try again';
  static const sendTimeout = 'Timeout error, try again later';
  static const cacheError = 'Cache error, try again later';
  static const noInternetConnection = 'Please check your internet connection';
  static const DEFAULT = 'Something went wrong, try again later.';
}

class HandleError implements Exception {
  late Failure failure;

  HandleError.handle(error) {
    if (error is! DioError) {
      failure = DataSource.DEFAULT.value;
    }
    failure = _handleError(error);
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.connectTimeout.value;
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeout.value;
    case DioErrorType.receiveTimeout:
      return DataSource.receiveTimeout.value;
    case DioErrorType.response:
      if (error.response == null ||
          error.response?.statusCode == null ||
          error.response?.statusMessage == null) {
        return DataSource.DEFAULT.value;
      }
      return Failure(
        error.response!.statusCode!,
        error.response!.statusMessage!,
      );
    case DioErrorType.cancel:
      return DataSource.cancel.value;
    case DioErrorType.other:
      return DataSource.DEFAULT.value;
    default:
      return DataSource.DEFAULT.value;
  }
}

class ApiInternalStatus {
  static const success = 0;
  static const failed = 1;
}
