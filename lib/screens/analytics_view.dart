// analytics_view.dart

import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'visitor_table.dart';

class AnalyticsView extends StatefulWidget {
  @override
  _AnalyticsViewState createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  int totalVisitors = 0;
  int visitorsOnSite = 0;
  Map<String, int> purposeCount = {};

  void _loadAnalytics() async {
    final visitors = await DBHelper().getVisitors();

    totalVisitors = visitors.length;
    visitorsOnSite = visitors.where((v) => v.checkOut == null).length;

    purposeCount.clear();
    for (var visitor in visitors) {
      final purpose = visitor.purpose;
      purposeCount[purpose] = (purposeCount[purpose] ?? 0) + 1;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visitor Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('📌 Total Visitors: $totalVisitors'),
            Text('🚪 Currently On-Site: $visitorsOnSite'),
            SizedBox(height: 20),
            Text('🎯 Most Common Purposes:'),
            ...purposeCount.entries.map((e) => Text('${e.key}: ${e.value}')),
          ],
        ),
      ),
    );
  }
}
