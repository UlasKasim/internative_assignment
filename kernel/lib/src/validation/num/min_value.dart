import 'package:kernel/src/validation/_validator_exporter.dart';

class MinValue implements ValidatorBase<String> {
  @override
  String? value;
  num min;
  @override
  String? message;
  bool compareEquals;
  @override
  ValidationLevel? validationLevel;

  MinValue({
    this.value,
    this.min = ValidationConstants.defaultMinValue,
    this.message,
    this.compareEquals = true,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultMinValueMessage(min);
  }

  @override
  bool isValid(String value) {
    num? parsed = num.tryParse(value);
    if (parsed == null) {
      return false;
    } else {
      if (compareEquals) {
        return parsed >= min;
      } else {
        return parsed > min;
      }
    }
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;

    return message ?? ValidationConstants.defaultMinValueMessage(min);
  }
}
