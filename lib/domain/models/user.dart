final class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.deliveryAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      deliveryAddress: json['deliveryAddress'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'deliveryAddress': deliveryAddress,
  };

  final String id;
  final String name;
  final String email;
  String deliveryAddress;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          deliveryAddress == other.deliveryAddress;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ deliveryAddress.hashCode;
}
