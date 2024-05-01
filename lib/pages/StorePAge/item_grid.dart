import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/StorePAge/common/scale_button.dart';
import 'package:sneakers_app/pages/StorePAge/models/Market.dart';

class ItemGrid extends StatelessWidget {
  final Product m;
  final void Function(Product m) onItemSelect;

  const ItemGrid({
    Key? key,
    required this.m,
    required this.onItemSelect,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Price: ${m.price}');
    print('Name: ${m.name}');

    return ScaleButton(
      onTap: () {
        onItemSelect(m);
      },
      child: Container(
        width: double.infinity,
        height: 270,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: Key(m.id),
                  child: Image.network('http://localhost:9001/${m.image}'),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "\$${m.price}", // Afficher le prix
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              m.name, // Afficher le nom
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
