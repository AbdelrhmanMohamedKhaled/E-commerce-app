import 'package:ecommerce_app/screens/check_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class AppBarComponents extends StatelessWidget {
  const AppBarComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartInstance = Provider.of<Cart>(context);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(211, 164, 255, 193),
                  shape: BoxShape.circle),
              child: Text(
                '${cartInstance.selectedProducts.length}',
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const CheckoutScreen()),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            '\$${cartInstance.price}',
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
