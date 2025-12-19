import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Menu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to profile screen
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to notifications screen
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Themes'),
            onTap: () {
              // Navigate to themes/settings screen
              Navigator.pushNamed(context, '/themes');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('App Info'),
            onTap: () {
              // Navigate to app info screen
              Navigator.pushNamed(context, '/app_info');
            },
          ),
        ],
      ),
    );
  }
}
