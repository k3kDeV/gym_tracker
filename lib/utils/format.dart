String formatTime(DateTime now) {
  String formated = '';
  if (now.hour <= 9) {
    formated += '0${now.hour}';
  } else {
    formated += '${now.hour}';
  }
  formated += ':';
  if (now.minute <= 9) {
    formated += '0${now.minute}';
  } else {
    formated += '${now.minute}';
  }

  return formated;
}

String formatWeekday(DateTime dt) {
  String wd = "";
  switch (dt.weekday) {
    case 1:
      wd = "Monday";
    case 2:
      wd = "Tuesday";
    case 3:
      wd = "Wednesday";
    case 4:
      wd = "Thursday";
    case 5:
      wd = "Friday";
    case 6:
      wd = "Saturday";
    case 7:
      wd = "Sunday";
    default:
      wd = "Erroro loool";
  }
  return wd;
}

String formatWeekdayShort(DateTime dt) {
  String wd = "";
  switch (dt.weekday) {
    case 1:
      wd = "Mon";
    case 2:
      wd = "Tues";
    case 3:
      wd = "Wed";
    case 4:
      wd = "Thu";
    case 5:
      wd = "Fri";
    case 6:
      wd = "Sat";
    case 7:
      wd = "Sun";
    default:
      wd = "Erroro loool";
  }
  return wd;
}
