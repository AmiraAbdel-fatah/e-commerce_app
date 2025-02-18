import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
