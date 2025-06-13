import 'package:flutter/material.dart';

class AddPages extends StatefulWidget {
  const AddPages({super.key});

  @override
  State<AddPages> createState() => _AddPagesState();
}

class _AddPagesState extends State<AddPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        centerTitle: true,
        title: Text(
          'Vino',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffDFD0B8),
          ),
        ),
      ),

      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Perfect Shoes",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(height: 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("For Perfect style", style: TextStyle(fontSize: 17)),
          ),

          Row(
            children: [
              //Container 1
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffDFD0B8),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        "Barang 1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              //Container 2
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffDFD0B8),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    height: 50,
                    width: 20,
                    child: Center(
                      child: Text(
                        "Barang 1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
