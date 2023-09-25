import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductPage extends StatelessWidget {
  static String routeName = '/product';

  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    final Product? product = arguments is Product ? arguments as Product : null;

    return Scaffold(
      backgroundColor: product?.color, // Use ?. for conditional access
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: Center(
        child: Container(
          child: Text(
            '${product?.name ?? "Product not found"}', // Use ?. and ?? for conditional access and a default value
            style: TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
