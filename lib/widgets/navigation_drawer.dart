import 'dart:math';

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: min(MediaQuery.of(context).size.width / 2, 360),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
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
              leading: Icon(Icons.contact_page),
              title: Text('About'),
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Source Code'),
            ),
          ],
        ),
      ),
    );
  }
}
