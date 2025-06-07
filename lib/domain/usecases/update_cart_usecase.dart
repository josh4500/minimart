import 'package:minimart/data/repositories/cart_repository.dart';
import 'package:minimart/domain/models/product.dart';

final class UpdateCartUseCase {
  UpdateCartUseCase(this._repository);
  final CartRepository _repository;
  Future<void> invoke(Product product, int quantity) =>
      _repository.updateCartItem(product, quantity);
}
