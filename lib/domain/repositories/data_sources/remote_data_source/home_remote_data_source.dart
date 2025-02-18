import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/CategoryOrBrandsResponseEntity.dart';
import '../../../entities/ProductsResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
