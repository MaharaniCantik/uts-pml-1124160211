import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _mesagge = '';

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    setState(() {
      if (email == 'raniKusuma@gmail.com' && password == 'rani123') {
        _mesagge = 'Login berhasil!';
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
                                  !value.contains(',')) {
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
                            onPressed: _login,
                            child: Text('Login'),
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
