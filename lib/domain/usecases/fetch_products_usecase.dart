import 'package:minimart/data/repositories/product_repository.dart';
import 'package:minimart/domain/models/product.dart';

final class FetchProductsUseCase {
  FetchProductsUseCase(this._repository);
  final ProductRepository _repository;
  Future<List<Product>> invoke() => _repository.getProducts();
}
