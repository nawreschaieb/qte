import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class entrements_glaces extends StatefulWidget {
  const entrements_glaces({super.key});

  @override
  _entrements_glacesState createState() => _entrements_glacesState();
}

class _entrements_glacesState extends State<entrements_glaces> {
  final List<Repas> li = [
    Repas(name: "Assida zgougou sans décoration", lien: '/mekla'),
    Repas(name: "Assida zgougou décorée", lien: '/Salha'),
    Repas(name: "Bâtonnet glacé ou esquimeau", lien: '/mandba.dart'),
    Repas(name: "Café au chocolat liégeois", lien: '/sakhta'),
    Repas(name: "Glace petit pot", lien: '/sakhta'),
    Repas(name: "Glace cornet à 2 boules", lien: '/sakhta'),
    Repas(name: "Crème caramel ", lien: '/sakhta'),
    Repas(name: "Crème pàtissière", lien: '/sakhta'),
    Repas(name: "Mousse au chocolat", lien: '/sakhta'),
    Repas(name: "Sorbet", lien: '/sakhta'),
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
