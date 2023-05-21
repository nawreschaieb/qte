import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class viandesAbats extends StatefulWidget {
  const viandesAbats({super.key});

  @override
  _viandesAbatsState createState() => _viandesAbatsState();
}

class _viandesAbatsState extends State<viandesAbats> {
  final List<Repas> li = [
    Repas(name: "Boeuf bifteck grillé", lien: '/mekla'),
    Repas(name: "Boeuf entrecôte grillé", lien: '/Salha'),
    Repas(name: "Boulettes de viandes de boeuf", lien: '/mandba.dart'),
    Repas(name: "Brochettes de boeuf", lien: '/sakhta'),
    Repas(name: "Côtelettes d'agneau grillées", lien: '/sakhta'),
    Repas(name: "Côtelettes de veau grillées", lien: '/sakhta'),
    Repas(name: "Escalope de veau", lien: '/sakhta'),
    Repas(name: "Escalope de veau pané", lien: '/sakhta'),
    Repas(name: "Foie de mouton, cru", lien: '/sakhta'),
    Repas(name: "Foie de veau, cru", lien: '/sakhta'),
    Repas(name: "Patte, crue", lien: '/sakhta'),
    Repas(name: "Rognon d'agneau ou de boeuf cru", lien: '/sakhta'),
    Repas(name: "Steak haché de boeuf", lien: '/sakhta'),
    Repas(name: "Viande de boeuf, crue", lien: '/sakhta'),
    Repas(name: "Viande de chameau, crue", lien: '/sakhta'),
    Repas(name: "Viande de chèevre, crue", lien: '/sakhta'),
    Repas(name: "Viande de veau, crue", lien: '/sakhta'),
    Repas(name: "Viande de d'agneau, crue", lien: '/sakhta'),
    Repas(name: "Viande de boeuf, crue", lien: '/sakhta'),
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
