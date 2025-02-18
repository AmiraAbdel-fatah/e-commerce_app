import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';
import '../../../core/errors/failures.dart';
import '../../models/CategoryOrBrandsResponseDm.dart';
import '../../models/ProductsResponseDm.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategories() async {
    // TODO: implement getAllCategories
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllCategories);

        var getAllCategoriesResponse =
            CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllCategoriesResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllCategoriesResponse.message!));
        }
      } else {
        // todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please check Internet'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>>
      getAllBrands() async {
    // TODO: implement getAllBrands
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllBrands);

        var getAllBrandsResponse =
            CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllBrandsResponse);
        } else {
          return Left(ServerError(errorMessage: getAllBrandsResponse.message!));
        }
      } else {
        // todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please check Internet'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductsResponseDm>> getAllProducts() async {
    // TODO: implement getAllProducts
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllProducts);

        var getAllProductsResponse = ProductsResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProductsResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        // todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please check Internet'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
