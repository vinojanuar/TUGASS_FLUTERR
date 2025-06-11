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
  late TextEditingController nisController;
  late TextEditingController kelasController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.data?.nama ?? '');
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
                controller: nisController,
                decoration: const InputDecoration(labelText: "NIM"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: kelasController,
                decoration: const InputDecoration(labelText: "Kelas"),
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
