
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import 'drawer_components.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:ecommerce_app/widgets/app_bar_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartInstance = Provider.of<Cart>(context);
    return Scaffold(
      drawer: DrawerTab(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          AppBarComponents(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      products: products[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                footer: GridTileBar(
                  // backgroundColor: Colors.black38,
                  trailing: IconButton(
                    onPressed: () {
                      cartInstance.add(products[index]);
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.black,
                  ),

                  leading: Text('\$${products[index].price}'),
                  title: const Text(""),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -3,
                      bottom: -9,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: products[index].color,
                          ),
                          child: ClipRRect(
                              child: Image.asset(products[index].image)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
