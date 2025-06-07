import 'package:minimart/data/data_sources/local_datasource.dart';
import 'package:minimart/domain/models/cart.dart';
import 'package:minimart/domain/models/cart_item.dart';
import 'package:minimart/domain/models/product.dart';

final class CartRepository {
  CartRepository(this._dataSource);
  Cart? _cart;

  final LocalDataSource _dataSource;
  Future<Cart> getCart() async {
    if (_cart != null) return _cart!;

    final products = await _dataSource.getProducts();
    _cart = await _dataSource.getCart(products);
    return _cart!;
  }

  Future<void> updateCartItem(Product product, int quantity) async {
    final cart = await getCart();
    final index = cart.items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index >= 0) {
      if (quantity > 0) {
        cart.items[index].quantity = quantity;
      } else {
        cart.items.removeAt(index);
      }
    } else if (quantity > 0) {
      cart.items.add(CartItem(product: product, quantity: quantity));
    }
  }
}
