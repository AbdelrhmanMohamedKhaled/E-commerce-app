import 'package:flutter/material.dart';

Drawer DrawerTab() {
  return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(99),
              currentAccountPicture: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/user.jpg'),
              ),
              accountName: Text('Mari jone'),
              accountEmail: Text('mari-jone@gmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: const Text('My Items'),
              leading: const Icon(Icons.add_shopping_cart),
              onTap: () {},
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.help_center),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Log out'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {},
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 35),
          child: const Text(
            'Developed by abdelrhman mohamed @2023',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
