import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas14/view/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Siswa',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const UserListScreen(), // Ganti sesuai kebutuhan Anda
      // home: const AddPages(), // Aktifkan ini jika ingin langsung ke halaman Add
    );
  }
}
