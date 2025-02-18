import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/data_sources/remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>>
      getAllCategories() async {
    // TODO: implement getAllCategories
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>>
      getAllBrands() async {
    // TODO: implement getAllBrands
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() async {
    // TODO: implement getAllProducts
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
