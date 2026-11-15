import 'package:flutter/material.dart';

class MyHobby extends StatelessWidget {
  const MyHobby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tentang saya')),
      body: ListView(
        children: [
          Text('Keahlian & Hobby'),
          Card(
            child: Column(
              children: [
                InfoTile(icon: Icons.code, label: 'Aplikasi', value: 'apayah'),
                InfoTile(
                  icon: Icons.sports_gymnastics,
                  label: 'Taekwondo',
                  value: 'Kyurigi',
                ),
                InfoTile(
                  icon: Icons.extension,
                  label: 'Problem Solving',
                  value: 'isi aja dh',
                ),
              ],
            ),
          ),
          Text('Riwayat Pendidikan'),
          Card(child: Column(
            children: [
              InfoTile(icon: Icons.account_balance_rounded, label: 'SMP', value: 'SMPN 1 CURUG'),
              InfoTile(icon: Icons.apartment_outlined, label: 'SMA', value: 'SMAN 11 TANGERANG'),
              InfoTile(icon: Icons.business_sharp, label: 'College', value: 'Global Intitute'),
            ],
          )),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
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
