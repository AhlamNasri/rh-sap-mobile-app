class Attendance {
  final int id;
  final int employeeId;
  final String employeeName;
  final DateTime date;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final String status;
  final String? notes;
  final double? workedHours;

  Attendance({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.date,
    this.checkIn,
    this.checkOut,
    required this.status,
    this.notes,
    this.workedHours,
  });

  bool get isPresent => status == 'PRESENT';
  bool get isAbsent => status == 'ABSENT';
  bool get isLate => status == 'LATE';


  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id']?? 0,
      employeeId: json['employee_id']?? 0,
      employeeName: json['employee_name']?? '',
      date: DateTime.parse(json['date']?? DateTime.now().toIso8601String()),
      checkIn: json['check_in'] != null ? DateTime.parse(json['check_in']) : null,
      checkOut: json['check_out'] != null ? DateTime.parse(json['check_out']) : null,
      status: json['status']?? 'ABSENT',
      notes: json['notes'],
      workedHours: json['worked_hours'] != null ? (json['worked_hours'] as num).toDouble() : null,
    );
  }
}