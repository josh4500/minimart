import 'package:minimart/data/data_sources/local_datasource.dart';
import 'package:minimart/domain/models/product.dart';

final class ProductRepository {
  ProductRepository(this._dataSource);
  List<Product>? _product;

  final LocalDataSource _dataSource;

  Future<List<Product>> getProducts() async =>
      _product ??= await _dataSource.getProducts();
  Future<List<Product>> getProductsByCategory(String category) async {
    final products = await getProducts();
    return products.where((p) => p.category == category).toList();
  }

  Future<List<Product>> searchProducts(String query) async {
    final products = await getProducts();
    return products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<Product> getProduct(String id) async {
    final products = await getProducts();
    return products.firstWhere((p) => p.id == id);
  }

  void addFavorite(Product product, bool isFavourite) {
    _product = _product?.map((p) {
      if (p.id == product.id) {
        return p..isFavorite = isFavourite;
      }
      return p;
    }).toList();
  }
}
