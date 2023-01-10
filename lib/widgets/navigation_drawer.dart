import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_shopping_list/screens/about_screen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: min(MediaQuery.of(context).size.width / 2, 360),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Source Code'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
