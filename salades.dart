import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

import 'mekla/utils/mekla_argument.dart';

class salades extends StatefulWidget {
  const salades({super.key});

  @override
  _saladesState createState() => _saladesState();
}

class _saladesState extends State<salades> {
  final List<Repas> li = [
    Repas(name: "Salade vert à la huile ", lien: '/quantite'),
    Repas(name: "Salade mechwia à l'huile", lien: '/sakhta'),
    Repas(name: "Salade de riz au thon", lien: '/mandba'),
    Repas(name: "Salade fruit de mer vinaigrette", lien: '/sakhta'),
    Repas(name: "Salade de lentille vinairette", lien: '/sakhta'),
    Repas(name: "Salade de pomme de terre vinaigrette", lien: '/sakhta'),
    Repas(name: "Salade de carotte ou bettave à l'huile ", lien: '/sakhta'),
    Repas(name: "Salade tomate vinaigrette", lien: '/sakhta'),
    Repas(name: "Salade tunisienne vinaigrette", lien: '/sakhta'),
    Repas(name: "Salade russe vinaigrette", lien: '/sakhta'),
    Repas(name: "Salade coeur d'artichaut", lien: '/sakhta'),
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
                  width: double.infinity,
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
                        print(val.name);
                        print(val.name);
                        Navigator.pushNamed(
                          context,
                          val.lien,
                          arguments: MeklaArgument(val.name),
                        );
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
