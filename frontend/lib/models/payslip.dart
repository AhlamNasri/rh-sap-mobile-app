class Payslip {
  final int id;
  final int employeeId;
  final String employeeName;
  final String period; // e.g. "2024-01"
  final double grossSalary;
  final double netSalary;
  final double socialContributions;
  final double incomeTax;
  final double bonuses;
  final double deductions;
  final DateTime paymentDate;
  final String status;
  final String? pdfUrl;

  Payslip({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.period,
    required this.grossSalary,
    required this.netSalary,
    required this.socialContributions,
    required this.incomeTax,
    required this.bonuses,
    required this.deductions,
    required this.paymentDate,
    required this.status,
    this.pdfUrl,
  });

  factory Payslip.fromJson(Map<String, dynamic> json) {
    return Payslip(
      id: json['id'] ?? 0,
      employeeId: json['employeeId'] ?? 0,
      employeeName: json['employeeName'] ?? '',
      period: json['period'] ?? '',
      grossSalary: (json['grossSalary'] ?? 0).toDouble(),
      netSalary: (json['netSalary'] ?? 0).toDouble(),
      socialContributions: (json['socialContributions'] ?? 0).toDouble(),
      incomeTax: (json['incomeTax'] ?? 0).toDouble(),
      bonuses: (json['bonuses'] ?? 0).toDouble(),
      deductions: (json['deductions'] ?? 0).toDouble(),
      paymentDate: DateTime.parse(json['paymentDate'] ?? DateTime.now().toIso8601String()),
      status: json['status'] ?? 'PAID',
      pdfUrl: json['pdfUrl'],
    );
  }
}