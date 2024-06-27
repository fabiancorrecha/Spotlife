import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAHskm2jbC5FxoT9DoOhIcq2xKwl2zEYNQ",
            authDomain: "spotlife-b4d08.firebaseapp.com",
            projectId: "spotlife-b4d08",
            storageBucket: "spotlife-b4d08.appspot.com",
            messagingSenderId: "788970699260",
            appId: "1:788970699260:web:efc7651987b559e85e9a79",
            measurementId: "G-FG20NFC5NF"));
  } else {
    await Firebase.initializeApp();
  }
}
