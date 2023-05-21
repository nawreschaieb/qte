import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class plats extends StatefulWidget {
  const plats({super.key});

  @override
  _platsState createState() => _platsState();
}

class _platsState extends State<plats> {
  final List<Repas> li = [
    Repas(name: "Chakchouka(pomme de terre et oeuf)", lien: '/mekla'),
    Repas(name: "Chakchouka(tomate, piment, oignon et oeuf) ", lien: '/Salha'),
    Repas(name: "Couscous avec légumes", lien: '/mandba.dart'),
    Repas(name: "Couscous sans légumes", lien: '/sakhta'),
    Repas(name: "Ojja merguez frais", lien: '/sakhta'),
    Repas(name: "Ojja à la pomme de terre ", lien: '/sakhta'),
    Repas(name: "Ojja (oeuf) ", lien: '/sakhta'),
    Repas(name: "Lablabi oeuf et thon", lien: '/sakhta'),
    Repas(name: "Lablabi", lien: '/sakhta'),
    Repas(name: "Lassagne", lien: '/sakhta'),
    Repas(name: "Légumes farcis", lien: '/sakhta'),
    Repas(name: "Mloukhia au boeuf", lien: '/mekla'),
    Repas(name: "Macaroni en sauce ", lien: '/Salha'),
    Repas(name: "Mosli (pomme de terre au four)", lien: '/mandba.dart'),
    Repas(name: "Ragoût haricot blanc ", lien: '/sakhta'),
    Repas(name: "Ragoût de petit pois", lien: '/sakhta'),
    Repas(name: "Ragoût de pomme de terre ", lien: '/sakhta'),
    Repas(name: "Ragoût de pois chiche ", lien: '/sakhta'),
    Repas(name: "Ravioli, cannelloni", lien: '/sakhta'),
    Repas(name: "Riz bassmati, riz complet cuit ", lien: '/sakhta'),
    Repas(name: "Riz bassmati, riz complet en sauce", lien: '/sakhta'),
    Repas(name: "Spaghetti bolonaise aldente", lien: '/sakhta'),
    Repas(name: "Spaghetti aux fruits de mer aldente", lien: '/sakhta'),
    Repas(name: "Tagine épinard ou persil+fromage ", lien: '/sakhta'),
    Repas(name: "Tagine malsouka", lien: '/sakhta'),
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
