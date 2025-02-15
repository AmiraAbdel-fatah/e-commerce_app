import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandsResponseEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands();
}
