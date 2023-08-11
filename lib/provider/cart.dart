import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List selectedProducts = [];
  int price = 0;

  add(Product product) {
    selectedProducts.add(product);
    price += product.price.round();
    notifyListeners();
  }

  delet(Product product) {
    selectedProducts.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}
