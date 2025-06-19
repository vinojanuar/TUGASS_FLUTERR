import 'package:flutter/material.dart';

class AddPages extends StatefulWidget {
  const AddPages({super.key});

  @override
  State<AddPages> createState() => _AddPagesState();
}

class _AddPagesState extends State<AddPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildbackground(), buildLayer()]));
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Text("Login to your Acces Account"),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField()

  Container buildbackground() {
    return Container(
      color: const Color.fromARGB(255, 255, 253, 253),
      width: 812,
      height: 812,
    );
  }


}
