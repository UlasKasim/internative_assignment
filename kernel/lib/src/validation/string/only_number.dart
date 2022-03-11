import 'package:kernel/src/constants/_constants_exporter.dart';
import '../_validator_exporter.dart';

class OnlyNumber implements ValidatorBase<String> {
  @override
  String? value;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  OnlyNumber({
    this.value,
    this.message = ValidationConstants.defaultOnlyNumberString,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;
    return message;
  }

  @override
  bool isValid(String value) {
    return RegExpConstants.integerRegExp.hasMatch(value);
  }

  @override
  String? getInnerMessage() {
    if (isValid(value!)) return null;
    return message;
  }
}
