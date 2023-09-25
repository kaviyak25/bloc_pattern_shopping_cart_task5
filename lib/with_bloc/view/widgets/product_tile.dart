import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_bloc.dart';
import '../../bloc/event/cart_event.dart';
import '../../models/product.dart';
import '../product_page.dart';

class ProductTile extends StatelessWidget {
  final int itemNo;
  final List<int> cart;

  const ProductTile({required this.itemNo, required this.cart});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductPage.routeName,
            arguments: Product('Product $itemNo', color),
          );
        },
        leading: Container(
          width: 50,
          height: 30,
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: cart.contains(itemNo)
              ? Icon(Icons.shopping_cart)
              : Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            final cartBloc = BlocProvider.of<CartBloc>(context);

            if (!cart.contains(itemNo)) {
              // Add the product to the cart
              cartBloc.add(AddProduct(itemNo));
              // Show a bottom sheet indicating that the item was added to the cart
              Scaffold.of(context).showBottomSheet<void>((context) {
                return Container(
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Added to Cart',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                );
              });
            } else {
              // Remove the product from the cart
              cartBloc.add(RemoveProduct(itemNo));
              Scaffold.of(context).showBottomSheet<void>((context) {
                return Container(
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Removed from Cart',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                );
              });
            }
          },
        ),
      ),
    );
  }
}
