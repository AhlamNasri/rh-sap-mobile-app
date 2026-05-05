class JobPosting {
  final int id;
  final String title;
  final String department;
  final String location;
  final String contractType;
  final String description;
  final String requirements;
  final String status;
  final DateTime publishedAt;
  final DateTime? closingDate;
  final int applicationsCount;

  JobPosting({
    required this.id,
    required this.title,
    required this.department,
    required this.location,
    required this.contractType,
    required this.description,
    required this.requirements,
    required this.status,
    required this.publishedAt,
    this.closingDate,
    required this.applicationsCount,
  });

  bool get isOpen => status == 'OPEN';

  factory JobPosting.fromJson(Map<String, dynamic> json) {
    return JobPosting(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      department: json['department'] ?? '',
      location: json['location'] ?? '',
      contractType: json['contractType'] ?? 'CDI',
      description: json['description'] ?? '',
      requirements: json['requirements'] ?? '',
      status: json['status'] ?? 'OPEN',
      publishedAt: DateTime.parse(json['publishedAt'] ?? DateTime.now().toIso8601String()),
      closingDate: json['closingDate'] != null ? DateTime.parse(json['closingDate']) : null,
      applicationsCount: json['applicationsCount'] ?? 0,
    );
  }
}