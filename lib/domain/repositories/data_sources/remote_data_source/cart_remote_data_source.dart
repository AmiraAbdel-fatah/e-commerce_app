import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getItemsInCart();
}
