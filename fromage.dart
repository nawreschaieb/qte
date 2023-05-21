import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class Fromage extends StatefulWidget {
  const Fromage({super.key});

  @override
  _FromageState createState() => _FromageState();
}

class _FromageState extends State<Fromage> {
  final List<Repas> li = [
    Repas(name: "Formage ricotta", lien: '/sakhta'),
    Repas(name: "Formage gervais", lien: '/sakhta'),
    Repas(name: "Formage blanc frais ", lien: '/sakhta'),
    Repas(name: "Formage à pate molle camembert", lien: '/sakhta'),
    Repas(name: "Formage  à pate dure (gruyère,ementhal)", lien: '/sakhta'),
    Repas(
        name: "Formage frais (Sicilien, Sardaigne, Mozzarella fraiche)",
        lien: '/sakhta'),
    Repas(name: "Formage fondu en portion", lien: '/sakhta'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff011638),
        title: const Text(
          "Créer mon repas ",
          style: TextStyle(fontSize: 18, color: Color(0xFFCE6D39)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFFCE6D39),
            ),
            onPressed: () {
              /*  showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );*/
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ...li.map((val) {
                return SizedBox(
                  width: 350,
                  height: 90,

                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    child: TextButton(
                      // padding: const EdgeInsets.all(1.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            /*leading: Image.network(
                                val.image,
                              ),*/
                            title: Text(
                              val.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff011638),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          /* Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'choisir',
                                    style: TextStyle(color: Color(0xff011638)),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, val.lien);
                                  },
                                ),
                              ],
                            ),*/
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, val.lien);
                      },
                    ),
                  ),
                  // ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
