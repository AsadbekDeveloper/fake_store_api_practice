import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/providers/cart.dart';
import 'package:fake_store_api/providers/products.dart';
import 'package:fake_store_api/widgets/promo_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
import 'cart_product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final products = Provider.of<Products>(context);
    double getTotal() {
      final carts = cart.getCart;
      double total = 0;
      for (int i = 0; i < carts.length; i++) {
        total +=
            double.parse(products.getByIndex(carts.keys.elementAt(i)).price) *
                carts.values.elementAt(i);
      }
      return total;
    }

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartAppBar(cart: cart),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.getCart.keys.length,
                    itemBuilder: ((context, index) => CartProduct(
                        index: index,
                        amount: cart.getCart.values.elementAt(index))),
                  ),
                ),
                const PromoInput(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Total Payment',
                            style: titleHeader,
                          ),
                          const Spacer(),
                          Text(
                            '(${cart.getCart.length.toString()} items)',
                            style: descText,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '\$ ${getTotal()}',
                            style: priceHeader,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainBlack,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          textStyle: titleHeader.copyWith(color: mainWhite),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text('Proceed To Checkout'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
