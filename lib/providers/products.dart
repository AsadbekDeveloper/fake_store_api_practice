import 'package:fake_store_api/services/fetch_data.dart';
import 'package:flutter/cupertino.dart';
import 'product_model.dart';

class Products extends ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get producstList => _productList;
  bool isLoading = false;
  final _service = FetchData();

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _productList = response;
    isLoading = false;
    notifyListeners();
  }

  ProductModel getByIndex(int index) {
    return _productList[index];
  }
}
