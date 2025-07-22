// admin_login.dart

import 'package:flutter/material.dart';
import 'main_dashboard.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _validateLogin() {
    // Replace these with your actual admin credentials
    const adminUser = 'admin';
    const adminPass = 'visitor123';

    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == adminUser &&
          _passwordController.text == adminPass) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MainDashboard()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (val) => val!.isEmpty ? 'Enter username' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) => val!.isEmpty ? 'Enter password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateLogin,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
