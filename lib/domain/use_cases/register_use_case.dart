import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repositories/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
