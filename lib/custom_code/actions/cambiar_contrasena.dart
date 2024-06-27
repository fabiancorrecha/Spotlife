// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> cambiarContrasena(
  BuildContext context,
  String contrasenaActual,
  String nuevaContrasena,
) async {
  // Add your function code here!
  bool success = false;

  //Create an instance of the current user.
  var user = await FirebaseAuth.instance.currentUser!;
  //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.

  final cred = await EmailAuthProvider.credential(
      email: user.email!, password: contrasenaActual);
  await user.reauthenticateWithCredential(cred).then((value) async {
    await user.updatePassword(nuevaContrasena).then((_) {
      success = true;
      var uid;
      var usersRef;
      usersRef.doc(uid).update({"password": nuevaContrasena});
    }).catchError((error) {
      print(error);
    });
  }).catchError((err) {
    print(err);
  });

  return success;
}
