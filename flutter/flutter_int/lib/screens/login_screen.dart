import 'package:flutter/material.dart';
import 'dart:async'; // For Timer

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _username = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Show SplashScreen programmatically
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(
            onSplashEnd: () {
              // Navigate to HomeScreen after SplashScreen
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your username' : null,
                onSaved: (value) => _username = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  final VoidCallback onSplashEnd;

  const SplashScreen({required this.onSplashEnd, super.key});

  @override
  Widget build(BuildContext context) {
    // Show splash for 3 seconds before calling onSplashEnd
    Timer(Duration(seconds: 3), onSplashEnd);

    return Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
