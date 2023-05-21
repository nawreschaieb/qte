import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Salha extends StatefulWidget {
  @override
  State<Salha> createState() => _SalhaState();
}

class _SalhaState extends State<Salha> {
  var c = const Color(0xff011638);
  var d = Color.fromARGB(255, 252, 116, 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff011638),
        title: const Text(
          "Choisir",
          style:
              TextStyle(fontSize: 20, color: Color.fromARGB(255, 252, 116, 25)),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 70.0),
          child: Column(children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 4000,
              radius: 130,
              lineWidth: 30.0,
              percent: 1,
              progressColor: Color.fromARGB(255, 252, 116, 25),
              backgroundColor: Color(0xF8011638),
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "10g de glucides par 100g ",
                style: TextStyle(color: Color(0xff011638), fontSize: 17),
              ),
            ),
            Container(
              // mainAxisAlignment: MainAxisAlignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Choisir une quantite :',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.center,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: '0.0',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 100),
                          suffixText: 'g',
                          suffixStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(10)),
                            backgroundColor: MaterialStatePropertyAll(d),
                            foregroundColor: MaterialStatePropertyAll(c),
                          ),
                          child: const Text(
                            'choisir',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF011638)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/categories');
                          },
                        ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
