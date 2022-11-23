import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/utils/title_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class DescCard extends StatelessWidget {
  final int index;
  const DescCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final product =
        Provider.of<Products>(context, listen: false).getByIndex(index);

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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: mainGrey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '-',
                      style: descText,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '1',
                      style: descText,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '+',
                      style: descText,
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
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
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
