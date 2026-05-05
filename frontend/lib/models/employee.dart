import 'dart:io';

class Employee {
  final int id;
  final String matricule;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String department;
  final String position;
  final String? managerId;
  final String? managerName;
  final DateTime hireDate;
  final String status;
  final String? avatar;
  final double? salary;
  final String? contactType;


  Employee({
    required this.id,
    required this.matricule,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.department,
    required this.position,
    this.managerId,
    this.managerName,
    required this.hireDate,
    required this.status,
    this.avatar,
    this.salary,
    this.contactType,
  });


  String get fullName => '$firstName $lastName';
  bool get isActive => status == 'ACTIVE';
  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id']?? 0,
      matricule: json['matricule']?? '',
      firstName: json['first_name']?? '',
      lastName: json['last_name']?? '',
      email: json['email']?? '',
      phone: json['phone'],
      department: json['department']?? '',
      position: json['position']?? '',
      managerId: json['manager_id'],
      managerName: json['manager_name'],
      hireDate: DateTime.parse(json['hire_date']?? DateTime.now().toIso8601String()),
      status: json['status']?? 'INACTIVE',
      avatar: json['avatar'],
      salary: json['salary'] != null ? (json['salary'] as num).toDouble() : null,
      contactType: json['contact_type'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'matricule': matricule,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone': phone,
    'department': department,
    'position': position,
    'manager_id': managerId,
    'manager_name': managerName,
    'hire_date': hireDate.toIso8601String(),
    'status': status,
    'avatar': avatar,
    'salary': salary,
    'contact_type': contactType,
  };
}