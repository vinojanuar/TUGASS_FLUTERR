import 'package:flutter/material.dart';

class TambahData extends StatefulWidget {
  final Map<String, dynamic>? data; // Tambahan

  const TambahData({super.key, this.data});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  late TextEditingController namaController;
  late TextEditingController NIMController;
  late TextEditingController FakultasController;
  late TextEditingController KaprodiController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.data?['nama'] ?? '');
    NIMController = TextEditingController(text: widget.data?['NIM'] ?? '');
    FakultasController = TextEditingController(
      text: widget.data?['fakultas']?.toString() ?? '',
    );
    KaprodiController = TextEditingController(
      text: widget.data?['kaprodi']?.toString() ?? '',
    );
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama Mahasiswa"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),

              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "NIM Mahasiswa"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: NIMController,
                decoration: const InputDecoration(labelText: "NIM"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: FakultasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Fakultas"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),

              TextFormField(
                controller: KaprodiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "kaprodi"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 185, 23, 91),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'nama': namaController.text,
                      'nama': NIMController.text,
                      'jurusan': FakultasController.text,
                      'kaprodi': int.tryParse(KaprodiController.text) ?? 0,
                    });
                  }
                },
                child: Text(isEdit ? "Simpan Perubahan" : "Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
