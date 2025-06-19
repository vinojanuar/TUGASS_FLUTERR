import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugass_fluterr/tugas14/model/user_model.dart';

Future<List<Result>> getUsers() async {
  final response = await http.get(
    Uri.parse('https://rickandmortyapi.com/api/character'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)['results'];
    return userJson.map((json) => Result.fromJson(json)).toList();
  } else {
    throw Exception('Gagal memuat data');
  }
}
