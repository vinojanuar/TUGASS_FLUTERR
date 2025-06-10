import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 23, 91),
        title: const Text(
          "Data Siswa",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text(
          "Selamat datang di HomeScreen!",
          style: TextStyle(fontSize: 16),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // untuk header menempel ke atas
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xffC6E7FF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profil.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nama Pengguna',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('email@example.com'),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Profile Siswa'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),

            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Nilai Siswa'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),

            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Jadwal'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),

            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Absensi'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),

            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
