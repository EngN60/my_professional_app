import 'package:my_professional_app/features/product/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
// import 'views/login_screen.dart'; // استدعاء صفحة اللوجن من مكانها الجديد

void main() {
  runApp(const EstateApp());
}

class EstateApp extends StatelessWidget {
  const EstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // الصفحة التي نقلناها لمجلد views
    );
  }
}