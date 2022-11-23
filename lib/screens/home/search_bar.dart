import 'package:fake_store_api/constants/text_styles.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
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
          Container(
            height: double.infinity,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainWhite,
            ),
            child: Image.asset(
              'assets/menu.png',
            ),
          ),
        ],
      ),
    );
  }
}
