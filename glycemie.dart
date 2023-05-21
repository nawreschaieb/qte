//import 'package:baaaaaaa333/affichedata.dart';
import 'package:flutter_application_7/quantite.dart';
//import 'package:flutter_application_7/authontification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Glycemie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GlycemieState();
}

class GlycemieState extends State<Glycemie> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  String selectedMeal = '';
  static double ajouter = 0.0;

  double _selectMeal(
    String meal,
  ) {
    setState(() {
      performCalculation(meal);
      selectedMeal = meal;
    });
    return replaceGlucides;
    // Effectuer votre calcul ici en utilisant la variable selectedMeal
    // Par exemple, vous pouvez appeler une fonction qui effectue le calcul
  }

  double replaceGlucides = 0.0;
  performCalculation(selectedMeal) {
    // Faites votre calcul en utilisant la variable selectedMeal
    // Par exemple :

    if (selectedMeal == 'petit déjeuner') {
      return replaceGlucides = 2.0;

      print('Vous avez sélectionné le petit déjeuner.');
      // Effectuez votre calcul pour le petit déjeuner ici
    } else if (selectedMeal == 'déjeuner') {
      return replaceGlucides = 1.0;

      print('Vous avez sélectionné le déjeuner.');
      // Effectuez votre calcul pour le déjeuner ici
    } else if (selectedMeal == 'dîner') {
      return replaceGlucides = 1.5;

      print('Vous avez sélectionné le dîner.');
      // Effectuez votre calcul pour le dîner ici
    }
  }

  final _mesureController = TextEditingController();

  double result = 0.0, number = 0.0;
  void dispose() {
    _mesureController.dispose();
    super.dispose();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
  }

  double calcule() {
    double result = 0.0;
    number = double.parse(_mesureController.text);
    if (number > 1.3 && number < 1.7) {
      result = 1;
      addmesure();
    } else if (number > 1.6 && number < 2) {
      result = 2;
      addmesure();
    } else if (number >= 2) {
      result = 3;
      addmesure();
    }
    return result;
  }

  addajouter() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Patient");
    QuerySnapshot querySnapshot = await userRef.get();
    if (querySnapshot != null) {
      QueryDocumentSnapshot documents = querySnapshot.docs.last;

      CollectionReference mesureRef = FirebaseFirestore.instance
          .collection("Patient")
          .doc(documents.id)
          .collection("Repas");
      mesureRef.add({
        "ajouter": ajouter,
        // "result": result,
      });
    }
  }

  getajouter() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Patient");
    QuerySnapshot querySnapshot = await userRef.get();

    if (querySnapshot != null) {
      QueryDocumentSnapshot documents = querySnapshot.docs.first;

      CollectionReference ajouter = FirebaseFirestore.instance
          .collection("Patient")
          .doc(documents.id)
          .collection("Repas");

      QuerySnapshot repasSnapshot = await ajouter.limit(1).get();
      if (repasSnapshot != null) {
        List<QueryDocumentSnapshot> repasDocuments = repasSnapshot.docs;

        for (var repasDocument in repasDocuments) {
          print("========================");
          print("${repasDocument.data()}");
          print("========================");
          print("${repasDocument["ajouter"]}");
          // var resultat = calcule;
        }
      }
    }
  }

  addmesure() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Patient");
    QuerySnapshot querySnapshot = await userRef.get();
    if (querySnapshot != null) {
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      for (var document in documents) {
        CollectionReference mesureRef = FirebaseFirestore.instance
            .collection("Patient")
            .doc(document.id)
            .collection("Glycémie");
        mesureRef.add({
          "mesure": number,
          // "result": result,
        });
      }
    }
  }

  var c = Color(0xff011638);
  var d = Color(0xfffec8c9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ajouter = _selectMeal('petit déjeuner');
                          print(ajouter);
                        });
                      },
                      child: Text(
                        'Petit déjeuner',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ajouter = _selectMeal('déjeuner');
                          print(ajouter);
                        });
                      },

                      // _selectMeal('déjeuner'),
                      child: Text(
                        'Déjeuner',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ajouter = _selectMeal('dîner');
                          print(ajouter);
                        });
                      },

                      // _selectMeal('dîner'),
                      child: Text(
                        'Dîner',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 150.0),
                alignment: Alignment.center,
                child: Text(
                  'Glycémie',
                  style: TextStyle(
                    fontSize: 30,
                    color: c,
                  ),
                ),
              ),
              Container(
                height: 150,
                width: 250,
                margin: EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                child: TextField(
                  //padding: EdgeInsets.all(16.0),
                  controller: _mesureController,
                  decoration: InputDecoration(
                    hintText: '0.0',
                    hintStyle:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
                    suffixText: 'mg/dL',
                    suffixStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Enregistrer'),
                    onPressed: () async {
                      // final User? _user = FirebaseAuth.instance.currentUser;
                      // addajouter();
                      // getajouter();
                      addmesure();
                      calcule();
                      performCalculation(replaceGlucides);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Quantite(ajouter: ajouter),
                        ),
                      );
                    },
                  ),
                  // ),
                ],
              ),
              Container(
                child: Text(
                  "$result",
                  style: TextStyle(fontSize: 40),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
