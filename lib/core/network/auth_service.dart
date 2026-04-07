import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // استبدل هذا برابط الـ API الخاص بـ Laravel لاحقاً
  final String baseUrl = "https://your-laravel-api.com/api";

  // Future<bool> login(String email, String password) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("$baseUrl/login"),
  //       body: {'email': email, 'password': password},
  //     );

  //     if (response.statusCode == 200) {
  //       // إذا نجح تسجيل الدخول في Laravel
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //     return false;
  //   }
  // }
  Future<bool> login(String email, String password) async {
  await Future.delayed(const Duration(seconds: 2)); // محاكاة وقت الانتظار
  return true; // نجعلها تنجح دائماً للتجربة
}
}