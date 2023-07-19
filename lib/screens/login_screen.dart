import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset('assets/icons/login.svg'),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(66)),
                  width: 266,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.purple[800],
                        ),
                        border: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter Your Email'),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(66)),
                  width: 266,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.purple[800],
                        ),
                        border: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter Your Password'),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purple[800],
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 13),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66)))),
                  onPressed: () {
                    try {
                      // ignore: unused_local_variable
                      final user = _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  },
                  child: Text(
                    'login'.toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t Have An Account! ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                      child: Text(
                        ' signup'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
