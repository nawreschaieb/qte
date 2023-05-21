import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class creux_sales extends StatefulWidget {
  const creux_sales({super.key});

  @override
  _creux_salesState createState() => _creux_salesState();
}

class _creux_salesState extends State<creux_sales> {
  final List<Repas> li = [
    Repas(name: "Amande", lien: '/mekla'),
    Repas(name: "Biscuits apéritifs salés", lien: '/Salha'),
    Repas(name: "Cacahuétes", lien: '/mandba.dart'),
    Repas(name: "Chips", lien: '/sakhta'),
    Repas(name: "Cornichons", lien: '/sakhta'),
    Repas(name: "Cubes de fromages ", lien: '/sakhta'),
    Repas(name: "Noisettes ", lien: '/sakhta'),
    Repas(name: "Noix de cajou", lien: '/sakhta'),
    Repas(name: "Noix ", lien: '/sakhta'),
    Repas(name: "Olives noires", lien: '/sakhta'),
    Repas(name: "Olives vertes", lien: '/sakhta'),
    Repas(name: "Pistaches", lien: '/sakhta'),
    Repas(name: "Tuc (lu)", lien: '/sakhta'),
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
