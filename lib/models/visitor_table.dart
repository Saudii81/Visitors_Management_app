// visitor_table.dart

final String tableVisitor = 'visitors';
final String columnId = 'id';
final String columnName = 'name';
final String columnContact = 'contact';
final String columnPurpose = 'purpose';
final String columnCheckIn = 'check_in_time';
final String columnCheckOut = 'check_out_time';

class Visitor {
  int? id;
  String name;
  String contact;
  String purpose;
  String checkIn;
  String? checkOut;

  Visitor({
    this.id,
    required this.name,
    required this.contact,
    required this.purpose,
    required this.checkIn,
    this.checkOut,
  });

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnName: name,
      columnContact: contact,
      columnPurpose: purpose,
      columnCheckIn: checkIn,
      columnCheckOut: checkOut,
    };
  }

  Visitor.fromMap(Map<String, dynamic> map)
      : id = map[columnId],
        name = map[columnName],
        contact = map[columnContact],
        purpose = map[columnPurpose],
        checkIn = map[columnCheckIn],
        checkOut = map[columnCheckOut];
}
