// save_report.dart

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'generate_report.dart';

Future<void> saveVisitorReportLocally() async {
  final report = await generateVisitorReport();
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/visitor_report.txt');
  await file.writeAsString(report);
}
