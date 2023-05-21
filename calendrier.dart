/*import 'package:flutter_application_7/mesure_sucre.dart';
import 'package:flutter/material.dart';

class Calendrier extends StatefulWidget {
  final double? ajouter;

  Calendrier({required this.ajouter});

  @override
  State<StatefulWidget> createState() => CalendrierState();
}

class CalendrierState extends State<Calendrier> {
  MesureState mesureState = MesureState();
  final _valeurcontroller = TextEditingController();
  var c = Color.fromARGB(255, 151, 184, 236);
  var d = Color(0xFFCE6D39);
  double replaceGlucides = 0.0;
  double number = 0.0;
  double result = 0.0;
  double finalResult = 0.0;

  void calculateur() {
    number = double.parse(_valeurcontroller.text);
    setState(() {
      result = (number * 10) / 100;
    });
  }

  double insulineresult = 0.0;

  double insuline(double result, double ajouter) {
    setState(() {
      insulineresult = ((result * ajouter) / 10);
    });
    return insulineresult;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150.0),
            alignment: Alignment.center,
            child: Text(
              'Glucide',
              style: TextStyle(
                fontSize: 30,
                color: c,
              ),
            ),
          ),
          Container(
            height: 150,
            width: 250,
            margin: EdgeInsets.only(top: 15.0),
            alignment: Alignment.center,
            child: TextField(
              controller: _valeurcontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: c),
                  borderRadius: BorderRadius.all(Radius.circular(600)),
                ),
                hintText: '0.0',
                hintStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
                suffixStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
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
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(d),
                  foregroundColor: MaterialStateProperty.all(c),
                ),
                child: const Text('Enregistrer'),
                onPressed: () {
                  setState(() {
                    calculateur();
                    print(widget.ajouter);
                    print(result);
                    finalResult = insuline(result, widget.ajouter!);
                    print(insuline(result, widget.ajouter!));
                  });
                },
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: Text(
                "${result.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1.5)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: Text(
                "${insulineresult.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1.5)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Repas sélectionné : $finalResult ',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Repas ajouter : ${widget.ajouter} ',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Repas resltat : $result',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  /*Color d = Color(0xff011638);
  Color c = Color(0xFFCE6D39);
  // Calcule calcule = Calcule();






  @override
  String selectedMeal = '';


  void _selectMeal(String meal) {
    setState(() {
      selectedMeal = meal;
    });
    // Effectuer votre calcul ici en utilisant la variable selectedMeal
    // Par exemple, vous pouvez appeler une fonction qui effectue le calcul
    performCalculation(replaceGlucides);
  }


  dynamic replaceGlucides = 0.0;
  performCalculation(replaceGlucides) {
    // Faites votre calcul en utilisant la variable selectedMeal
    // Par exemple :


    if (selectedMeal == 'petit déjeuner') {
      replaceGlucides = 2.0;


      return replaceGlucides;
      print('Vous avez sélectionné le petit déjeuner.');
      // Effectuez votre calcul pour le petit déjeuner ici
    } else if (selectedMeal == 'déjeuner') {
      replaceGlucides = 1.0;


      return replaceGlucides;
      print('Vous avez sélectionné le déjeuner.');
      // Effectuez votre calcul pour le déjeuner ici
    } else if (selectedMeal == 'dîner') {
      replaceGlucides = 2.0;


      return replaceGlucides;
      print('Vous avez sélectionné le dîner.');
      // Effectuez votre calcul pour le dîner ici
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff011638),
        title: const Text(
          "choisir répas",
          style: TextStyle(fontSize: 18, color: Color(0xFFCE6D39)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sélectionnez votre repas :',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectMeal('petit déjeuner'),
              child: Text('Petit déjeuner'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _selectMeal('déjeuner'),
              child: Text('Déjeuner'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _selectMeal('dîner'),
              child: Text('Dîner'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Repas sélectionné : $selectedMeal',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Repas sélectionné : ${performCalculation(replaceGlucides)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      /*  body: Container(
        padding: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /*   Container(
                child: Text(
                  '$c',
                  style: TextStyle(fontSize: 20),
                ),
              ),*/
              ...l.map((val) {
                return Container(
                  width: 200,
                  height: 60,
                  //color: Color(0xFFCE6D39),
                  child: ListView(
                    // elevation: 8,
                    /// color: Colors.white,
                    /*   padding: Padding(
                      padding: const EdgeInsets.all(10.0),*/
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFCE6D39),
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Text(
                                val,
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff011638)),
                              ),
                            ),
                          ),


                          // ),
                          /*  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text(
                                  'choisir',
                                  style: TextStyle(color: Color(0xff011638)),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, val.lientype);
                                },
                              ),
                            ],
                          ),*/
                        ],
                        // ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),


      /* Column(children: [
        Container(
          width: 200,
          // height: 35,
          // padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/mesure_sucre');
              },
              child: const Text(
                'Petit Déjeuner',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF011638)),
              )),
        ),
        Container(
          width: 200,
          // height: 35,
          // padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/mesure_sucre');
              },
              child: const Text(
                'Déjeuner',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF011638)),
              )),
        ),
        Container(
          // padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),


          width: 200,


          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/mesure_sucre');
              },
              child: const Text(
                'Diner',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF011638)),
              )),
        ),*/
      ]),*/
    );
  }*/
}
*/
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendrier extends StatefulWidget {
  const calendrier({super.key});

  @override
  State<StatefulWidget> createState() => _calendrierState();
}

class _calendrierState extends State<calendrier> {
  DateTime today = DateTime.now();
  void _oneDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff011638),
          title: Text(
            "Calendrier",
            style: TextStyle(fontSize: 20, color: Color(0xFFCE6D39)),
          )),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 45,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            onDaySelected: _oneDaySelected,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          width: 200,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 116, 25),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
              child: const Text(
                'Petit Déjeuner',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF011638)),
              )),
        ),
        Container(
          width: 200,
          // height: 35,
          // padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 116, 25),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
              child: const Text(
                'Déjeuner',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF011638)),
              )),
        ),
        Container(
          // padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),

          width: 200,

          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 116, 25),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
              child: const Text(
                'Diner',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF011638)),
              )),
        ),
      ],
    );
  }
}
