import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/providers/products.dart';
import 'package:fake_store_api/utils/title_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  final int index;
  final int amount;
  const CartProduct({super.key, required this.index, required this.amount});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context).getByIndex(index);
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                offset: Offset(1, 3),
                spreadRadius: -5,
                blurRadius: 10,
                color: Color.fromRGBO(149, 149, 149, 0.4),
              ),
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(color: mainWhite),
                padding: const EdgeInsets.all(5),
                child: Image.network(
                  product.image,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTitle(product.title),
                      style: titleHeader,
                    ),
                    const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ],
                ),
                Text(
                  product.category,
                  style: descText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: priceHeader,
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(Icons.remove),
                          ),
                          Text(
                            amount.toString(),
                            style: priceHeader,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: mainBlack,
                              border: Border.all(width: 1),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: mainWhite,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
