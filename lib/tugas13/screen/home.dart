import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/database/database_helper.dart';
import 'package:tugass_fluterr/tugas13/model/model.dart';
import 'package:tugass_fluterr/tugas13/screen/tambahdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentModel> siswaList = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final data = await DatabaseHelper.instance.getStudents();
    setState(() {
      siswaList = data;
    });
  }

  void _showDeleteConfirmation(StudentModel siswa) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Hapus Data"),
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              TextButton(
                onPressed: () async {
                  await DatabaseHelper.instance.deleteStudent(siswa.id!);
                  Navigator.pop(context);
                  fetchStudents(); // refresh list
                },
                child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  Future<void> _navigateToTambahData({StudentModel? siswa}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TambahData(data: siswa)),
    );

    if (result == true) {
      fetchStudents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 23, 91),
        title: const Text(
          "Data Mahasiswa",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:
          siswaList.isEmpty
              ? const Center(child: Text("Belum ada Data Mahasiswa."))
              : ListView.builder(
                itemCount: siswaList.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final siswa = siswaList[index];
                  final inisial =
                      siswa.nama.isNotEmpty ? siswa.nama[0].toUpperCase() : '?';

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
                        siswa.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'NIM: ${siswa.nim}\nFakultas: ${siswa.fakultas}',
                        style: const TextStyle(height: 1.5),
                      ),
                      isThreeLine: true,
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed:
                                () => _navigateToTambahData(siswa: siswa),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _showDeleteConfirmation(siswa),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 185, 23, 91),
        onPressed: () => _navigateToTambahData(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
