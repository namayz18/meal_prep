String getTotalDays(int totalDays) {
  if (totalDays % 7 == 0) {
    int week = totalDays ~/ 7;
    return '$week ${week == 1 ? 'Week' : 'Weeks'}';
  }
  return '$totalDays ${totalDays == 1 ? 'Day' : 'Days'}';
}

String capitalizeFirstLetter(String str) {
  return str[0].toUpperCase() + str.substring(1).toLowerCase();
}
