import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/database/database_helper.dart';
import 'package:tugass_fluterr/tugas13/model/model.dart';
import 'package:tugass_fluterr/tugas13/screen/tambahdata.dart';

Future<void> editSiswa(
  BuildContext context,
  List<StudentModel> siswaList,
  int index,
  Function() refreshState,
) async {
  // Kirim data StudentModel ke halaman TambahData
  final hasil = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TambahData(student: siswaList[index]),
    ),
  );

  // Setelah kembali dari halaman TambahData
  if (hasil != null && hasil is StudentModel) {
    await DatabaseHelper.instance.updateStudent(hasil); // Update di database
    refreshState(); // Refresh tampilan
  }
}

void deleteSiswa(
  BuildContext context,
  List<StudentModel> siswaList,
  int index,
  Function() refreshState,
) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance.deleteStudent(
                  siswaList[index].id!,
                ); // Hapus dari database
                refreshState(); // Refresh tampilan
                Navigator.pop(context);
              },
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}
