import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_7/se_connecter_patient.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
//

/*class oublier extends StatefulWidget {
  @override
  State<StatefulWidget> State() {
    // TODO: implement createState
    //throw UnimplementedError();
  }
}*/

// ignore: must_be_immutable
class oublier extends StatelessWidget {
  final _emailController = TextEditingController();
  var c = Color(0xff011638);
  var d = Color(0xFFe77e4d);

  resetPass() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublier'),
        foregroundColor: Color(0xFFe77e4d),
        backgroundColor: Color(0xff011638),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 200.0),
              alignment: Alignment.center,
              width: 300,
              height: 300,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
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
            //    padding: const EdgeInsets.fromLTRB(10, 30, 10, 6),
          ),

          Center(
            child: Container(
              padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFe77e4d),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    resetPass();
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'mot de passe',
                      desc: "vous avez reçue un email ",
                      //btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        //* Color:d;
                        " se conncter";
                        Navigator.pushNamed(context, '/se_connecter_patient');
                      },
                    )..show();
                    // Navigator.pushNamed(context, '/se_connecter_medecin');
                  },
                  child: const Text(
                    'envoyer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF011638)),
                  )),
            ),
            //],
          ),
          // ),

          // ),
        ],
      ),
      // ),
    );
  }
}
