import 'cart_item.dart';
import 'product.dart';

final class Cart {
  Cart({required this.items});

  factory Cart.fromJson(Map<String, dynamic> json, List<Product> products) {
    final items =
        (json['items'] as List)
            .map((itemJson) => CartItem.fromJson(itemJson, products))
            .toList();
    return Cart(items: items);
  }
  Map<String, dynamic> toJson() => {
    'items': items.map((item) => item.toJson()).toList(),
  };

  final List<CartItem> items;
  double get totalAmount => items.fold(0, (sum, item) => sum + item.totalPrice);
}
