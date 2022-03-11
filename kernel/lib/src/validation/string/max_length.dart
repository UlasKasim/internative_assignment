import '../_validator_exporter.dart';

class MaxLength implements ValidatorBase<String> {
  @override
  String? value;
  int length;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  MaxLength({
    this.value,
    this.length = ValidationConstants.defaultMaxLength,
    this.message,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultMaxLengthMessage(length);
  }

  @override
  bool isValid(String value) {
    return value.length <= length;
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;

    return message ?? ValidationConstants.defaultMaxLengthMessage(length);
  }
}
