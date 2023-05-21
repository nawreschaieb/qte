import 'package:flutter/material.dart';
import 'package:flutter_application_7/ajouteraliment/ajouteraliment.dart';
import 'package:flutter_application_7/mekla/utils/mekla_argument.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ajouteraliment/utils/mekla_argument.dart';

//import 'package:table_calendar/table_calendar.dart';

class sakhta extends StatefulWidget {
  const sakhta({Key? key}) : super(key: key);

  @override
  State<sakhta> createState() => _sakhtaState();
}

class _sakhtaState extends State<sakhta> {
  final _glucideController = TextEditingController();
  final _quantiteController = TextEditingController();
  /* double valglucide = 0.0;
  void glucideCalcule() {
    valglucide = 0.0;
    if (_valSlider == 0.0) {
      valglucide == 0.0;
    } else if (_valSlider == 50.0) {
      valglucide == 2;
    } else if (_valSlider == 100.0) {
      valglucide == 4;
    } else if (_valSlider == 25.0) {
      valglucide == 1;
    } else if (_valSlider == 75.0) {
      valglucide == 3;
    }
  }*/
  double _grammeSucre = 0.0;
  double _value = 0.0;
  double val = 0.0;

  valCircle(_value) {
    val = _value * 0.005;
    return val;
  }

  double savedgrammeSucre = 0;

  calculeScre(double _value, double _grammeSucre) {
    if (_value == 50.0) {
      _grammeSucre = 5;
      savedgrammeSucre = _grammeSucre;
      return Text("$_grammeSucre",
          style: TextStyle(color: Color(0xffFFEEE4), fontSize: 20));
      //  print(_grammeSucre);
    } else if (_value == 100.0) {
      _grammeSucre = 10;
      savedgrammeSucre = _grammeSucre;

      return Text("$_grammeSucre",
          style: TextStyle(color: Color(0xffFFEEE4), fontSize: 20));
    } else if (_value == 150.0) {
      _grammeSucre = 15;
      savedgrammeSucre = _grammeSucre;

      return Text("$_grammeSucre",
          style: TextStyle(color: Color(0xffFFEEE4), fontSize: 20));
    } else if (_value == 200.0) {
      _grammeSucre = 20.0;
      savedgrammeSucre = _grammeSucre;

      return Text("$_grammeSucre ",
          style: TextStyle(color: Color(0xffFFEEE4), fontSize: 20));
    } else {
      _grammeSucre = 0.0;
      savedgrammeSucre = _grammeSucre;

      return Text("$_grammeSucre ",
          style: TextStyle(color: Color(0xffFFEEE4), fontSize: 20));
    }
  }

  //data: SliderThemeData();
  //var _valSlider = 0.0;
  // var value;
  // static const historylength = 5;

  void initializeSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  void saveNameAndQuantityToSharedPreferences(
      String name, double quantity) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();

    List<Map<String, dynamic>> itemList = _preferences
            .getStringList('itemList')
            ?.map((item) => Map<String, dynamic>.from(json.decode(item)))
            ?.toList() ??
        [];

    Map<String, dynamic> newItem = {
      'name': name,
      'quantity': quantity,
    };

    itemList.add(newItem);

    await _preferences.setStringList(
      'itemList',
      itemList.map((item) => json.encode(item)).toList(),
    );
  }

  void printItemListFromSharedPreferences() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();

    List<Map<String, dynamic>> itemList = _preferences
            .getStringList('itemList')
            ?.map((item) => Map<String, dynamic>.from(json.decode(item)))
            ?.toList() ??
        [];

    for (var item in itemList) {
      print('Name: ${item['name']}, Quantity: ${item['quantity']}');
      print('----------');
    }
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MeklaArgument;

    /* data:
    SliderThemeData(
      trackHeight: 30.0,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
      overlayColor: Color(0xFFCE6D39),
      valueIndicatorColor: Color(0xFFCE6D39),
    );*/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff011638),
        title: Text(
          args.nomMekla,
          style: TextStyle(fontSize: 18, color: Color(0xFFCE6D39)),
        ),
      ),
      body: Container(
        color: Color(0xffFFEEE4),
        // height: 800,
        alignment: Alignment.topCenter,
        // padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* SizedBox(
              height: 20,
            ),*/
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(110),
                    bottomLeft: Radius.circular(110)),
                color: Color(0xFFe77e4d),
              ),
              width: double.infinity,
              height: 250,

              // color: Color(0xFFe77e4d),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 1050,
                    radius: 70,
                    lineWidth: 20.0,
                    percent: valCircle(_value),
                    progressColor: Color(0xffFFEEE4),
                    backgroundColor: Color(0xF8011638),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: /*Text(
                      "$_value ",
                      style: TextStyle(color: Color(0xffFFEEE4), fontSize: 30)*/
                        calculeScre(_value, _grammeSucre),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Glucide en gramme",
                      style: TextStyle(
                          color: Color(0xF8011638),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // ),
            SizedBox(
              height: 50,
            ),
            Slider(
              activeColor: Color(0xFFe77e4d),
              inactiveColor: Color(0xF8011638),
              label: ' $_value',
              value: _value,
              min: 0,
              max: 200,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xF8011638),
                    //  border:Border( borderSide: BorderSide(width: 2)),
                    // inputborder: BorderSide(width: 2),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xF8011638), width: 3),
                    ),
                    /*  enabledBorder: OutlineInputBorder(
           
                        //  borderSide: BorderSide(color: Color(0xF8011638)),
                        ),*/
                    hintText: '$_value gramme',
                    hintStyle: TextStyle(
                        color: Color(0xF8011638),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                // controller:  ,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFe77e4d),
                    shape: StadiumBorder(),
                    // maximumSize: Size(110, 25)
                  ),
                  onPressed: () {
                    saveNameAndQuantityToSharedPreferences(
                        args.nomMekla, savedgrammeSucre);
                    printItemListFromSharedPreferences();

                    Navigator.pushNamed(context, '/ajouteraliment',
                        arguments: AjouterAlimentArguments(
                          args.nomMekla,
                          savedgrammeSucre,
                        ));
                  },
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF011638)),
                  )),
            ),
          ],
          /* child: Stack(
          children: [
            Positioned(
              //top: 5,
              child: Container(
                padding: EdgeInsets.only(top: 1),
                color: Color(0xFFCE6D39),
                // width: double.infinity,
                height: 400,
                width: 400,
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1050,
                  radius: 120,
                  lineWidth: 30.0,
                  percent: 0.5,
                  progressColor: Color(0xffFFEEE4),
                  backgroundColor: Color(0xF8011638),
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    "100",
                    style: TextStyle(color: Color(0xffFFEEE4), fontSize: 30),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color(0xffFFEEE4),
                ),
                //width: double.infinity,
                width: 360,
                height: 600,


                child: Center(
                 
                  child: SliderTheme(
                   
                    data: SliderThemeData(
                      // trackHeight: 2.0,
                      valueIndicatorColor: Color(0xFFCE6D39),
                      //thumbShape: RoundSliderThumbShape(
                      /* enabledThumbRadius: 15,
                          disabledThumbRadius: 10,
                          pressedElevation: 10),
                      overlayColor: Color(0xFFCE6D39),*/
                      //valueIndicatorColor: Color(0xFFCE6D39),
                    ),
                    child: Slider(
                      // key: ,


                      value: _valSlider,
                      onChanged: (valeur) {
                        setState(() {
                          _valSlider = valeur;
                        });


                        print(_valSlider);
                      },


                      label: "$_valSlider",
                      divisions: 4,
                      activeColor: Color(0xFFe77e4d),
                      inactiveColor: Color(0xF8011638),
                      min: 0.0,
                      max: 100.0,
                      //value: _valSlider,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),*/
          //),
          // void Glucides (){

          /* Slider(
         
          value: _valSlider,
          onChanged: (valeur) {
            setState(() {
              _valSlider = valeur;
            });
          },
          label: "$_valSlider",
          divisions: 4,
          activeColor: Color(0xFFe77e4d),
          inactiveColor: Color(0xF8011638),
          min: 0.0,
          max: 100.0,
          //value: _valSlider,
        ),*/
          //],
        ),
      ),
    );
  }
}
