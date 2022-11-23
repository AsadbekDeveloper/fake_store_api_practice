import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/desc_card.dart';

class ProductPage extends StatelessWidget {
  static const id = 'product';
  final int index;
  const ProductPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final product =
        Provider.of<Products>(context, listen: false).getByIndex(index);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: const BoxDecoration(color: mainWhite),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Image.asset(
                'assets/menu.png',
                width: 25,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                color: mainWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Hero(
                  tag: 'product$index',
                  child: Image.network(
                    product.image,
                    height: size.height / 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: mainGrey,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: mainBlack,
                    ),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: mainGrey,
                    ),
                  ],
                ),
              ),
            ),
            DescCard(index),
          ],
        ),
      ),
    );
  }
}
