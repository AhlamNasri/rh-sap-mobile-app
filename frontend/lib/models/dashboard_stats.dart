class DashboardStats {
  final int totalEmployees;
  final int presentToday;
  final int onleave;
  final int openPositions;
  final double attendanceRate;
  final List<MonthlyAttendance> monthlyAttendance;
  final List<DepartmentStat> departmentStats;
  final List<RecentActivity> recentActivities;

  DashboardStats({
    required this.totalEmployees,
    required this.presentToday,
    required this.onleave,
    required this.openPositions,
    required this.attendanceRate,
    required this.monthlyAttendance,
    required this.departmentStats,
    required this.recentActivities,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      totalEmployees: json['total_employees']?? 0,
      presentToday: json['present_today']?? 0,
      onleave: json['onleave']?? 0,
      openPositions: json['open_positions']?? 0,
      attendanceRate: json['attendance_rate'] != null ? (json['attendance_rate'] as num).toDouble() : 0.0,
      monthlyAttendance: (json['monthly_attendance'] as List<dynamic>?)
              ?.map((e) => MonthlyAttendance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      departmentStats: (json['department_stats'] as List<dynamic>?)
              ?.map((e) => DepartmentStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      recentActivities: (json['recent_activities'] as List<dynamic>?)
              ?.map((e) => RecentActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  static DashboardStats mock(){
    return DashboardStats(
      totalEmployees: 248,
      presentToday: 201,
      onleave: 14,
      openPositions: 7,
      attendanceRate: 80.0,
      monthlyAttendance: [
        MonthlyAttendance(month: 'January', present: 185, absent: 15),
        MonthlyAttendance(month: 'February', present: 190, absent: 10),
        MonthlyAttendance(month: 'March', present: 195, absent: 5),
        MonthlyAttendance(month: 'April', present: 200, absent: 0),
        MonthlyAttendance(month: 'May', present: 205, absent: 5),
        MonthlyAttendance(month: 'June', present: 210, absent: 10),
      ],
      departmentStats: [
        DepartmentStat(name: 'IT', count: 45),
        DepartmentStat(name: 'Finance', count: 32),
        DepartmentStat(name: 'RH', count: 18),
        DepartmentStat(name: 'Commercial', count: 67),
        DepartmentStat(name: 'Production', count: 86),
      ],
      recentActivities: [
        RecentActivity(
          title: 'Nouvelle demande de congé',
          subtitle: 'Ahmed Benali - 5 jours',
          time: DateTime.now().subtract(const Duration(minutes: 15)),
          type: 'leave',
        ),
        RecentActivity(
          title: 'Pointage effectué',
          subtitle: 'Sara Alaoui - 08:32',
          time: DateTime.now().subtract(const Duration(hours: 1)),
          type: 'attendance',
        ),
        RecentActivity(
          title: 'Nouveau recrutement',
          subtitle: 'Développeur Flutter - IT',
          time: DateTime.now().subtract(const Duration(hours: 3)),
          type: 'recruitment',
        ),
      ],
    );
  }
}

class MonthlyAttendance {
  final String month;
  final int present;
  final int absent;

  MonthlyAttendance({
    required this.month,
    required this.present,
    required this.absent,
  });

  factory MonthlyAttendance.fromJson(Map<String, dynamic> json) {
    return MonthlyAttendance(
      month: json['month']?? '',
      present: json['present']?? 0,
      absent: json['absent']?? 0,
    );
  }
}

class DepartmentStat {
  final String name;
  final int count;

  DepartmentStat({
    required this.name,
    required this.count,
  });

  factory DepartmentStat.fromJson(Map<String, dynamic> json) {
    return DepartmentStat(
      name: json['name']?? '',
      count: json['count']?? 0,
    );
  }
}

class RecentActivity {
  final String title;
  final String subtitle;
  final DateTime time;
  final String type;

  RecentActivity({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
  });

  factory RecentActivity.fromJson(Map<String, dynamic> json) {
    return RecentActivity(
      title: json['title']?? '',
      subtitle: json['subtitle']?? '',
      time: DateTime.parse(json['time']?? DateTime.now().toIso8601String()),
      type: json['type']?? 'general',
    );
  }
}