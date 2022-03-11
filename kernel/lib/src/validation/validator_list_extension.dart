import '_validator_exporter.dart';

extension ValidatorListExtension<T> on List<ValidatorBase<T?>> {
  String? getErrorMessage(T value) {
    for (var validator in this) {
      if (!validator.isValid(value) && validator.validationLevel == ValidationLevel.ERROR) {
        return validator.getMessage(value);
      }
    }
    return null;
  }

  String? getInnerErrorMessage() {
    for (var validator in this) {
      if (!validator.isValid(validator.value) &&
          validator.validationLevel == ValidationLevel.ERROR) {
        return validator.getMessage(validator.value);
      }
    }
    return null;
  }

  String getInnerErrorListMessage() {
    String errorString = "";
    for (var validator in this) {
      if (!validator.isValid(validator.value) &&
          validator.validationLevel == ValidationLevel.ERROR) {
        errorString += "- " + validator.getMessage(validator.value)! + "\n";
      }
    }
    return errorString;
  }

  String? getWarningMessage(T value) {
    for (var validator in this) {
      if (!validator.isValid(value) && validator.validationLevel == ValidationLevel.WARNING) {
        return validator.getMessage(value);
      }
    }
    return null;
  }
}
