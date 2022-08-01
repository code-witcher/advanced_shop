import 'package:advanced_shop/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../response/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseURL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @POST(Constants.loginURL)
  Future<AuthenticationResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );
}
