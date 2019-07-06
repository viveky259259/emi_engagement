class DateDelegate{
  static String getDateInString(DateTime dateTime){
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }
}