import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class BoissonsSucre extends StatefulWidget {
  const BoissonsSucre({super.key});

  @override
  _BoissonsSucreState createState() => _BoissonsSucreState();
}

class _BoissonsSucreState extends State<BoissonsSucre> {
  final List<Repas> li = [
    Repas(name: "Citronade", lien: '/mekla'),
    Repas(name: "Jus de fruits de commerce", lien: '/Salha'),
    Repas(name: "Jus de carotte", lien: '/sakhta'),
    Repas(name: "Jus de tomate", lien: '/sakhta'),
    Repas(name: "jus d'orange frais sans sucre", lien: '/sakhta'),
    Repas(name: "Crépe chocolat", lien: '/sakhta'),
    Repas(name: "Sodas", lien: '/sakhta'),
    Repas(name: "Sodas, cola, boisson aux fruits ", lien: '/sakhta'),
    Repas(name: "Sodas light édulcorés ", lien: '/sakhta'),
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
