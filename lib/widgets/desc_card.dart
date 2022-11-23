import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/providers/cart.dart';
import 'package:fake_store_api/utils/title_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class DescCard extends StatefulWidget {
  final int index;
  const DescCard(this.index, {super.key});

  @override
  State<DescCard> createState() => _DescCardState();
}

class _DescCardState extends State<DescCard> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    final product =
        Provider.of<Products>(context, listen: false).getByIndex(widget.index);
    final cart = Provider.of<Cart>(context, listen: false);
    void amountCont(bool plusMinus) {
      setState(() {
        if (plusMinus) {
          amount++;
        } else {
          if (amount > 1) {
            amount--;
          }
        }
      });
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: mainWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                formatTitle(product.title),
                style: titleHeader,
              ),
              Column(
                children: [
                  RatingBar.builder(
                    initialRating: double.parse(product.rating),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 20,
                    itemCount: 5,
                    itemBuilder: ((context, index) => const Icon(
                          Icons.star,
                          color: mainBlack,
                          size: 10,
                        )),
                    onRatingUpdate: (_) {},
                  ),
                  Text(
                    '(${product.reviews} reviews)',
                    style: descText,
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              product.description,
              style: descText,
            ),
          ),
          Row(
            children: [
              Text(
                '\$${product.price}',
                style: priceHeader.copyWith(
                  fontSize: 24,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: mainGrey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => amountCont(false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: const Text(
                          '-',
                          style: descText,
                        ),
                      ),
                    ),
                    Text(
                      amount.toString(),
                      style: descText,
                    ),
                    GestureDetector(
                      onTap: () => amountCont(true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: const Text(
                          '+',
                          style: descText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainBlack,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  cart.addItem(widget.index, amount);
                  setState(() {
                    amount = 1;
                  });
                },
                child: Text(
                  'Cart',
                  style: titleHeader.copyWith(color: mainWhite),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
