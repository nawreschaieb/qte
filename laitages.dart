import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class laitages extends StatefulWidget {
  const laitages({super.key});

  @override
  _laitagesState createState() => _laitagesState();
}

class _laitagesState extends State<laitages> {
  final List<Repas> li = [
    Repas(name: "Lait entier", lien: '/mekla'),
    Repas(name: "Lait 1/2 écrémé", lien: '/Salha'),
    Repas(name: "Lait écrémé", lien: '/mandba.dart'),
    Repas(name: "Lben", lien: '/sakhta'),
    Repas(name: "Raiib", lien: '/sakhta'),
    Repas(name: "Yaourt nature sucré", lien: '/sakhta'),
    Repas(name: "Yaourt nature (lait entier)", lien: '/sakhta'),
    Repas(name: "Yaourt au lait demi-écrémé aromatisé", lien: '/sakhta'),
    Repas(name: "Yaourt aux fruits", lien: '/sakhta'),
    Repas(name: "Yaourt 0% MG aux fruits et à l'aspartame", lien: '/sakhta'),
    Repas(name: "Yaourt nature 0% ", lien: '/sakhta'),
    Repas(name: "Yaourt 0% MG à l'aspartame", lien: '/sakhta'),
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
