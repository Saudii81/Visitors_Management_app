class Visitor {
  final int? id;
  final String name;
  final String contact;
  final String purpose;
  final String checkIn;
  final String checkOut;

  Visitor({
    this.id,
    required this.name,
    required this.contact,
    required this.purpose,
    required this.checkIn,
    required this.checkOut,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
      'purpose': purpose,
      'checkIn': checkIn,
      'checkOut': checkOut,
    };
  }

  factory Visitor.fromMap(Map<String, dynamic> map) {
    return Visitor(
      id: map['id'],
      name: map['name'],
      contact: map['contact'],
      purpose: map['purpose'],
      checkIn: map['checkIn'],
      checkOut: map['checkOut'],
    );
  }
}
