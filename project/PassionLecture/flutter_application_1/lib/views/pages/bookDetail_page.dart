import 'package:flutter/material.dart';
import 'package:namer_app/data/notifiers.dart';
import 'package:namer_app/views/pages/reading_page.dart';

class LivreDetail extends StatefulWidget {
  final Livre livre;

  const LivreDetail(this.livre, {super.key});

  @override
  State<LivreDetail> createState() => _LivreDetailState();
}

class _LivreDetailState extends State<LivreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Detail's Book of ${widget.livre.titre}"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  widget.livre.titre,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.black,
              onTap: () {
                print("Liree");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LivreEpub(widget.livre);
                    },
                  ),
                );
              },
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
