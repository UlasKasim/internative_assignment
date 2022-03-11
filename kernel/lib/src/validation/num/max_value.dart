import 'package:kernel/src/validation/_validator_exporter.dart';

class MaxValue implements ValidatorBase<String> {
  @override
  String? value;
  num max;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  MaxValue({
    this.value,
    this.max = ValidationConstants.defaultMaxValue,
    this.message,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultMaxValueMessage(max);
  }

  @override
  bool isValid(String value) {
    num? parsed = num.tryParse(value);
    if (parsed == null) {
      return false;
    } else {
      return parsed <= max;
    }
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;

    return message ?? ValidationConstants.defaultMaxValueMessage(max);
  }
}
