import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugass_fluterr/tugas15/api/user_api.dart';
import 'package:tugass_fluterr/tugas15/view/home_screen.dart';
import 'package:tugass_fluterr/tugas15/view/regis_screen.dart';

class APILoginscreen extends StatefulWidget {
  const APILoginscreen({super.key});
  static const String id = "/Tugas6";

  @override
  State<APILoginscreen> createState() => _APILoginscreenState();
}

class _APILoginscreenState extends State<APILoginscreen> {
  final UserService userService = UserService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  final bool _obscureConfirm = true;

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });
    final res = await userService.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (res["data"] != null && res["data"]["token"] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", res["data"]["token"]);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Berhasil Login"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProfileUserScreen()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Gagal Login, ${res["message"] ?? "Terjadi Kesalahan"}",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF7F0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            children: [
              const SizedBox(height: 36),

              Center(
                child: Image.asset('assets/images/LOGO-UEU.webp', height: 100),
              ),
              const Text(
                "Data Mahasiswa",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              const Text(
                "Sign In to your Account",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 40),
              const Text("Email"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration("Masukkan email anda"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Email tidak boleh kosong' : null,
              ),

              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: _inputDecoration("Masukkan password anda").copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Password tidak boleh kosong' : null,
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD8D2C2),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Color(0xff4A4947),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider(color: Colors.black38)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or Sign In With",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.black38)),
                ],
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _socialButton("assets/images/iconGoogle.png", "Google"),
                  _socialButton("assets/images/Logofb.png", "Facebook"),
                ],
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const APIregisScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff4A4947),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      labelStyle: TextStyle(color: Colors.black),
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _socialButton(String assetPath, String label) {
    return Container(
      width: 155,
      height: 48,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 223, 223),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 16, height: 16),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
