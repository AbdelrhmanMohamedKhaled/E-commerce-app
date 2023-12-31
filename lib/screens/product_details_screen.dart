import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/widgets/app_bar_components.dart';

import '../generated/l10n.dart';
import '../models/product_data.dart';

class ProductDetails extends StatefulWidget {
  final Product products;
  final ProductsData productData;
  const ProductDetails({
    super.key,
    required this.products,
    required this.productData,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isShowMore = true;
  @override
  Widget build(BuildContext context) {
    // final ProductsListViewModel productIn =
    //     Provider.of<ProductsListViewModel>(context);
    // final ProductsData productData = Provider.of<ProductsData>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.products.color,
      appBar: AppBar(
        backgroundColor: widget.products.color,
        elevation: 0,
        title: Text(
          S.of(context).ProductDetails,
          style: const TextStyle(color: Colors.white),
        ),
        actions: const [
          AppBarComponents(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    // height: double.infinity,
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: 20,
                      right: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        topLeft: Radius.circular(22),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 229, 147, 147),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                S.of(context).New.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromARGB(255, 255, 191, 0),
                            ),
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromARGB(255, 255, 191, 0),
                            ),
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromARGB(255, 255, 191, 0),
                            ),
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromARGB(255, 255, 191, 0),
                            ),
                            const Icon(
                              Icons.star_half,
                              size: 30,
                              color: Color.fromARGB(255, 255, 191, 0),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            SizedBox(
                              height: 50,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // logic of adding count on add to cart icon
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.greenAccent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.add_shopping_cart),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              S.of(context).pdescription,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              maxLines: isShowMore ? 3 : null,
                              overflow: TextOverflow.fade,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isShowMore = !isShowMore;
                                });
                              },
                              child: Text(
                                isShowMore ? 'Show More' : 'Show Less',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Product1,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(text: 'Price\n'),
                                  TextSpan(
                                    text: '\$${widget.productData.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Image.network(
                              widget.productData.thumbnail,
                              fit: BoxFit.fitWidth,
                              width: 250,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
