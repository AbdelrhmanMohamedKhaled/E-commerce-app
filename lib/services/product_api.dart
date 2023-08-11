import 'dart:convert';

import 'package:ecommerce_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_data.dart';

class ProductApi extends ChangeNotifier {
  static Future<List<ProductsData>> fetchProductData() async {
    const url = 'https://dummyjson.com/products';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Productss products = Productss.fromJson(jsonData);
        List<ProductsData> productsList =
            products.products.map((e) => ProductsData.fromJson(e)).toList();
        return productsList;
      } else {
        // ignore: avoid_print
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
    throw Exception('error');
  }
}
