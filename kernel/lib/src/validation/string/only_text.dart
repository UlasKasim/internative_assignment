import 'package:kernel/src/constants/_constants_exporter.dart';
import '../_validator_exporter.dart';

class OnlyText implements ValidatorBase<String> {
  @override
  String? value;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  OnlyText({
    this.value,
    this.message = ValidationConstants.defaultOnlyTextString,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;
    return message;
  }

  @override
  bool isValid(String value) {
    return RegExpConstants.onlyLetterRegExp.hasMatch(value);
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;
    return message;
  }
}
