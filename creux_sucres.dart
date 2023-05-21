import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class creux_sucres extends StatefulWidget {
  const creux_sucres({super.key});

  @override
  _creux_sucresState createState() => _creux_sucresState();
}

class _creux_sucresState extends State<creux_sucres> {
  final List<Repas> li = [
    Repas(name: "Barre de chocolat ", lien: '/mekla'),
    Repas(name: "Biscuits chocolatés", lien: '/Salha'),
    Repas(name: "Biscuits fourrés", lien: '/mandba.dart'),
    Repas(name: "Biscuits secs", lien: '/sakhta'),
    Repas(name: "Bonbons", lien: '/sakhta'),
    Repas(name: "Chocolats noir, blanc, au lait", lien: '/sakhta'),
    Repas(name: "Cookies ", lien: '/sakhta'),
    Repas(name: "Madeleine", lien: '/sakhta'),
    Repas(name: "Mini-feuilletés ", lien: '/sakhta'),
    Repas(name: "Petits-four sucrés", lien: '/sakhta'),
    Repas(name: "Petit beurre", lien: '/sakhta'),
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
