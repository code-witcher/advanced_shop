import 'package:advanced_shop/data/network/failure.dart';
import 'package:advanced_shop/data/network/requests.dart';
import 'package:advanced_shop/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
