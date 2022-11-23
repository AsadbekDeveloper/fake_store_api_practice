import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';
import '../../providers/cart.dart';
import '../../widgets/shopping_cart.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        const Text(
          'Shopping Bag',
          style: titleHeader,
        ),
        SizedBox(
            height: 50,
            child: ShoppingCart(cartCount: cart.getCart.keys.length)),
      ],
    );
  }
}
