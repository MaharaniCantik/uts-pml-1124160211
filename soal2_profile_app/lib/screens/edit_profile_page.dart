import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soal2_profile_app/models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;
  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? _fotoProfil;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pilihFoto() async {
    final XFile? foto = await _picker.pickImage(source: ImageSource.gallery);

    if (foto != null) {
      setState(() {
        _fotoProfil = foto;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _editingController;
  late TextEditingController _emailController;
  late TextEditingController _noHpController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _kelasController;
  late TextEditingController _githubController;
  late TextEditingController _bioController;
  @override
  void initState() {
    super.initState();

    _editingController = TextEditingController(text: widget.profile.nama);
    _emailController = TextEditingController(text: widget.profile.email);
    _noHpController = TextEditingController(text: widget.profile.noHp);
    _nimController = TextEditingController(text: widget.profile.nim);
    _prodiController = TextEditingController(text: widget.profile.prodi);
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _githubController = TextEditingController(text: widget.profile.github);
    _bioController = TextEditingController(text: widget.profile.bio);
  }

  @override
  void dispose() {
    _editingController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _githubController.dispose();
    _bioController.dispose();

    super.dispose();
  }

  void _simpanProfile() {
    if (_formKey.currentState!.validate()) {
      final dataBaru = Profile(
        nama: _editingController.text,
        email: _emailController.text,
        noHp: _noHpController.text,
        nim: _nimController.text,
        prodi: _prodiController.text,
        kelas: _kelasController.text,
        github: _githubController.text,
        bio: _bioController.text,
        fotoProfil: _fotoProfil?.path ?? widget.profile.fotoProfil,
      );

      Navigator.pop(context, dataBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: _fotoProfil != null
                            ? FileImage(File(_fotoProfil!.path))
                            : const AssetImage('assets/image/profile.png')
                                  as ImageProvider,
                      ),
                      const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: _pilihFoto,
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Ganti Foto'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _editingController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama wajib diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }
                    if (!RegExp(
                      r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value.trim())) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _noHpController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor HP wajib diisi';
                    }
                    if (!RegExp(r'^\d{10,13}$').hasMatch(value)) {
                      return 'Nomor HP harus 10-13 digit';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'No Hp',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _nimController,
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _prodiController,
                  decoration: InputDecoration(
                    labelText: 'Prodi',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _kelasController,
                  decoration: InputDecoration(
                    labelText: 'Kelas',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _githubController,
                  decoration: InputDecoration(
                    labelText: 'Github',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _bioController,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _simpanProfile,
                    child: const Text('Simpan perubahan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
