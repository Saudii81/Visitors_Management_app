// main_dashboard.dart

import 'package:flutter/material.dart';
import 'visitor_form.dart';
import 'visitor_list.dart';

class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visitor Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.person_add),
              label: Text('Register Visitor'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VisitorForm()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.list),
              label: Text('View Visitor List'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VisitorList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
