import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Login'),
        backgroundColor: Color(0xFF047857),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Contoh: user@example.com',
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Color(0xFF047857)),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF009688)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF009688)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Contoh: admin1234',
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Color(0xFF047857)),
                  prefixIcon: Icon(
                    Icons.lock_person_rounded,
                    color: Color(0xFF009688),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF009688)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF047857),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                ),
                onPressed: () {
                  print('klik');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
