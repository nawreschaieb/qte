import 'package:flutter/material.dart';
import 'package:flutter_application_7/ajouteraliment/utils/mekla_argument.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ajouteraliment extends StatefulWidget {
  const ajouteraliment({Key? key}) : super(key: key);

  @override
  _ajouteralimentState createState() => _ajouteralimentState();
}

class _ajouteralimentState extends State<ajouteraliment> {
  List<AjouterAlimentArguments> alimentList = [];

  void addItem(AjouterAlimentArguments item) {
    setState(() {
      alimentList.add(item);
    });
  }

  void deleteItem(int index) async {
    setState(() {
      alimentList.removeAt(index);
    });

    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    List<String>? itemList = _preferences.getStringList('itemList');

    if (itemList != null) {
      itemList.removeAt(index);
      await _preferences.setStringList('itemList', itemList);
    }
  }

  @override
  void initState() {
    super.initState();
    loadItemsFromSharedPreferences();
  }

  Future<List<AjouterAlimentArguments>> loadItemsFromSharedPreferences() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    List<String>? itemList = _preferences.getStringList('itemList');

    if (itemList != null) {
      List<AjouterAlimentArguments> decodedList = itemList.map((item) {
        Map<String, dynamic> decodedItem =
            json.decode(item) as Map<String, dynamic>;
        return AjouterAlimentArguments(
            decodedItem['name'], decodedItem['quantity']);
      }).toList();

      alimentList = decodedList;
    }
    print(alimentList.length);

    return alimentList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff011638),
        title: Text(
          "Liste",
          style: TextStyle(fontSize: 18, color: Color(0xFFCE6D39)),
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: FutureBuilder<List<AjouterAlimentArguments>>(
          future: loadItemsFromSharedPreferences(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors
                        .blueGrey, // Set the desired color for the container
                    child: ListTile(
                      title: Text(
                        item.nomMekla,
                        style: TextStyle(
                            color: Colors.black), // Set the desired text color
                      ),
                      subtitle: Text(
                        item.grammeSucre.toString() + ' Glicide(gr)',
                        style: TextStyle(
                            color: Colors.black), // Set the desired text color
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Color(0xFFCE6D39),
                        ),
                        onPressed: () {
                          deleteItem(index);
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              print('cicular');
              return CircularProgressIndicator(); // Show a loading indicator
            } else {
              print('error');

              return Text('Error: ${snapshot.error}');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFCE6D39),
        foregroundColor: Colors.black,
        label: Text('Ajouter a la liste'),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/categories',
          );
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
