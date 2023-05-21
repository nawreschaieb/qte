import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class desserts extends StatefulWidget {
  const desserts({super.key});

  @override
  _dessertsState createState() => _dessertsState();
}

class _dessertsState extends State<desserts> {
  final List<Repas> li = [
    Repas(name: "Abricots", lien: '/mekla'),
    Repas(name: "Ananas ", lien: '/Salha'),
    Repas(name: "Banane", lien: '/mandba.dart'),
    Repas(name: "Cerises", lien: '/sakhta'),
    Repas(name: "Clémentines, Mandarines", lien: '/sakhta'),
    Repas(name: "Coing", lien: '/sakhta'),
    Repas(name: "Datte ", lien: '/sakhta'),
    Repas(name: "Figues Fraiches", lien: '/sakhta'),
    Repas(name: "Figues de barbarie", lien: '/sakhta'),
    Repas(name: "Fraises", lien: '/sakhta'),
    Repas(name: "Grenade", lien: '/sakhta'),
    Repas(name: "Kiwi", lien: '/mekla'),
    Repas(name: "Melon ", lien: '/Salha'),
    Repas(name: "Nèfle ", lien: '/mandba.dart'),
    Repas(name: "Pèche de nectarine ", lien: '/sakhta'),
    Repas(name: "Orange", lien: '/sakhta'),
    Repas(name: "Pamplemousse", lien: '/sakhta'),
    Repas(name: "Pastèque ", lien: '/sakhta'),
    Repas(name: "Pomme", lien: '/sakhta'),
    Repas(name: "Poire", lien: '/sakhta'),
    Repas(name: "Prune", lien: '/sakhta'),
    Repas(name: "Raisin", lien: '/sakhta'),
    Repas(name: "Ramequin de salade de fruits", lien: '/sakhta'),
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
