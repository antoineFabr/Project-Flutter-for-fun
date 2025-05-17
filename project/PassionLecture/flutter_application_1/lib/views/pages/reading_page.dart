import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/data/notifiers.dart';

import 'package:http/http.dart' as http;

class LivreEpub extends StatefulWidget {
  final Livre livre;
  const LivreEpub(this.livre, {super.key});

  @override
  State<LivreEpub> createState() => _LivreEpubState();
}

class _LivreEpubState extends State<LivreEpub> {
  EpubController? _epubController;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadEpub();
  }

  Future<void> _loadEpub() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/api/livres/${widget.livre.id}/epub'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _epubController = EpubController(
            document: EpubDocument.openData(response.bodyBytes),
          );
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _epubController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Scaffold(
        appBar: AppBar(title: const Text("Erreur")),
        body: const Center(child: Text("Impossible de charger le livre.")),
      );
    }

    if (_isLoading || _epubController == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Chargement")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livre.titre),
      ),
      body: EpubView(
        controller: _epubController!,
      ),
    );
  }
}
