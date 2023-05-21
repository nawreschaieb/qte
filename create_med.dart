import 'package:flutter/material.dart';

void main() => runApp(const creationm());

class creationm extends StatelessWidget {
  const creationm({Key? key}) : super(key: key);

  static const String _title = 'Créer un compte ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Suivi de diabetique',
                  style: TextStyle(
                      color: Color.fromRGBO(228, 122, 36, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom et Prénom',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de Passe',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: confirmerController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmer le Mot de Passe',
                ),
              ),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: const Text(
                    'créer',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  onPressed: () {
                    // ignore: avoid_print
                    print(nameController.text);
                    // ignore: avoid_print
                    print(passwordController.text);
                  },
                )),
          ],
        ));
  }
}
