import '../_validator_exporter.dart';

class NotEmpty implements ValidatorBase<String> {
  @override
  String? value;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  NotEmpty({
    this.value,
    this.message = ValidationConstants.defaultNotEmptyMessage,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;
    return message;
  }

  @override
  bool isValid(String? value) {
    return value != "" && value!.trim() != "";
  }

  @override
  String? getInnerMessage() {
    if (isValid(value)) return null;
    return message;
  }
}
