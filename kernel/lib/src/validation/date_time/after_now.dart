import 'package:kernel/src/validation/_validator_exporter.dart';

class AfterNow implements ValidatorBase<DateTime> {
  @override
  DateTime? value;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  AfterNow({
    this.value,
    this.message,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(DateTime value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultAfterNowErrorString;
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;

    return message ?? ValidationConstants.defaultAfterNowErrorString;
  }

  @override
  bool isValid(DateTime value) {
    return value.compareTo(DateTime.now()) > 0;
  }
}
