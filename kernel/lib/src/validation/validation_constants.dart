class ValidationConstants {
  static const int defaultMinLength = 6;
  static const int defaultMaxLength = 255;
  static const int defaultMaxListLength = 20;
  static const num defaultMaxValue = 999999;
  static const num defaultMinValue = 1;

  static String defaultMinLengthMessage(int length) {
    return "Bu alan $length karakterden uzun olmalıdır.";
  }

  static String defaultMaxLengthMessage(int length) {
    return "Bu alan $length karakterden kısa olmalıdır.";
  }

  static String defaultMaxListLengthMessage(int length) {
    return "Bu alan en çok $length elemandan oluşmalıdır.";
  }

  static String defaultMaxValueMessage(num value) {
    return "Bu alan ${(value)} veya küçük olmalıdır.";
  }

  static String defaultMinValueMessage(num value) {
    if (value == 1) {
      return "0'dan büyük bir miktar giriniz.";
    } else {
      return "Bu alan ${(value)} veya büyük olmalıdır.";
    }
  }

  static String defaultNotEmptyString(String model) {
    return "${model.firstLetterToUpperCase} boş bırakılamaz.";
  }

  static String defaulNoWhiteSpaceString(String model) {
    return "${model.firstLetterToUpperCase} boşlukla başlayamaz ve bitemez.";
  }

  static String defaultRepetitionErrorString(String model, String subModel) {
    return "Bu $model ile başka bir $subModel daha kayıtlı.";
  }

  static String defaultMinLengthErrorString(String model, int length) {
    return "${model.firstLetterToUpperCase} en az $length  karakter olmalıdır.";
  }

  static String defaultMaxLengthErrorString(String model, int length) {
    return "${model.firstLetterToUpperCase} ${length - 1} karakterden kısa olmalıdır.";
  }

  static String defaultNotEmptyListMessage() {
    return 'Bu liste boş olamaz';
  }

  static const String defaultNoWhitespaceMessage =
      "Bu alan boşluk karakteriyle başlayamaz ve bitemez.";
  static const String defaultNotEmptyMessage = "Bu alan boş bırakılamaz.";
  static const String defaultRepetitionErrorMessage = "Bu değer daha önce kullanılmış.";
  static const String defaultRepetitionWarningMessage = "Sistemde uyarılar bulunmaktadır.";
  static const String defaultNumInputMessage = "Bu alan sayı olmalıdır.";
  static const String defaultIsEmailMessage = "Geçerli bir mail adresi giriniz.";
  static const String defaultPermissionErrorString =
      "Bu işlemi sadece yöneticiler gerçekleştirebilmektedir.";
  static const String defaultAfterNowErrorString = "Geçmiş bir tarih seçilemez.";
  static const String defaultOnlyTextString = "Bu alan yazı olmalıdır.";
  static const String defaultOnlyNumberString = "Bu alan sayı olmalıdır.";
}

extension StringExtension on String {
  String get firstLetterToUpperCase {
    if (this != "") {
      return this[0].toUpperCase() + substring(1);
    } else {
      return "";
    }
  }
}
