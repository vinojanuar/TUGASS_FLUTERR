import 'package:flutter/material.dart';
import 'package:tugass_fluterr/projectlatihan/pagess/add_pages.dart';
import 'package:tugass_fluterr/tugas13/screen/login.dart';
import 'package:tugass_fluterr/tugas13/screen/regis.dart';
import 'package:tugass_fluterr/tugas14/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {'/': (context) => const Navigator()},
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Siswa',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const Login_Screen(),
    );
  }
}
