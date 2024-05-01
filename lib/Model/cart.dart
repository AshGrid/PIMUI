import 'package:intl/intl.dart';

class Cart {
  final String userId;
  final List<String> productIds;
  final double total;
  DateTime? createdAt;
  DateTime? updatedAt;

  Cart({
    required this.userId,
    required this.productIds,
    required this.total,
    this.createdAt,
    this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      userId: json['User'],
      productIds: List<String>.from(json['product']),
      total: json['totalC'].toDouble(),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    return {
      'User': userId,
      'product': productIds,
      'totalC': total,
      'createdAt': createdAt != null ? dateFormat.format(createdAt!) : null,
      'updatedAt': updatedAt != null ? dateFormat.format(updatedAt!) : null,
    };
  }
}
