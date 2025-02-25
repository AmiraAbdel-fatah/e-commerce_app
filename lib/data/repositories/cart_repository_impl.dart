import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce/domain/repositories/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getItemsInCart() async {
    // TODO: implement getItemsInCart
    var either = await cartRemoteDataSource.getItemsInCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
