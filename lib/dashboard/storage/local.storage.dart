import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String todaySFirstOpenDate = "todaysFirstOpenDate";

  static storeTodaySFirstOpenDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    DateTime dateTime = DateTime.now();
    String dateToCheck = "${dateTime.day}${dateTime.month}${dateTime.year}";
    String dateStored = await getTodaySFirstOpenDate(prefs);
    if (dateStored == null || dateStored.compareTo(dateToCheck) != 0) {
      prefs.setString(todaySFirstOpenDate, dateToCheck);
    } else
      return false;
  }

  static getTodaySFirstOpenDate(prefs) async {
    return prefs.getString(todaySFirstOpenDate);
  }
}
