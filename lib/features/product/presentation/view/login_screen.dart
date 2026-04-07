import 'package:my_professional_app/features/product/presentation/view/dashboard_screen.dart';

import '../../../../core/network/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. التعريفات (الموجودة مسبقاً)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 2. أضف هذا السطر هنا (تعريف الخدمة)
  final AuthService _authService = AuthService();

  // 3. أضف الدالة (Function) هنا
  void _handleLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى ملء جميع الحقول")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    bool success = await _authService.login(email, password);

    if (!mounted) return; // تأكد أن الصفحة لا تزال موجودة
    Navigator.pop(context); 

    if (success) {
  // الانتقال لشاشة الـ Dashboard
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const DashboardScreen()),
  );
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // التصميم العلوي (Header)
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1A237E), Color(0xFF3F51B5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.home_work_rounded, size: 90, color: Colors.white),
                    const SizedBox(height: 15),
                    Text(
                      "ايوان للعقارات",
                      style: GoogleFonts.almarai(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "مرحباً بك مجدداً!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  
                  // حقل البريد الإلكتروني
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF1A237E)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // حقل كلمة المرور
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF1A237E)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                 // زر تسجيل الدخول
SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    onPressed: _handleLogin, // <--- هنا قمنا بالربط مع الدالة البرمجية
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1A237E),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    child: const Text("تسجيل الدخول", style: TextStyle(fontSize: 18)),
  ),
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}