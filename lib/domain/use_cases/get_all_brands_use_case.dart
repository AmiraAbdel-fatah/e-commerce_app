import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repositories/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/CategoryOrBrandsResponseEntity.dart';

@injectable
class GatAllBrandsUseCase {
  HomeRepository homeRepository;

  GatAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandsResponseEntity>> invoke() {
    return homeRepository.getAllBrands();
  }
}