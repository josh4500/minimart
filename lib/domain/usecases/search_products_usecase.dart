import 'package:minimart/data/repositories/product_repository.dart';
import 'package:minimart/domain/models/product.dart';

final class SearchProductsUseCase {
  SearchProductsUseCase(this._repository);
  final ProductRepository _repository;
  Future<List<Product>> invoke(String query) =>
      _repository.searchProducts(query);
}
