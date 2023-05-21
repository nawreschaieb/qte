import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class Poissons extends StatefulWidget {
  const Poissons({super.key});

  @override
  _PoissonsState createState() => _PoissonsState();
}

class _PoissonsState extends State<Poissons> {
  final List<Repas> li = [
    Repas(name: "Anchoid à l'huile", lien: '/mekla'),
    Repas(name: "calamar, cru", lien: '/Salha'),
    Repas(name: "Crevette, cru", lien: '/sakhta'),
    Repas(name: "Loup, cru", lien: '/sakhta'),
    Repas(name: "Maquereau, cru ", lien: '/sakhta'),
    Repas(name: "Merlan, frit", lien: '/sakhta'),
    Repas(name: "Moule, crue ", lien: '/sakhta'),
    Repas(name: "Merlan, frit ", lien: '/sakhta'),
    Repas(name: "Mulet, cru ", lien: '/sakhta'),
    Repas(name: "Sardine,crue", lien: '/sakhta'),
    Repas(name: "Poulpe, cru", lien: '/sakhta'),
    Repas(name: "Sardine conserve, cru ", lien: '/sakhta'),
    Repas(name: "Sardine fraiches frites ", lien: '/sakhta'),
    Repas(name: "Seiche,crue", lien: '/sakhta'),
    Repas(name: "Sole,crue ", lien: '/sakhta'),
    Repas(name: "Thon à l'huile égoutté ", lien: '/sakhta'),
    Repas(name: "Thon rouge, cru ", lien: '/sakhta'),
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
