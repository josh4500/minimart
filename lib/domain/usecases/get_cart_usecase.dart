import 'package:minimart/data/repositories/cart_repository.dart';
import 'package:minimart/domain/models/cart.dart';

final class GetCartUseCase {
  GetCartUseCase(this._repository);
  final CartRepository _repository;
  Future<Cart> invoke() => _repository.getCart();
}
