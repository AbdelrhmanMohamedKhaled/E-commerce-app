import 'package:ecommerce_app/models/product_data.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List _selectedProducts = [];
  int price = 0;

  add(ProductsData product) {
    selectedProducts.add(product);
    price += product.price.round();
    notifyListeners();
  }

  delet(ProductsData product) {
    selectedProducts.remove(product);
    price -= product.price.round();
    notifyListeners();
  }

  List get selectedProducts => _selectedProducts;
}
