import 'package:advanced_shop/app/app_prefs.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/constants.dart';

class DioFactory {
  final AppPreferences appPreferences;

  const DioFactory(this.appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    final language = await appPreferences.getAppLang();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: 'accept token here', // TODO: get the token.
      defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseURL,
      headers: headers,
      receiveTimeout: Constants.apiTimeout,
      sendTimeout: Constants.apiTimeout,
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  }
}

const applicationJson = 'application/json';
const contentType = 'content-type';
const accept = 'accept';
const authorization = 'authorization';
const defaultLanguage = 'language';
