import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/screen/login.dart';
import 'package:tugass_fluterr/tugas15/api/user_api.dart';

class APIregisScreen extends StatefulWidget {
  const APIregisScreen({super.key});
  static const String id = "/Tugas6";

  @override
  State<APIregisScreen> createState() => _APIregisScreenState();
}

class _APIregisScreenState extends State<APIregisScreen> {
  final UserService userService = UserService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  void register() async {
    setState(() {
      isLoading = true;
    });
    final res = await userService.registerUser(
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
    );
    if (res["data"] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration succesful"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } else if (res["errors"] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Maaf, ${res["message"]}"),
          backgroundColor: Colors.amber,
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
      appBar: AppBar(
        backgroundColor: Color(0xffFAF7F0),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        centerTitle: true,
        title: Image.asset('assets/images/LOGO-UEU.webp', height: 50),
      ),
      backgroundColor: const Color(0xffFAF7F0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 16),
              const Text(
                "Data Mahasiswa",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please register your details to continue.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 32),
              const Text("Nama Lengkap"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration("Masukkan nama lengkap"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),

              const SizedBox(height: 20),
              const Text("Email"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration("Masukkan email aktif"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Email tidak boleh kosong' : null,
              ),

              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: _inputDecoration("Masukkan password").copyWith(
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
                        value!.length < 6
                            ? 'Password minimal 6 karakter'
                            : null,
              ),

              const SizedBox(height: 20),
              const Text("Konfirmasi Password"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirm,
                decoration: _inputDecoration("Ulangi password").copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirm ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirm = !_obscureConfirm;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Konfirmasi password wajib diisi';
                  if (value != _passwordController.text) {
                    return 'Password tidak sama';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Email: ${_emailController.text}");
                    print("Name: ${_nameController.text}");
                    print("Password: ${_passwordController.text}");
                    register();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD8D2C2),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Daftar Sekarang",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff4A4947),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Enter",
                      style: TextStyle(
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
}
