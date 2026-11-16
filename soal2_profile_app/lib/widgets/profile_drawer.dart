import 'package:flutter/material.dart';
import 'package:soal2_profile_app/screens/about_page.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.onLogout,
    required this.onDashboard,
    required this.onAbout,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final VoidCallback onLogout;
  final VoidCallback onDashboard;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF047857)),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Dashboard'),
            onTap: () {
              onDashboard();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Saya'),
            onTap: () {
              Navigator.pop(context);
              onAbout();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              onLogout();
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
        ],
      ),
    );
  }
}
