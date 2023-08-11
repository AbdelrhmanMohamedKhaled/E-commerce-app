import 'package:ecommerce_app/models/product_data.dart';
import 'package:flutter/material.dart';
import '../services/product_api.dart';

class ProductsListViewModel extends ChangeNotifier {
  List<ProductsData> _productList = [];

  Future<void> fetchProducts() async {
    _productList = await ProductApi.fetchProductData();
    notifyListeners();
  }

  List<ProductsData> get productList => _productList;
}
