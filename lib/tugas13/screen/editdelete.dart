import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas13/screen/tambahdata.dart';

Future<void> editSiswa(
  BuildContext context,
  List<Map<String, dynamic>> siswaList,
  int index,
  Function() refreshState,
) async {
  final hasil = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TambahData(data: siswaList[index])),
  );

  if (hasil != null && hasil is Map<String, dynamic>) {
    siswaList[index] = hasil;
    refreshState();
  }
}

void deleteSiswa(
  BuildContext context,
  List<Map<String, dynamic>> siswaList,
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
              onPressed: () {
                siswaList.removeAt(index);
                refreshState();
                Navigator.pop(context);
              },
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}
