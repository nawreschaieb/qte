/*
//import 'package:baaaaaaa333/lll/loading.dart';
import 'package:flutter_application_7/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; //
import 'firebase_options.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter_application_7/create_patient.dart';

import 'package:flutter_application_7/authontification.dart';



class SeconnecterPatient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SeconnecterPatientState();
}


class _SeconnecterPatientState extends State<SeconnecterPatient> {
  final AuthontificationService _auth = AuthontificationService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool showSignIn = true;
  bool emailVerified = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // pour bloqué les controllers si on les utilise pas
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }


  void toggleView() {
    setState(() {
      _emailController.text = '';
      _passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }


  /* Future SignIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      Navigator.of(context).pushNamed("/");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Opps',
          desc: "vous n'avez pas un compte",
          //btnCancelOnPress: () {},
          btnOkOnPress: () {
            /* Color:
          d;*/
            Title:
            " se conncter";
            Navigator.pushNamed(context, '/create_patient');
          },
        )..show();
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Opps',
          desc: 'le mot de passe est incorrect',
          //btnCancelOnPress: () {},
          btnOkOnPress: () {
            /* Color:
          d;*/
            Title:
            " j'ai l'oublier";
            Navigator.pushNamed(context, '/ss');
          },
        )..show();
        //print('Wrong password provided for that user.');
      }
    }
  }*/


  var c = Color(0xff011638);
  var d = Color(0xFFe77e4d);
  /* void openSignupScreen() {
    Navigator.pushNamed(context, '/create_patient');
    //Navigator.of(context).pushReplacement('create_patient');
  }*/


  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demande Connexion'),
        foregroundColor: Color(0xFFe77e4d),
        backgroundColor: Color(0xff011638),
      ),
      body: Container(
        height: double.infinity,
        // margin: EdgeInsets.fromLTRB(40, 175, 40, 175),
        color: Color(0xffFFEEE4),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              //width: double.infinity,


              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Title(
                            color: c,
                            child: Text(
                              'Patient',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: c,
                                  fontWeight: FontWeight.w500),
                            )),
                        //SizedBox(height: 5,
                        // ),


                        /* Container(
                      margin: EdgeInsets.all(50),
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: c),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          /* fillColor: d,
                          filled: true,*/
                          //labelText: 'Nom',
                          //labelStyle: TextStyle(fontSize: 20, color: c),
                          hintText: 'Tapez Votre Nom',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: c,
                          ),
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: c,
                          ),
                        ),
                      ),
                    ),*/
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 120,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? "Entrez  un email" : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: c),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              /* fillColor: d,
                          filled: true,*/
                              labelText: 'E-mail',
                              labelStyle: TextStyle(fontSize: 20, color: c),
                              hintText: "Tapez Votre E-mail ",
                              hintStyle: TextStyle(fontSize: 20, color: c),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 120,
                          //margin: EdgeInsets.all(50),
                          alignment: Alignment.center,
                          child: TextFormField(
                            validator: (value) => value!.length < 6
                                ? "entrez un mot de passe qui depasse 6 caractére"
                                : null,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: c),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              /* fillColor: d,
                          filled: true,*/
                              labelText: 'Mot de Passe',
                              labelStyle: TextStyle(fontSize: 20, color: c),
                              hintText: "Tapez Votre Mot de passe ",
                              hintStyle: TextStyle(fontSize: 20, color: c),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                color: c,
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: passwordVisible,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                  // ),
                  //),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: c, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mdpoublier');
                      // resetPass();
                    },
                    child: Text('mot de passe oublier'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: c, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/create_patient');
                      // resetPass();
                    },
                    child: const Text('créer un compte'),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),


                    width: 300,
                    // height: 35,
                    // padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFe77e4d),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            // loading = true;
                          });
                          var password = _passwordController.value.text;
                          var email = _emailController.value.text;


                          dynamic result =
                              _auth.signInWithEmailAndPassword(email, password);


                          if (result == null) {
                            setState(() {
                              error = "Please supply a valid email";
                            });
                          } else {
                            Navigator.pushReplacementNamed(context, '/acceuil');
                          }
                          /*else if (emailVerified == true) {
                            // Connexion réussie, naviguez vers l'écran suivant


                            Navigator.pushReplacementNamed(context, '/acceuil');
                          } else {
                            // Affichez un message d'erreur indiquant que l'e-mail n'est pas vérifié
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Erreur de connexion'),
                                  content: Text(
                                      'Veuillez vérifier votre e-mail pour continuer.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }*/
                        }
                        ;
                      },
                      //SignIn();
                      /*    dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print("erreur");
                            } else {
                              print(result);
                            }*/


                      //}


                      // },
                      child: const Text(
                        'Se connecter',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFF011638)),
                      ),
                    ),
                  ),


                  Container(
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter_application_7/create_patient.dart';
//import 'package:flutter_application_7/loading.dart';
//import 'package:flutter_application_7/auth.dart';
import 'package:flutter_application_7/authontification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; //
import 'firebase_options.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SeconnecterPatient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SeconnecterPatientState();
}

class _SeconnecterPatientState extends State<SeconnecterPatient> {
  final AuthontificationService _auth = AuthontificationService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool showSignIn = true;
  // bool loading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // pour bloqué les controllers si on les utilise pas
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void toggleView() {
    setState(() {
      _emailController.text = '';
      _passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

  /* Future SignIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      Navigator.of(context).pushNamed("/");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Opps',
          desc: "vous n'avez pas un compte",
          //btnCancelOnPress: () {},
          btnOkOnPress: () {
            /* Color:
          d;*/
            Title:
            " se conncter";
            Navigator.pushNamed(context, '/create_patient');
          },
        )..show();
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Opps',
          desc: 'le mot de passe est incorrect',
          //btnCancelOnPress: () {},
          btnOkOnPress: () {
            /* Color:
          d;*/
            Title:
            " j'ai l'oublier";
            Navigator.pushNamed(context, '/ss');
          },
        )..show();
        //print('Wrong password provided for that user.');
      }
    }
  }*/

  var c = Color(0xff011638);
  var d = Color(0xFFe77e4d);
  /* void openSignupScreen() {
    Navigator.pushNamed(context, '/create_patient');
    //Navigator.of(context).pushReplacement('create_patient');
  }*/

  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demande Connexion'),
        foregroundColor: Color(0xFFe77e4d),
        backgroundColor: Color(0xff011638),
      ),
      body: Container(
        height: double.infinity,
        // margin: EdgeInsets.fromLTRB(40, 175, 40, 175),
        color: Color(0xffFFEEE4),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              //width: double.infinity,

              child: Column(
                // key: _formKey,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    child: Column(
                      //r margin: EdgeInsets.only(bottom: 10.0),
                      //  padding: EdgeInsets.only(top: 110.0, bottom: 10.0),
                      //  alignment: Alignment.center,
                      // height: 50,
                      children: [
                        Title(
                            color: c,
                            child: Text(
                              'Patient',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: c,
                                  fontWeight: FontWeight.w500),
                            )),
                        //SizedBox(height: 5,
                        // ),

                        /* Container(
                      margin: EdgeInsets.all(50),
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: c),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          /* fillColor: d,
                          filled: true,*/
                          //labelText: 'Nom',
                          //labelStyle: TextStyle(fontSize: 20, color: c),
                          hintText: 'Tapez Votre Nom',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: c,
                          ),
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: c,
                          ),
                        ),
                      ),
                    ),*/
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 120,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? "Entrez  un email" : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: c),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              /* fillColor: d,
                          filled: true,*/
                              labelText: 'E-mail',
                              labelStyle: TextStyle(fontSize: 20, color: c),
                              hintText: "Tapez Votre E-mail ",
                              hintStyle: TextStyle(fontSize: 20, color: c),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 120,
                          //margin: EdgeInsets.all(50),
                          alignment: Alignment.center,
                          child: TextFormField(
                            validator: (value) => value!.length < 6
                                ? "entrez un mot de passe qui depasse 6 caractére"
                                : null,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: c),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              /* fillColor: d,
                          filled: true,*/
                              labelText: 'Mot de Passe',
                              labelStyle: TextStyle(fontSize: 20, color: c),
                              hintText: "Tapez Votre Mot de passe ",
                              hintStyle: TextStyle(fontSize: 20, color: c),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                color: c,
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: passwordVisible,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                  // ),
                  //),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: c, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mdpoublier');
                      // resetPass();
                    },
                    child: Text('mot de passe oublier'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: c, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/create_patient');
                      // resetPass();
                    },
                    child: const Text('créer un compte'),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),

                    width: 300,
                    // height: 35,
                    // padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFe77e4d),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            // loading = true;
                          });
                          var password = _passwordController.value.text;
                          var email = _emailController.value.text;

                          dynamic result =
                              _auth.signInWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              // loading = false;
                              error = "Please supply a valid email";
                            });
                          }
                        }
                        Navigator.pushNamed(context, '/accueil');
                      },
                      //SignIn();
                      /*    dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print("erreur");
                            } else {
                              print(result);
                            }*/

                      //}

                      // },
                      child: const Text(
                        'Se connecter',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFF011638)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  /*TextButton(
                          /* style: const TextButton.styleFrom(
                            primary: c, // foreground
                          ),*/
                          onPressed: () {
                            //Navigator.pushNamed(context, '/create_patient');
                            // resetPass();
                          },
                          child: const Text('créer un compte'),
                        ),*/

                  /*SizedBox(
                          height: 10,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),*/

                  //],
                  // ),
                  // ),
                  /*  TextButton(
                    style: TextButton.styleFrom(
                      primary: c, // foreground
                      //alignment: Alignment.bottomCenter
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/create_patient');
                    },
                    child: Text('créer un compte'),
                  ),*/

                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
