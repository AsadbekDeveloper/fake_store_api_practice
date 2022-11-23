import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/providers/products.dart';
import 'package:fake_store_api/utils/title_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product/product_screen.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    final product =
        Provider.of<Products>(context, listen: false).getByIndex(index);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: mainWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Ink(
            height: double.infinity,
            width: double.infinity,
            child: InkWell(
              splashColor: mainGrey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProductPage(index)),
                  ),
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 160,
                      child: Hero(
                        tag: 'product$index',
                        child: Image.network(
                          product.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                formatTitle(product.title),
                                style: titleHeader,
                              ),
                            ),
                            Text(
                              product.category[0].toUpperCase() +
                                  product.category.substring(1),
                              style: descText,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${product.price}',
                              style: priceHeader,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: mainGrey,
                                  size: 15,
                                ),
                                Text(
                                  product.rating,
                                  style: descText,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: mainWhite.withOpacity(0.3), shape: BoxShape.circle),
            child: const CircleAvatar(
              backgroundColor: mainBlack,
              radius: 15,
              child: Icon(
                Icons.favorite,
                color: mainWhite,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
