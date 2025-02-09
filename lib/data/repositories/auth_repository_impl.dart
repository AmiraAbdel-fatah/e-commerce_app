import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    // TODO: implement register
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
