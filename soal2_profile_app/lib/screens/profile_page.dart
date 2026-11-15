import 'package:flutter/material.dart';
import 'package:soal2_profile_app/models/profile.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;
  const ProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40, bottom: 30),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage('assets/image/profile.png'),
                    ),
                    SizedBox(height: 10),
                    Text(profile.nama),
                    Text(profile.nim),
                    Text(profile.prodi),
                    SizedBox(height: 20),
                    Card(
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
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(profile.bio, style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    MyKontak(profile: profile)
                  ],
                ),
              ),
            ],
          ),
        ),
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
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
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
