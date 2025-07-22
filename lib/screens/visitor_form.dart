// visitor_form.dart

import 'package:flutter/material.dart';
import 'visitor_table.dart';
import 'db_helper.dart';

class VisitorForm extends StatefulWidget {
  @override
  _VisitorFormState createState() => _VisitorFormState();
}

class _VisitorFormState extends State<VisitorForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _purposeController = TextEditingController();

  void _saveVisitor() async {
    if (_formKey.currentState!.validate()) {
      final visitor = Visitor(
        name: _nameController.text,
        contact: _contactController.text,
        purpose: _purposeController.text,
        checkIn: DateTime.now().toIso8601String(),
      );

      await DBHelper().insertVisitor(visitor);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Visitor saved!')),
      );

      _nameController.clear();
      _contactController.clear();
      _purposeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Visitor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _purposeController,
                decoration: InputDecoration(labelText: 'Purpose'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveVisitor,
                child: Text('Check In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
