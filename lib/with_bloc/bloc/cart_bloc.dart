import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart_bloc/with_bloc/bloc/state/cart_state.dart';
import 'package:shoppingcart_bloc/with_bloc/bloc/event/cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ProductAdded(cartItem: []));

  final List<int> _cartItems = [];
  List<int> get items => _cartItems;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProduct) {
      _cartItems.add(event.productIndex);
      yield ProductAdded(cartItem: List.from(_cartItems));
    } else if (event is RemoveProduct) {
      _cartItems.remove(event.productIndex);
      yield ProductRemoved(cartItem: List.from(_cartItems));
    }
  }
}
