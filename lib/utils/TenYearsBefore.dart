class TenYearsBefore {
  List<String> generateYears(int startYear) {
    int currentYear = DateTime.now().year;
    List<String> years = [];
    for (int year = currentYear; year >= startYear; year--) {
      years.add(year.toString());
    }
    return years;
  }
}