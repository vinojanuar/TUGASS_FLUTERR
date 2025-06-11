class StudentModel {
  final int? id;
  final String nama;
  final String nis;
  final String kelas;

  StudentModel({
    this.id,
    required this.nama,
    required this.nis,
    required this.kelas,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'nama': nama, 'nis': nis, 'kelas': kelas};
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      nama: map['nama'],
      nis: map['nis'],
      kelas: map['kelas'],
    );
  }
}
