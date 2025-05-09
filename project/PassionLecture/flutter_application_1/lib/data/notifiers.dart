import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);

class Livre {
  final int id;
  final String titre;
  final int anneeEdition;
  final String ecrivainNom;
  final String ecrivainPrenom;
  final String categorieNom;
  final String editeurNom;
  final double? moyenneAppreciation;

  const Livre({
    required this.id,
    required this.titre,
    required this.anneeEdition,
    required this.ecrivainNom,
    required this.ecrivainPrenom,
    required this.categorieNom,
    required this.editeurNom,
    this.moyenneAppreciation,
  });

  factory Livre.fromJson(Map<String, dynamic> json) {
    return Livre(
      id: json['livre_id'] as int,
      titre: json['titre'] as String,
      anneeEdition: json['annee_edition'] as int,
      ecrivainNom: json['ecrivain_nom'] as String,
      ecrivainPrenom: json['ecrivain_prenom'] as String,
      categorieNom: json['categorie_nom'] as String,
      editeurNom: json['editeur_nom'] as String,
      moyenneAppreciation: double.tryParse(json['moyenne_appreciation'] ?? ''),
    );
  }
}
