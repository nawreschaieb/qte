// ignore_for_file: public_member_api_docs, sort_constructors_first

/*import 'package:flutter/foundation.dart';*/

class Utilisateur {
  String? nom;
  double? mesure;
  String? email;
  String? password;
  String? uid;
  //String? nom;
  Utilisateur({
    this.mesure,
    this.nom,
    this.email,
    this.password,
    this.uid,
  });
  Map<String, dynamic> toJson() {
    return {
      // 'mesure': mesure,
      'id': uid,
      'password': password,
      'email': email,
    };
  }

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
        // mesure: json['mesure'],
        uid: json['id'],
        email: json['email'],
        password: json['password'],
        nom: json['nom'],
        mesure: json['mesure']);
  }
}


/*class DataBase {
  final String? uid;
  final String email;
  final double? mesure;
  final String nom;
  DataBase({
    required this.nom,
    this.uid,
    required this.email,
    this.mesure,
  });
}
*/