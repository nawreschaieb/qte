import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Choix extends StatelessWidget {
  //const Choix({super.key});
  var c = const Color(0xFF011638);
  var d = const Color(0xFFCE6D39);

  Choix({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: c,
        leading: const Icon(Icons.medical_services, color: Color(0xFFCE6D39)),
        title: const Text('suivi des diabétiques',
            style: TextStyle(
              color: Color(0xFFCE6D39),
              fontStyle: FontStyle.italic,
            )),
      ),*/
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 210,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://recomedicales.fr/images/photos/diabete-type-2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),

                    width: 300,
                    // height: 35,
                    // padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFe77e4d),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/se_connecter_medecin');
                        },
                        child: const Text(
                          'Medecin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xFF011638)),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),
                    width: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFe77e4d),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/se_connecter_patient');
                        },
                        child: const Text(
                          'Patient',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xFF011638)),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //);
  }
}
