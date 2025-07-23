// generate_report.dart

import '../services/db_helper.dart';
import '../models/visitor.dart';

Future<String> generateVisitorReport() async {
  final visitors = await DBHelper().getVisitors();
  final buffer = StringBuffer();

  buffer.writeln('ID,Name,Contact,Purpose,Check-In,Check-Out');
  for (var v in visitors) {
    buffer.writeln(
      '${v.id},"${v.name}","${v.contact}","${v.purpose}","${v.checkIn}","${v.checkOut.isEmpty ? 'Still inside' : v.checkOut}"',
    );
  }

  return buffer.toString();
}
