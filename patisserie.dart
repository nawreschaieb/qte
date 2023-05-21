import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class Patisserie extends StatefulWidget {
  const Patisserie({super.key});

  @override
  _PatisserieState createState() => _PatisserieState();
}

class _PatisserieState extends State<Patisserie> {
  final List<Repas> li = [
    Repas(name: "Baklawa", lien: '/mekla'),
    Repas(name: "Beignet nature", lien: '/Salha'),
    Repas(name: "Beignet au miel", lien: '/sakhta'),
    Repas(name: "Cake nature", lien: '/sakhta'),
    Repas(name: "Crépe nature", lien: '/sakhta'),
    Repas(name: "Crépe chocolat", lien: '/sakhta'),
    Repas(name: "Eclair", lien: '/sakhta'),
    Repas(name: "Gateau au chocolat ", lien: '/sakhta'),
    Repas(name: "Kaak el ouarka ", lien: '/sakhta'),
    Repas(name: "Makroudh de kairouan", lien: '/sakhta'),
    Repas(name: "Mkharek", lien: '/sakhta'),
    Repas(name: "Mille feuilles   ", lien: '/sakhta'),
    Repas(name: "Tarte aux fruits  ", lien: '/sakhta'),
    Repas(name: "Tiramisu ", lien: '/sakhta'),
    Repas(name: "Touagine aux amandes", lien: '/sakhta'),
    Repas(name: "Youyou ", lien: '/sakhta'),
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
