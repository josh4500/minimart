import 'package:minimart/data/repositories/product_repository.dart';
import 'package:minimart/domain/models/product.dart';

final class FavouriteProductUseCase {
  FavouriteProductUseCase(this._repository);
  final ProductRepository _repository;
  Future<void> invoke(Product product) async {
    // Does nothing
    _repository.addFavorite();
  }
}
