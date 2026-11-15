import 'package:flutter/material.dart';
import 'package:soal2_profile_app/models/profile.dart';
import 'package:soal2_profile_app/screens/about_page.dart';
import 'package:soal2_profile_app/screens/edit_profile_page.dart';

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
      drawer: Drawer(
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHobby()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                print('Logout diklik');
              },
            ),
            SwitchListTile(
              secondary: Icon(Icons.dark_mode),
              title: Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
                widget.onThemeChanged(value);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
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
                        backgroundImage: AssetImage('assets/image/profile.png'),
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
                        style: TextStyle(fontSize: 14, color: Colors.white70),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dataBaru = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfilePage(profile: widget.profile),
            ),
          );
          if (!mounted) return;
          if (dataBaru != null) {
            setState(() {
              profile = dataBaru;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Profile Berhasil diperbarui!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 16,
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        value,
        softWrap: true,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}

class MyKontak extends StatelessWidget {
  const MyKontak({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Kontak',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),

        Card(
          elevation: 2,
           color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                InfoRow(
                  icon: Icons.email,
                  label: 'Email',
                  value: profile.email,
                ),

                Divider(height: 1),

                InfoRow(icon: Icons.phone, label: 'Phone', value: profile.noHp),

                Divider(height: 1),

                InfoRow(
                  icon: Icons.code,
                  label: 'GitHub',
                  value: profile.github,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
