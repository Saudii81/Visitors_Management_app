// share_report.dart

import 'package:share_plus/share_plus.dart';
import 'generate_report.dart';

void shareVisitorReport() async {
  final report = await generateVisitorReport();
  Share.share(report, subject: 'Visitor Report');
}
