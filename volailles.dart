import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class volailles extends StatefulWidget {
  const volailles({super.key});

  @override
  _volaillesState createState() => _volaillesState();
}

class _volaillesState extends State<volailles> {
  final List<Repas> li = [
    Repas(name: "Escalope de dinde grillée", lien: '/mekla'),
    Repas(name: "Escalope de dinde pannée", lien: '/Salha'),
    Repas(name: "Escalope de dinde cuit à l'huile", lien: '/sakhta'),
    Repas(name: "Foie de volailles, cru", lien: '/sakhta'),
    Repas(name: "Viande de poulet, crue(viande + peau) ", lien: '/sakhta'),
    Repas(name: "Viande de poulet, crue sans peau", lien: '/sakhta'),
    Repas(name: "Viande de lapin ", lien: '/sakhta'),
    Repas(name: "Viande de dinde, crue ", lien: '/sakhta'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff011638),
        title: const Text(
          "Créer mon repas ",
          style:
              TextStyle(fontSize: 18, color: Color.fromARGB(255, 252, 116, 25)),
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
