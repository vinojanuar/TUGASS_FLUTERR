class StudentModel {
  final int? id;
  final String nama;
  final String nim;
  final String fakultas;

  StudentModel({
    this.id,
    required this.nama,
    required this.nim,
    required this.fakultas,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'nama': nama, 'nim': nim, 'fakultas': fakultas};
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      nama: map['nama'],
      nim: map['nim'],
      fakultas: map['fakultas'],
    );
  }
}
