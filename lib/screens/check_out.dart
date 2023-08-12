import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import 'package:ecommerce_app/widgets/app_bar_components.dart';

import '../viewModels/List_of_Products_model.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartInstance = Provider.of<Cart>(context);
    final ProductsListViewModel productIn =
        Provider.of<ProductsListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          AppBarComponents(),
        ],
        title: const Text(
          'Check Out',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cartInstance.selectedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(cartInstance.selectedProducts[index].title),
                      subtitle:
                          Text('${cartInstance.selectedProducts[index].price}'),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            productIn.productList[index].thumbnail),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          cartInstance
                              .delet(cartInstance.selectedProducts[index]);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 77, 181, 129)),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(10),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Pay \$${cartInstance.price}',
                style: const TextStyle(fontSize: 19),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
