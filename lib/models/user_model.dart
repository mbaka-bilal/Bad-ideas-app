class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;
  final String accessToken;
  final String refreshToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool deactivated;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.accessToken,
    required this.refreshToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deactivated = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      password: json['password'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      deactivated: json['deactivated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'password': password,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'deactivated': deactivated,
    };
  }
}
