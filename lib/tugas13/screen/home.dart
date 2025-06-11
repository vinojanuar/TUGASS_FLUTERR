import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/screen/editdelete.dart';
import 'package:tugass_fluterr/tugas13/screen/tambahdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> siswaList = [
    {'nama': 'Andi Pratama', 'jurusan': 'IPA', 'tahunLulus': 2023},
  ];

  void refresh() {
    setState(() {});
  }

  Future<void> _navigateToTambahData() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TambahData()),
    );

    if (hasil != null && hasil is Map<String, dynamic>) {
      setState(() {
        siswaList.add(hasil);
      });
    }
  }

  void _konfirmasiHapus(int index) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Hapus Data"),
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              TextButton(
                child: const Text("Batal"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Hapus", style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                  deleteSiswa(context, siswaList, index, refresh);
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 23, 91),
        title: const Text(
          "Data Siswa",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:
          siswaList.isEmpty
              ? const Center(
                child: Text(
                  "Belum ada data siswa.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: siswaList.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final siswa = siswaList[index];
                  final nama = siswa['nama'];
                  final inisial = nama.isNotEmpty ? nama[0].toUpperCase() : '?';

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink.shade100,
                        child: Text(
                          inisial,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Jurusan: ${siswa['jurusan']}\nTahun Lulus: ${siswa['tahunLulus']}',
                        style: const TextStyle(height: 1.5),
                      ),
                      isThreeLine: true,
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed:
                                () => editSiswa(
                                  context,
                                  siswaList,
                                  index,
                                  refresh,
                                ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _konfirmasiHapus(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 185, 23, 91),
        onPressed: _navigateToTambahData,
        child: const Icon(Icons.add),
      ),
    );
  }
}
