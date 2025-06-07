import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:minimart/domain/models/cart.dart';
import 'package:minimart/domain/models/product.dart';
import 'package:minimart/domain/models/user.dart';

final class LocalDataSource {
  Future<Map<String, dynamic>> _loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/minimart_data.json');
    return jsonDecode(jsonString);
  }

  Future<List<Product>> getProducts() async {
    final data = await _loadJsonData();
    return (data['products'] as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }

  Future<Cart> getCart(List<Product> products) async {
    final data = await _loadJsonData();
    return Cart.fromJson(data['cart'], products);
  }

  Future<User> getUser() async {
    final data = await _loadJsonData();
    return User.fromJson(data['user']);
  }
}
