import 'package:fake_store_api/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    Key? key,
    required this.cartCount,
  }) : super(key: key);

  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        if (cartCount > 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const CartPage()),
            ),
          );
        }
      },
      child: Container(
        height: double.infinity,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainWhite,
        ),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.shopping_cart),
            ),
            cartCount == 0
                ? const SizedBox.shrink()
                : Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: mainBlack,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartCount.toString(),
                        style: titleHeader.copyWith(
                          fontSize: 10,
                          color: mainWhite,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
