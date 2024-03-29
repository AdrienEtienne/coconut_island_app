class DateTimeProvider {
  static int getMonth() {
    return DateTime.now().month;
  }

  static String getMonthName([int month]) {
    month = month ?? DateTime.now().month;

    switch (month) {
      case 1:
        return "Janvier";
      case 2:
        return "Février";
      case 3:
        return "Mars";
      case 4:
        return "Avril";
      case 5:
        return "Mai";
      case 6:
        return "Juin";
      case 7:
        return "Juillet";
      case 8:
        return "Août";
      case 9:
        return "Sptembre";
      case 10:
        return "Octobre";
      case 11:
        return "Novembre";
      case 12:
        return "Décembre";
      default:
        throw new RangeError("Month out of range");
    }
  }
}
