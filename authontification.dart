import 'package:flutter_application_7/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_7/create_patient.dart';

class AuthontificationService {
  var message = '';
  final CreatePat _pat = CreatePat();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Utilisateur? _userFormFirebaseUser(User? user) {
    return user != null ? Utilisateur(uid: user.uid, email: user.email) : null;
  }

  Stream<Utilisateur?> get user {
    return _auth.authStateChanges().map(_userFormFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFormFirebaseUser(user);
    } catch (exception) {
      message = 'vous avez déja un compte';
      print(exception.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (exception) {
      // message = 'vous avez déja un compte';
      print('erreur');
      print(exception.toString());
      return null;
    }
  }
  /*  verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null &&
        !user.emailVerified 
       ) {
      await user.sendEmailVerification();
    }
  }*/

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
