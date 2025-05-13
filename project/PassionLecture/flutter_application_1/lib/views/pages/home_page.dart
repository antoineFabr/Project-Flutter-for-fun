import 'package:flutter/material.dart';
import 'package:namer_app/data/notifiers.dart';
import 'package:namer_app/services/getLivre.dart';
import 'package:namer_app/views/pages/bookDetail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Livre>> futureLivres;
  String? menuItem;
  @override
  void initState() {
    super.initState();
    futureLivres = fetchLivre();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Livre>>(
      future: futureLivres,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erreur ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Aucun livre dispo'),
          );
        } else {
          List<Livre> livres = snapshot.data!;
          return Column(
            children: [
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(
                    value: 'e1',
                    child: Text('Element 1'),
                  ),
                  DropdownMenuItem(
                    value: 'e2',
                    child: Text('Element 2'),
                  ),
                  DropdownMenuItem(
                    value: 'e3',
                    child: Text('Element 3'),
                  ),
                  DropdownMenuItem(
                    value: 'e4',
                    child: Text('Element 4'),
                  ),
                ],
                onChanged: (String? value) {
                  setState(
                    () {
                      menuItem = value;
                    },
                  );
                },
              ),
              ListView.builder(
                itemCount: livres.length,
                itemBuilder: (context, index) {
                  final livre = livres[index];
                  return InkWell(
                    splashColor: Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LivreDetail(livre);
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(livre.titre),
                      subtitle:
                          Text('${livre.ecrivainPrenom} ${livre.ecrivainNom}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(livre.moyenneAppreciation?.toStringAsFixed(2) ??
                              'N/A'),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}
