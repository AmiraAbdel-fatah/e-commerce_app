import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';
import '../../../core/cache/shared_preference_utils.dart';
import '../../models/GetCartResponseDm.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDm>> getItemsInCart() async {
    // TODO: implement getItemsInCart
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        // ToDo: Internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager
            .getData(endPoint: EndPoints.addToCart, headers: {'token': token});

        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMessage: getCartResponse.message!));
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
