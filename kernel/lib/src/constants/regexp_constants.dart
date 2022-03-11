class RegExpConstants {
  static var numRegExp = RegExp(r'^[+-]?(^\d*\.?\d*)');
  static var integerRegExp = RegExp(r'\d+');
  static var noSpecialCharacterRegExp = RegExp(r'^[a-zA-Z0-9ığüşöçİĞÜŞÖÇ]+$');
  static var onlyLetterRegExp = RegExp(
    r"^[a-zA-ZığüşöçİĞÜŞÖÇ_ ]+$",
    multiLine: true,
  );
  static var emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  static var usernameRegExp = RegExp(r"^(?=.{6,20}$)(?![_.])(?!.*[_.]{2})[a-z0-9._]+(?<![_.])$");
}
