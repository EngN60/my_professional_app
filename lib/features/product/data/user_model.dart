class UserModel {
  final int id;
  final String name;
  final String email;
  final String? token; // التوكن الذي سنستخدمه في العمليات اللاحقة

  UserModel({required this.id, required this.name, required this.email, this.token});

  // وظيفة لتحويل الـ JSON القادم من Laravel إلى كائن (Object)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}