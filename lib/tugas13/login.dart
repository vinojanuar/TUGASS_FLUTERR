import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/regis.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = "/Tugas6";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
            const Text(
              "Data Siswa PPKD Jakpus",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            const Text(
              "Sign In to your Account",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            // Input NIM
            const SizedBox(height: 40),
            const Text("NIM (nomor induk siswa)"),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Masukan NIM anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            // Input Password
            const SizedBox(height: 20),
            const Text("Password"),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            // Tombol Request OTP
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const TugasSatu()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff21BDCA),
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
                  color: Colors.white,
                ),
              ),
            ),

            // Teks tambahan
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(color: const Color.fromARGB(255, 70, 69, 69)),
                ),
                Expanded(
                  child: Text(
                    "Or Sign In With",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Divider(color: const Color.fromARGB(255, 74, 73, 73)),
                ),
              ],
            ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 155,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 223, 223),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Image.asset(
                          "assets/images/iconGoogle.png",
                          width: 16,
                          height: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 155,
                  height: 48,

                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 223, 223),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Image.asset(
                          "assets/images/Logofb.png",
                          width: 16,
                          height: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        builder: (context) => const RegisScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff21BDCA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
