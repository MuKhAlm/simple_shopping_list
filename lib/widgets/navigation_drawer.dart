import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_shopping_list/screens/about_screen.dart';
import 'package:simple_shopping_list/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: min(MediaQuery.of(context).size.width / 2, 360),
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.code),
            title: Text('Source Code'),
            onTap: _launchSouceCodeUrl,
          ),
        ],
      ),
    );
  }
}

void _launchSouceCodeUrl() async {
  const url = 'https://github.com/MuKhAlt/simple_shopping_list.git';
  await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  );
}
