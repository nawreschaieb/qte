import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class res_rapide extends StatefulWidget {
  const res_rapide({super.key});

  @override
  _res_rapideState createState() => _res_rapideState();
}

class _res_rapideState extends State<res_rapide> {
  final List<Repas> li = [
    Repas(name: "Crêpe jambon/fromage", lien: '/mekla'),
    Repas(name: "Crêpe thon/fromage", lien: '/Salha'),
    Repas(name: "Croque-monsieur", lien: '/mandba.dart'),
    Repas(name: "Cheese burger ", lien: '/sakhta'),
    Repas(name: "Fricassé", lien: '/sakhta'),
    Repas(name: "Frite petite", lien: '/sakhta'),
    Repas(name: "Frite moyenne", lien: '/sakhta'),
    Repas(name: "Frite grande", lien: '/sakhta'),
    Repas(name: "Hamburger", lien: '/sakhta'),
    Repas(name: "Quiche", lien: '/sakhta'),
    Repas(name: "Panini", lien: '/sakhta'),
    Repas(name: "pâté au fromage ou poulet ou thon ", lien: '/sakhta'),
    Repas(name: "Pizza de restaurant", lien: '/sakhta'),
    Repas(name: "Pizza mini", lien: '/sakhta'),
    Repas(name: "Sandwich thon", lien: '/sakhta'),
    Repas(name: "Sandwich escalope sans frites", lien: '/sakhta'),
    Repas(name: "Sandwich jambon/fromage", lien: '/sakhta'),
    Repas(name: "Sandwich mlaoui", lien: '/sakhta'),
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
