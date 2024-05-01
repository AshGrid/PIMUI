import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_app/pages/StorePAge/CarteProvider.dart';
import 'package:sneakers_app/pages/StorePAge/item_grid.dart';
import 'package:sneakers_app/pages/StorePAge/models/Market.dart';
import 'package:sneakers_app/utils/colors.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({
    Key? key,
    required this.items,
    required this.onItemTap,
  }) : super(key: key);

  final List<Product> items;
  final void Function(Product model) onItemTap;

  @override
  Widget build(BuildContext context) {
    var w = context.watch<CartProvider>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.creamColor,
        ),
        child: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 140, left: 16, right: 16, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: items.length ~/ 2,
                            itemBuilder: (context, index) {
                              Product m = items[index];
                              return ItemGrid(
                                m: m,
                                onItemSelect: onItemTap,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: items.length ~/ 2,
                                itemBuilder: (context, index) {
                                  Product m = items[index + items.length ~/ 2];
                                  return ItemGrid(
                                    m: m,
                                    onItemSelect: onItemTap,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.creamColor,
                  AppColors.creamColor,
                  AppColors.creamColor,
                  AppColors.creamColor.withOpacity(.0),
                ],
              )),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Courses",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkColor,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.category),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
