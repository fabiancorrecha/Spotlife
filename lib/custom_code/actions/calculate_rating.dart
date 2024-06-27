// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!


Future<double> calculateRating(
  double userRating,
  int numberOfUserRatings,
  double ratingBarValue,
) async {
  // Add your function code here!

  double ratingCal = ((userRating * numberOfUserRatings) + ratingBarValue) /
      (numberOfUserRatings + 1);
  return ratingCal;
}
