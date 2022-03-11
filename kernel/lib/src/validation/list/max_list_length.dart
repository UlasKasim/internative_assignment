import 'package:kernel/src/validation/_validator_exporter.dart';

class MaxListLength implements ValidatorBase<String> {
  @override
  String? value;
  int max;
  List list;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel;

  MaxListLength({
    this.value,
    this.max = ValidationConstants.defaultMaxListLength,
    required this.list,
    this.message,
    this.validationLevel = ValidationLevel.ERROR,
  });

  @override
  String? getMessage(String value) {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultMaxListLengthMessage(max);
  }

  @override
  bool isValid(String? value) {
    return list.length <= max;
  }

  @override
  String? getInnerMessage() {
    if (isValid(value)) return null;

    return message ?? ValidationConstants.defaultMaxListLengthMessage(max);
  }
}
