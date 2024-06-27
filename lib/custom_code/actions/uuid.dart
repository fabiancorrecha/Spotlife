// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:uuid/uuid.dart';

Future<String> uuid() async {
  var uuid = Uuid();
  var v1 = uuid.v1();

  return v1;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
