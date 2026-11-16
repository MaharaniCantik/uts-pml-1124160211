import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soal2_profile_app/models/profile.dart';
import 'package:soal2_profile_app/screens/about_page.dart';
import 'package:soal2_profile_app/screens/edit_profile_page.dart';
import 'package:soal2_profile_app/screens/login_page.dart';
import 'package:soal2_profile_app/widgets/my_kontak.dart';
import 'package:soal2_profile_app/widgets/profile_drawer.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const ProfilePage({
    super.key,
    required this.profile,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late Profile profile;
  late bool _isDarkMode;
  @override
  void initState() {
    super.initState();
    profile = widget.profile;
    _isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: ProfileDrawer(
        isDarkMode: _isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            _isDarkMode = value;
          });
          widget.onThemeChanged(value);
        },
        onDashboard: () {
          _onItemTapped(0);
        },
        onAbout: () {
          _onItemTapped(1);
        },
        onLogout: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(
                isDarkMode: _isDarkMode,
                onThemeChanged: widget.onThemeChanged,
              ),
            ),
            (route) => false,
          );
        },
      ),

      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 30),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 85,
                              backgroundImage: profile.fotoProfil != null
                                  ? FileImage(File(profile.fotoProfil!))
                                  : const AssetImage('assets/image/profile.png')
                                        as ImageProvider,
                            ),
                            SizedBox(height: 10),
                            Text(
                              profile.nama,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'NIM:${profile.nim}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${profile.prodi} | ${profile.kelas}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      color: Theme.of(context).cardColor,
                      elevation: 3,
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tentang Saya',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              widget.profile.bio,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyKontak(profile: profile),
                  ],
                ),
              ),
            )
          : const MyHobby(),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final dataBaru = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditProfilePage(profile: widget.profile),
                  ),
                );
                if (!mounted) return;
                if (dataBaru != null) {
                  setState(() {
                    profile = dataBaru;
                  });
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('Profile Berhasil diperbarui!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: Icon(Icons.edit),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang Saya',
          ),
        ],
      ),
    );
  }
}
