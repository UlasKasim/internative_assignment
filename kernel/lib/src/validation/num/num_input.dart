import 'package:kernel/src/constants/_constants_exporter.dart';
import 'package:kernel/src/validation/_validator_exporter.dart';

class NumInput implements ValidatorBase<String> {
  @override
  String? value;
  @override
  String? message;
  bool isPhone;
  @override
  ValidationLevel? validationLevel;

  NumInput(
    this.isPhone, {
    this.value,
    this.message,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultNumInputMessage;
  }

  @override
  bool isValid(String? value) {
    if (isPhone) value = value!.replaceAll('(', "").replaceAll(')', '').replaceAll(' ', '');
    num? parsed = num.tryParse(value!);
    if (parsed == null) {
      return false;
    } else {
      return RegExpConstants.numRegExp.hasMatch(value);
    }
  }

  @override
  String? getInnerMessage() {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultNumInputMessage;
  }
}
