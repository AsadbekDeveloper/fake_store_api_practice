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
    return Container(
      height: double.infinity,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainWhite,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.shopping_cart),
          ),
          cartCount == 0
              ? SizedBox.shrink()
              : Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartCount.toString(),
                      style: titleHeader.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
