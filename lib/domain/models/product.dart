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
      inStock: json['inStock'] ?? true,
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          category == other.category &&
          imageUrl == other.imageUrl &&
          isFavorite == other.isFavorite &&
          inStock == other.inStock;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      category.hashCode ^
      imageUrl.hashCode ^
      isFavorite.hashCode ^
      inStock.hashCode;
}
