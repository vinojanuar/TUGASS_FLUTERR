import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/database/database_helper.dart';
import 'package:tugass_fluterr/tugas13/model/model.dart';

class TambahData extends StatefulWidget {
  final StudentModel? data;

  const TambahData({super.key, this.data});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController fakultasController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.data?.nama ?? '');
    nimController = TextEditingController(text: widget.data?.nim ?? '');
    fakultasController = TextEditingController(
      text: widget.data?.fakultas ?? '',
    );
  }

  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final siswa = StudentModel(
        id: widget.data?.id,
        nama: namaController.text,
        nim: nimController.text,
        fakultas: fakultasController.text,
      );

      if (widget.data == null) {
        await DatabaseHelper.instance.insertStudent(siswa);
      } else {
        await DatabaseHelper.instance.updateStudent(siswa);
      }

      Navigator.pop(context, true); // kirim sinyal ke HomeScreen untuk refresh
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.data != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Data Siswa" : "Tambah Data Mahasiswa"),
        backgroundColor: const Color(0xffD8D2C2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(labelText: "NIM"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: fakultasController,
                decoration: const InputDecoration(labelText: "Fakultas"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD8D2C2),
                ),
                onPressed: _simpanData,
                child: Text(
                  isEdit ? "Simpan Perubahan" : "Simpan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
