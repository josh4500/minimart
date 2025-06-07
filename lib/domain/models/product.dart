final class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.inStock,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      inStock: json['inStock'] as bool,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  bool isFavorite;
  final bool inStock;
}
