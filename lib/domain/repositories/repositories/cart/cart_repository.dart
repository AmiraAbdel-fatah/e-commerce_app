import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/GetCartResponseEntity.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getItemsInCart();
}
