import 'package:fake_store_api/providers/product_model.dart';
import 'package:fake_store_api/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import 'search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModel>> products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Products>(context, listen: false).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        title: const Text('Search Products'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/30',
              ),
              radius: 25,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              const SearchBar(),
              const SizedBox(
                height: 20,
              ),
              products.isLoading
                  ? const Expanded(
                    child: Center(
                        child: CircularProgressIndicator(),
                      ),
                  )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          childAspectRatio: 3 / 5,
                        ),
                        itemCount: products.producstList.length,
                        itemBuilder: ((context, index) {
                          return ProductItem(
                            index,
                          );
                        }),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
