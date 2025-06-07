import 'package:minimart/data/repositories/product_repository.dart';
import 'package:minimart/domain/models/product.dart';

final class GetProductUseCase {
  GetProductUseCase(this._repository);
  final ProductRepository _repository;
  Future<Product> invoke(String id) => _repository.getProduct(id);
}
