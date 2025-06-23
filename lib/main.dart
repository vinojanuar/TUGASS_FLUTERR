import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas15/view/login_screen.dart';

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
      home: const APILoginscreen(),
    );
  }
}
