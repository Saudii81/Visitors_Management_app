// visitor_list.dart

import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'visitor_table.dart';

class VisitorList extends StatefulWidget {
  @override
  _VisitorListState createState() => _VisitorListState();
}

class _VisitorListState extends State<VisitorList> {
  List<Visitor> _visitors = [];

  void _loadVisitors() async {
    final visitors = await DBHelper().getVisitors();
    setState(() {
      _visitors = visitors;
    });
  }

  void _checkOutVisitor(Visitor visitor) async {
    visitor.checkOut = DateTime.now().toIso8601String();
    await DBHelper().updateVisitor(visitor);
    _loadVisitors();
  }

  @override
  void initState() {
    super.initState();
    _loadVisitors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visitor List')),
      body: ListView.builder(
        itemCount: _visitors.length,
        itemBuilder: (context, index) {
          final visitor = _visitors[index];
          return Card(
            child: ListTile(
              title: Text(visitor.name),
              subtitle: Text('Purpose: ${visitor.purpose}\n'
                  'Check-In: ${visitor.checkIn}\n'
                  'Check-Out: ${visitor.checkOut ?? 'Still inside'}'),
              trailing: visitor.checkOut == null
                  ? IconButton(
                      icon: Icon(Icons.exit_to_app),
                      onPressed: () => _checkOutVisitor(visitor),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
