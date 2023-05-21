import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_7/user.dart';

class Acceuil extends StatelessWidget {
  void initFirebase() async {
    await Firebase.initializeApp();
  }

  var userdocs;
  void getuser() async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('user');
    var result = await userCollection.get();
    userdocs = result.docs;
    var user = userdocs[0].data();
    print(user);
  }

  var d = Color(0xFFCE6D39);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff011638),
        title: const Text(
          "Acceuil",
          style: TextStyle(fontSize: 18, color: Color(0xFFCE6D39)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          color: d,
        ),
        width: double.infinity,
        height: 180,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(120, 30, 120, 20),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffFFEEE4),
                    radius: 50,
                    child: Text("SA",
                        style: TextStyle(
                            color: Color(0xff011638),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Samah ba ",
                    style: TextStyle(
                        color: Color(0xff011638),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            /*Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 40, bottom: 20, left: 40, right: 20),
                    // alignment: Alignment.center,
                    child: IconButton(
                      iconSize: 80,
                      icon: Icon(
                        Icons.food_bank,
                        color: d,
                      ),
                      //iconSize: ,
                      onPressed: () {
                        //Navigator.pushNamed(context, '/profile');
                      },
                    ),
                  ),
                  Container(
                    //alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        top: 40, bottom: 20, left: 40, right: 20),
                    child: IconButton(
                      iconSize: 80,
                      icon: Icon(
                        Icons.add_chart_outlined,
                        color: d,
                      ),
                      //iconSize: ,
                      onPressed: () {
                        Navigator.pushNamed(context, '/mesure_sucre');
                      },
                    ),
                  ),
                ],
              ),*/

            /* Column(
              children: [
                ListView(
                  children: (userdocs != null)
                      ? userdocs.map<Widget>((c) => Text(c['name'])).toList()
                      : [Text("...")],
                ),
              ],
            ),*/
          ],
        ),
      ),
      // ),
      //);
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff011638),
        selectedItemColor: d,
        unselectedLabelStyle: TextStyle(color: d, fontSize: 15),
        unselectedItemColor: d,
        items: [
          BottomNavigationBarItem(
            label: "Repas",
            icon: IconButton(
              iconSize: 27,
              icon: Icon(
                Icons.food_bank,
                color: d,
              ),
              //iconSize: ,
              onPressed: () {
                //getuser();
                //Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
          /*  BottomNavigationBarItem(
            label: "Profile ",
            icon: IconButton(
              //iconSize: 40,
              icon: Icon(
                Icons.person,
                color: d,
              ),
              //iconSize: ,
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),*/
          BottomNavigationBarItem(
            label: "Calcule ",
            icon: IconButton(
              iconSize: 27,
              icon: Icon(
                Icons.calculate,
                color: d,
              ),
              //iconSize: ,
              onPressed: () {
                //Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
          BottomNavigationBarItem(
            label: "courbe  ",
            icon: IconButton(
              iconSize: 27,
              icon: Icon(
                Icons.add_chart_outlined,
                color: d,
              ),
              //iconSize: ,
              onPressed: () {
                Navigator.pushNamed(context, '/mesure_sucre');
              },
            ),
          ),
        ],
      ),
      //),
    );
  }
}
