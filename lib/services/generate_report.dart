// generate_report.dart

import 'visitor_table.dart';
import 'db_helper.dart';

Future<String> generateVisitorReport() async {
  final visitors = await DBHelper().getVisitors();
  final buffer = StringBuffer();

  buffer.writeln('ID,Name,Contact,Purpose,Check-In,Check-Out');
  for (var v in visitors) {
    buffer.writeln(
      '${v.id},"${v.name}","${v.contact}","${v.purpose}","${v.checkIn}","${v.checkOut ?? 'Still inside'}"',
    );
  }

  return buffer.toString();
}
