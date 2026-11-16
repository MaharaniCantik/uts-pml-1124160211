import 'package:flutter/material.dart';
import 'package:soal2_profile_app/models/profile.dart';
import 'package:soal2_profile_app/widgets/info_row.dart';

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
