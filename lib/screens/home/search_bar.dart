import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../widgets/shopping_cart.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCount = Provider.of<Cart>(context).getCart.keys.length;
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor: mainWhite,
                hintText: 'Product Name',
                hintStyle: titleHeader.copyWith(
                  color: mainGrey,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ShoppingCart(cartCount: cartCount),
        ],
      ),
    );
  }
}
