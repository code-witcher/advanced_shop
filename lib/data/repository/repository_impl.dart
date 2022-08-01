import 'package:advanced_shop/data/network/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../domain/models/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../mapper/mapper.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  NetworkInfo networkInfo;
  RemoteDataSource remoteDataSource;

  RepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(DataSource.noInternetConnection.value);
      }

      final response = await remoteDataSource.login(loginRequest);

      if (response.status != ApiInternalStatus.success) {
        return Left(
          Failure(
            ApiInternalStatus.failed,
            response.message ?? ResponseMessage.DEFAULT,
          ),
        );
      }

      return Right(response.toDomain());
    } catch (error) {
      return Left(HandleError.handle(error).failure);
    }
  }
}
