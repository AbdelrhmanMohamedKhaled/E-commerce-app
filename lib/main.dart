import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/services/product_api.dart';
import 'package:ecommerce_app/viewModels/List_of_Products_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider<ProductsListViewModel>(
          create: (_) => ProductsListViewModel(),
        ),
        ChangeNotifierProvider<ProductApi>(create: (_) => ProductApi()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        // initialRoute: '/loginform',
        // routes: {
        //   // '/':(context) => const LoginScreen(),
        //   '/signup': (context) => const SignupScreen(),
        //   // '/home':(context) =>   const HomeScreenn(),
        //   '/loginform': (context) => const LoginScreen()
        // },
      ),
    );
  }
}
