import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../provider/cart.dart';
import '../viewModels/List_of_Products_model.dart';
import 'drawer_components.dart';
import 'package:ecommerce_app/widgets/app_bar_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ProductsListViewModel>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTab(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          S.of(context).Home,
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          AppBarComponents(),
        ],
      ),
      body: Consumer<ProductsListViewModel>(
          builder: (context, productData, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemCount: productData.productList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      products: products[index],
                      productData: productData.productList[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                footer: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return GridTileBar(
                      trailing: IconButton(
                        onPressed: () {
                          cart.add(productData.productList[index]);
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.black,
                      ),
                      leading:
                          Text('\$${productData.productList[index].price}'),
                      title: const Text(""),
                    );
                  },
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
                          ),
                          child: ClipRRect(
                              child: Image.network(
                                  productData.productList[index].thumbnail)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
