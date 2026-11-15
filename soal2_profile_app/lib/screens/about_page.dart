import 'package:flutter/material.dart';

class MyHobby extends StatelessWidget {
  const MyHobby({super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang saya'),
        backgroundColor: warna.primary,
        foregroundColor: warna.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Keahlian & Hobby',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: warna.primary,
            ),
          ),
          SizedBox(height: 12),
          Card(
            color: Theme.of(context).cardColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
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
          SizedBox(height: 28),
          Text(
            'Riwayat Pendidikan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: warna.primary,
            ),
          ),
          Card(
            color: Theme.of(context).cardColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                InfoTile(
                  icon: Icons.account_balance_rounded,
                  label: 'SMP',
                  value: 'SMPN 1 CURUG',
                ),
                InfoTile(
                  icon: Icons.apartment_outlined,
                  label: 'SMA',
                  value: 'SMAN 11 TANGERANG',
                ),
                InfoTile(
                  icon: Icons.business_sharp,
                  label: 'College',
                  value: 'Global Intitute',
                ),
              ],
            ),
          ),
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
