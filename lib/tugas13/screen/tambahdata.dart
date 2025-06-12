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
<<<<<<< HEAD
  late TextEditingController nimController;
  late TextEditingController fakultasController;
=======
  late TextEditingController nisController;
  late TextEditingController kelasController;
>>>>>>> 00cef750c76d99ccfdfb9c89e67e04c2f646aadd

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.data?.nama ?? '');
<<<<<<< HEAD
    nimController = TextEditingController(text: widget.data?.nim ?? '');
    fakultasController = TextEditingController(
      text: widget.data?.fakultas ?? '',
    );
=======
    nisController = TextEditingController(text: widget.data?.nis ?? '');
    kelasController = TextEditingController(text: widget.data?.kelas ?? '');
  }

  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final siswa = StudentModel(
        id: widget.data?.id,
        nama: namaController.text,
        nis: nisController.text,
        kelas: kelasController.text,
      );

      if (widget.data == null) {
        await DatabaseHelper.instance.insertStudent(siswa);
      } else {
        await DatabaseHelper.instance.updateStudent(siswa);
      }

      Navigator.pop(context, true); // kirim sinyal ke HomeScreen untuk refresh
    }
>>>>>>> 00cef750c76d99ccfdfb9c89e67e04c2f646aadd
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
        title: Text(isEdit ? "Edit Data Siswa" : "Tambah Data Siswa"),
        backgroundColor: const Color.fromARGB(255, 185, 23, 91),
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
<<<<<<< HEAD
                controller: nimController,
=======
                controller: nisController,
>>>>>>> 00cef750c76d99ccfdfb9c89e67e04c2f646aadd
                decoration: const InputDecoration(labelText: "NIM"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
<<<<<<< HEAD
                controller: fakultasController,
                decoration: const InputDecoration(labelText: "Fakultas"),
=======
                controller: kelasController,
                decoration: const InputDecoration(labelText: "Kelas"),
>>>>>>> 00cef750c76d99ccfdfb9c89e67e04c2f646aadd
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 185, 23, 91),
                ),
                onPressed: _simpanData,
                child: Text(isEdit ? "Simpan Perubahan" : "Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
