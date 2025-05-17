import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> fetchEpubBytes(int livreId) async {
  final response = await http
      .get(Uri.parse('http://localhost:3000/api/livres/$livreId/epub'));

  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception("Erreur de récupération de l'EPUB");
  }
}
