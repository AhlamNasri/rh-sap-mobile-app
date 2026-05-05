class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final UserInfo user;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token']?? '',
      refreshToken: json['refresh_token']?? '',
      tokenType: json['token_type']?? 'Bearer',
      user: UserInfo.fromJson(json['user']?? {}), // You can implement this based on your user data structure
    );
  }
}

class UserInfo {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String? avatar;
  final int? employeeId;

  UserInfo({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.avatar,
    this.employeeId,
  });

  String get fullName => '$firstName $lastName';
  bool get isAdmin => role == 'ADMIN' || role == 'HR_MANAGER';

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id']?? 0,
      email: json['email']?? '',
      firstName: json['first_name']?? '',
      lastName: json['last_name']?? '',
      role: json['role']?? '',
      avatar: json['avatar'],
      employeeId: json['employee_id'],
    );
  }

  Map<String, dynamic> toJson() =>{
    
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'avatar': avatar,
      'employee_id': employeeId,
    };
  }

