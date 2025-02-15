import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/CategoryOrBrandsResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands();
}
