import 'package:flutter/material.dart';
import 'package:soal2_profile_app/models/profile.dart';
import 'package:soal2_profile_app/screens/profile_page.dart';

class LoginPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const LoginPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _mesagge = '';

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await Future.delayed(Duration(seconds: 5));
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final dataBaru = Profile(
      nama: 'Rani Kusuma',
      nim: '1124160211',
      prodi: 'Teknik Informatika',
      kelas: 'TI24PSE1',
      email: 'raniKusuma@gmail.com',
      noHp: '08123456789',
      github: 'maharaniCantik',
      bio:
          'Saya mahasiswa Teknik informatika semester 5, dengan konsentrasi sotfware engineering',
    );
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      if (email == 'raniKusuma@gmail.com' && password == 'rani123') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              profile: dataBaru,
              isDarkMode: widget.isDarkMode,
              onThemeChanged: widget.onThemeChanged,

            ),
          ),
        );
      } else {
        _mesagge = 'Email atau password salah';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Login'),
        backgroundColor: Color(0xFF047857),
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Color(0xFF009688),
                            child: Icon(
                              Icons.person,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              if (!value.contains('@') ||
                                  !value.contains('.')) {
                                return 'Format email tidak valid';
                              }
                              return null;
                            },

                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'Contoh: user@example.com',
                              hintStyle: TextStyle(color: Colors.grey),

                              floatingLabelStyle: TextStyle(
                                color: Color(0xFF047857),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF009688),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFF009688),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }
                              if (value.length < 6) {
                                return 'Password minimal 6 karakter';
                              }
                              return null;
                            },
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'Contoh: admin1234',
                              hintStyle: TextStyle(color: Colors.grey),
                              floatingLabelStyle: TextStyle(
                                color: Color(0xFF047857),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_person_rounded,
                                color: Color(0xFF009688),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFF009688),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF047857),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 100,
                              ),
                            ),
                            onPressed: _isLoading ? null : _login,
                            child: _isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text('Login'),
                          ),
                          Text(
                            _mesagge,
                            style: TextStyle(
                              color: _mesagge == 'Login berhasil!'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
