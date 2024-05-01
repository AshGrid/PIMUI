import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakers_app/pages/StorePAge/ApiService.dart';
import 'package:sneakers_app/pages/StorePAge/CarteProvider.dart';
import 'package:sneakers_app/pages/StorePAge/models/Market.dart';
import 'package:sneakers_app/utils/colors.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Product model;

  @override
  Widget build(BuildContext context) {
    var w = context.watch<CartProvider>();

    return FutureBuilder<List<Product>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text(model.name),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(model.name),
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          var detailModel = snapshot.data!.firstWhere((item) => item.id == model.id);

          return Scaffold(
            appBar: AppBar(
              title: Text(model.name),
            ),
            body: _buildDetailBody(context, detailModel),
          );
        }
      },
    );
  }

  Widget _buildDetailBody(BuildContext context, Product detailModel) {
    var w = context.watch<CartProvider>();

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
  tag: 'detail_${detailModel.id}',
  child: Container(
    decoration: BoxDecoration(
      color: AppColors.creamColor,
      shape: BoxShape.circle,
    ),
    child: Image.network(
      'http://localhost:9001/${detailModel.image}',
      height: 300,
    ),
  ),
),

              ),
              const SizedBox(height: 30),
              Text(
                " ${detailModel.name}",
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 40),
                  const Spacer(),
                  Text(
                    "\$${detailModel.price}",
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About the Course",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      detailModel.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: AppColors.greyColor),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 200)
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              top: 80,
              bottom: MediaQuery.of(context).padding.bottom + 20,
              left: 40,
              right: 30,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.creamColor.withOpacity(.0),
                  AppColors.creamColor,
                  AppColors.creamColor,
                  AppColors.creamColor,
                ],
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.heart),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      foregroundColor: AppColors.darkColor,
                    ),
                    onPressed: () {
                      double? price = double.tryParse(detailModel.price as String);

                      if (price != null) {
                        Provider.of<CartProvider>(context, listen: false).addToCart(
                          Product(
                            id: detailModel.id,
                            name: detailModel.name,
                            price: price,
                            description: detailModel.description,
                            image: detailModel.image,
                          ),
                        );

                        Future.delayed(const Duration(milliseconds: 400)).then((value) {
                          Navigator.pop(context);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid price format')),
                        );
                      }
                    },
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
