import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/GetCartResponseEntity.dart';
import '../repositories/repositories/cart/cart_repository.dart';

@injectable
class GetItemsInCartUseCase {
  CartRepository cartRepository;

  GetItemsInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepository.getItemsInCart();
  }
}
