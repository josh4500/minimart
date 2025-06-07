import 'product.dart';

final class CartItem {
  CartItem({required this.product, this.quantity = 1});

  factory CartItem.fromJson(Map<String, dynamic> json, List<Product> products) {
    final product = products.firstWhere(
      (p) => p.id == json['productId'],
      orElse: () => throw Exception('Product not found'),
    );
    return CartItem(product: product, quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() => {
    'productId': product.id,
    'quantity': quantity,
  };

  final Product product;
  int quantity;

  double get totalPrice => product.price * quantity;
}
