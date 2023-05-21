import 'package:flutter/material.dart';
import 'package:flutter_application_7/repas.dart';

class soupes extends StatefulWidget {
  const soupes({super.key});

  @override
  _soupesPotagesState createState() => _soupesPotagesState();
}

class _soupesPotagesState extends State<soupes> {
  final List<Repas> li = [
    Repas(name: "Broudou légumes sans huile ", lien: '/b'),
    Repas(name: "Broudou à la pomme de terre sans huile", lien: '/bpt'),
    Repas(name: "Chorba langue d'oiseau", lien: '/c'),
    Repas(name: "Hlalem aux légumes", lien: '/h'),
    Repas(name: "Macarouni jaria (légumes)", lien: '/m'),
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
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              val.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff011638),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
