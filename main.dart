import 'package:flutter_application_7/accueil.dart';
import 'package:flutter_application_7/ajouteraliment/ajouteraliment.dart';
import 'package:flutter_application_7/mekla/mekla.dart';
import 'package:flutter_application_7/pain.dart';
import 'package:flutter_application_7/patisserie.dart';
import 'package:flutter_application_7/laitages.dart';
import 'package:flutter_application_7/assaisonnements_condiments.dart';
import 'package:flutter_application_7/boisson_sucre.dart';
import 'package:flutter_application_7/boisson_alcool.dart';
import 'package:flutter_application_7/boisson_non_sucre.dart';
import 'package:flutter_application_7/create_med.dart';
import 'package:flutter_application_7/create_patient.dart';
import 'package:flutter_application_7/creux_sales.dart';
import 'package:flutter_application_7/creux_sucres.dart';
import 'package:flutter_application_7/desserts.dart';
import 'package:flutter_application_7/entrements_glaces.dart';
import 'package:flutter_application_7/fromage.dart';
import 'package:flutter_application_7/choix.dart';
import 'package:flutter_application_7/categories.dart';
import 'package:flutter_application_7/mesure_sucre.dart';
import 'package:flutter_application_7/oeufs.dart';
import 'package:flutter_application_7/plats_com.dart';
import 'package:flutter_application_7/poissons.dart';
import 'package:flutter_application_7/produits_sucres.dart';
import 'package:flutter_application_7/restauration_rapide.dart';
import 'package:flutter_application_7/sakhta.dart';
import 'package:flutter_application_7/salades.dart';
import 'package:flutter_application_7/se_connecter_medecin.dart';
import 'package:flutter_application_7/se_connecter_patient.dart';
import 'package:flutter_application_7/soupes_potages.dart';
import 'package:flutter_application_7/viandes_abats.dart';
import 'package:flutter_application_7/volailles.dart';
import 'package:flutter_application_7/calendrier.dart';
import 'package:flutter_application_7/Salha.dart';
import 'package:flutter_application_7/quantite.dart';
import 'package:flutter_application_7/ajouteraliment/ajouteraliment.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  //final List<Info> li = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Choix(),
      routes: {
        '/laitages': (context) => const laitages(),
        '/patisseuries': (context) => const Patisserie(),
        '/assaisonnements_condiments': (context) =>
            assaisonnements_condiments(),
        '/desserts': (context) => const desserts(),
        '/entrements_glaces': (context) => const entrements_glaces(),
        '/produit_sucres': (context) => const produit_sucres(),
        '/creux_salés': (context) => const creux_sales(),
        '/creux_sucrés': (context) => const creux_sucres(),
        '/restauration_rapide': (context) => const res_rapide(),
        '/boisons_sucré': (context) => const BoissonsSucre(),
        '/boissons_alcool': (context) => const Alcool(),
        '/boissons_non_sucré': (context) => const BoissonsNonSucree(),
        '/poissons': (context) => const Poissons(),
        '/pain': (context) => const Pain(),
        '/formage': (context) => const Fromage(),
        '/viandes_abats': (context) => const viandesAbats(),
        '/volailles': (context) => const volailles(),
        '/oeufs': (context) => const oeufs(),
        '/plats_ com': (context) => const plats(),
        '/soupes_potages': (context) => const soupes(),
        '/categories': (context) => const myPage(),
        '/quantite': (context) => Quantite(ajouter: 0.0),
        '/mekla': (context) => Mekla(),
        '/se_connecter_patient': (context) => SeconnecterPatient(),
        '/mesure_sucre': (context) => Mesure(),
        '/se_connecter_medecin': (context) => Seconnectermed(),
        '/create_med': (context) => const creationm(),
        '/create_patient': (context) => const CreatePat(),
        '/calcule': (context) => const myPage(),
        '/salades': (context) => const salades(),
        '/Calendrier': (context) => calendrier(),
        //'/Calendrier': (context) => Calendrier(ajouter: 0.0),
        '/Salha': (context) => Salha(),
        '/sakhta': (context) => sakhta(),
        '/accueil': (context) => Acceuil(),
        '/ajouteraliment': (context) => ajouteraliment()
      },
    );
  }
}
