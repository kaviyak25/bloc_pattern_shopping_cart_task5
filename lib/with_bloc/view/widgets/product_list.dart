import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_bloc.dart';
import '../../bloc/state/cart_state.dart';
import 'product_tile.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
      List<int> cart = cartState.cartItem;
      return LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => ProductTile(
            itemNo: index,
            cart: cart,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
            childAspectRatio: 5,
          ),
        );
      });
    });
  }
}
