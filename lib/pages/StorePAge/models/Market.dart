class Product {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price; // Prix dynamique

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String priceString = json['price'] ?? '';
    double price = double.tryParse(priceString) ?? 0.0;

    return Product(
      id: json['_id'] ?? '',
      name: json['nameP'] ?? '',
      description: json['descriptionP'] ?? '',
      image: json['image'] ?? '',
      price: price, // Utiliser le prix provenant du backend
    );
  }
}
