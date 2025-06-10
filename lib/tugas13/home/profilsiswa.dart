import 'package:flutter/material.dart';

class ProfilSiswa extends StatefulWidget {
  const ProfilSiswa({super.key});

  @override
  State<ProfilSiswa> createState() => _ProfilSiswaState();
}

class _ProfilSiswaState extends State<ProfilSiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Siswa"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/fotopass2.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              "Nama Lengkap Siswa",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
