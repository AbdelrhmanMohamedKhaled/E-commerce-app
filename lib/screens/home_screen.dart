import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final ProductsListViewModel productIn =
        Provider.of<ProductsListViewModel>(context);
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
      body: (GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemCount: productIn.productList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    products: products[index],
                    productData: productIn.productList[index],
                  ),
                ),
              );
            },
            child: GridTile(
              footer: GridTileBar(
                // backgroundColor: Colors.black38,
                trailing: IconButton(
                  onPressed: () {
                    cartInstance.add(productIn.productList[index]);
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                ),
                leading: Text('\$${productIn.productList[index].price}'),
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
                        ),
                        child: ClipRRect(
                            child: Image.network(
                                productIn.productList[index].thumbnail)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
