import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:namer_app/data/notifiers.dart';

Future<List<Livre>> fetchLivre() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/api/livres'));
  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
    final jsonBody = jsonDecode(response.body);
    final List<dynamic> data = jsonBody['data'];
    return data.map((json) => Livre.fromJson(json)).toList();
  } else {
    throw Exception('failed to load livres');
  }
}
