import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/services/product_api.dart';
import 'package:ecommerce_app/viewModels/List_of_Products_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Locale? _locale;
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
      child: MaterialApp(
        locale: _locale,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const HomeScreen(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const LoginScreen(),
        //   '/signup': (context) => const SignupScreen(),
        //   // '/home':(context) =>   const HomeScreenn(),
        //   '/loginform': (context) => const LoginScreen()
        // },
      ),
    );
  }
}
