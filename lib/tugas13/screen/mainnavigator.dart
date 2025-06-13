import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/screen/home.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeScreen(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Color(0xff3D3C42)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Color(0xff3D3C42)),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Center(
            child: Image.asset('assets/images/LOGO-UEU.webp', height: 100),
          ),
          Text(
            'Tentang Aplikasi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Aplikasi penginputan mahasiswa adalah perangkat lunak penting yang dirancang untuk menyederhanakan dan mengotomatisasi proses pencatatan data mahasiswa. Dengan aplikasi ini, institusi pendidikan dapat dengan mudah memasukkan, menyimpan, dan mengelola informasi penting seperti detail pribadi, riwayat akademik, dan status pembayaran. Ini membantu memastikan akurasi data, mengurangi kesalahan manual, dan memungkinkan akses cepat ke informasi yang diperlukan untuk berbagai keperluan administrasi dan pelaporan, membuat seluruh proses lebih efisien. ',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),

          SizedBox(height: 10),
          Text(' Pembuat Vino Januar', style: TextStyle(fontSize: 16)),

          SizedBox(height: 10),
          Text(' Versi: 1.0.0', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
