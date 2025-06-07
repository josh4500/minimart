import 'package:flutter/foundation.dart';
import 'package:minimart/domain.dart';
import 'package:minimart/generated/l10n.dart' show S;

import 'error_handling.dart';

class CartProvider with ChangeNotifier, ErrorHandling {
  CartProvider({
    required GetCartUseCase getCart,
    required UpdateCartUseCase updateCart,
  }) : _getCart = getCart,
       _updateCart = updateCart;
  final GetCartUseCase _getCart;
  final UpdateCartUseCase _updateCart;

  Cart? _cart;
  bool _isLoading = false;

  Cart? get cart => _cart;
  int get itemCount => _cart?.items.length ?? 0;
  double get totalAmount => _cart?.totalAmount ?? 0.0;
  bool get isLoading => _isLoading;

  Future<void> loadCart() async {
    _isLoading = true;
    clearError(false);

    try {
      _cart = await _getCart.invoke();
    } catch (e) {
      setError(S.current.failedToLoadCart);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addToCart(Product product, [int quantity = 1]) async {
    await _updateItemQuantity(product, (current) => current + quantity);
  }

  Future<void> removeFromCart(Product product) async {
    await _updateItemQuantity(product, (_) => 0);
  }

  Future<void> updateQuantity(Product product, int newQuantity) async {
    await _updateItemQuantity(product, (_) => newQuantity);
  }

  Future<void> _updateItemQuantity(
    Product product,
    int Function(int) updateFn,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      final currentItem = _cart?.items.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => CartItem(product: product, quantity: 0),
      );

      if (currentItem != null) {
        final newQuantity = updateFn(currentItem.quantity);
        await _updateCart.invoke(product, newQuantity);
        // Reload cart to reflect changes
        await loadCart();
      }
    } catch (e) {
      setError(S.current.failedToUpdateCart);
    }
  }

  void clearCart() {
    _cart = Cart(items: []);
    notifyListeners();
  }
}
