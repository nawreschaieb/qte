import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class Pain extends StatefulWidget {
  const Pain({super.key});

  @override
  _PainState createState() => _PainState();
}

class _PainState extends State<Pain> {
  final List<Repas> li = [
    Repas(name: "Baguette", lien: '/mekla'),
    Repas(name: "Biscottes", lien: '/Salha'),
    Repas(name: "Bsissa poudre", lien: '/sakhta'),
    Repas(name: "Céréales au son de blé", lien: '/sakhta'),
    Repas(name: "Céréales aux fruits secs", lien: '/sakhta'),
    Repas(name: "Croissant", lien: '/sakhta'),
    Repas(name: "Farine blanche", lien: '/sakhta'),
    Repas(name: "Pain blanc", lien: '/sakhta'),
    Repas(name: "Pain complet ", lien: '/sakhta'),
    Repas(name: "Pain au son", lien: '/sakhta'),
    Repas(name: "Pain au orge", lien: '/sakhta'),
    Repas(name: "Pain grillé   ", lien: '/sakhta'),
    Repas(name: "Pain demi ou brioché", lien: '/sakhta'),
    Repas(name: "Pain au chocolat", lien: '/sakhta'),
    Repas(name: "Pain aux raisins", lien: '/sakhta'),
    Repas(name: "Pain mlaoui", lien: '/sakhta'),
    Repas(name: "Sorgho(droo)", lien: '/sakhta'),
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
