import 'dart:math';

class CommonMethods {
  static final Random _rnd = Random();
  static String numberToTurkishMoneyString(num number, {bool shouldAddZeros = false}) {
    var numberCeil = number.ceil().toDouble();

    if (numberCeil - number < 0.001) {
      number = numberCeil;
    }
    if (number.isNaN) number = 0;
    var intPart = number.truncate();
    double nonIntPart = number - (intPart.toDouble());

    var returnedString = '';
    var runeArray = intPart.abs().toString().runes;
    var pointCounter = 0;

    for (var i = runeArray.length - 1; i >= 0; i--) {
      if (pointCounter == 3) {
        returnedString = "." + returnedString;
        pointCounter = 0;
      }
      returnedString = String.fromCharCode(runeArray.elementAt(i)) + returnedString;
      pointCounter++;
    }

    if (shouldAddZeros) {
      returnedString += "," + nonIntPart.abs().toStringAsFixed(2).split(".")[1].substring(0, 2);
    }
    if (number < 0) returnedString = "-" + returnedString;

    return returnedString;
  }

  static String getRandomString(
    num length, {
    bool containsNumber = true,
    bool containsChar = true,
    String prefix = "",
  }) {
    if (!containsNumber && !containsChar) return "";
    String _chars = "";
    if (containsNumber) _chars += "1234567890";
    if (containsChar) _chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return prefix +
        String.fromCharCodes(Iterable.generate(
            length as int, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  static int maxInt() => (double.infinity is int) ? double.infinity as int : ~minInt();
  static int minInt() => (double.infinity is int) ? -double.infinity as int : (-1 << 63);
}
