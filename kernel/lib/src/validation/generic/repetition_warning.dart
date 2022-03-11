import 'package:kernel/src/validation/_validator_exporter.dart';

class RepetitionWarning<T> implements ValidatorBase<T> {
  @override
  T? value;
  List<T> valueList;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel = ValidationLevel.WARNING;

  RepetitionWarning({
    this.value,
    required this.valueList,
    this.message = ValidationConstants.defaultRepetitionWarningMessage,
  });

  @override
  String? getMessage(T value) {
    if (isValid(value)) return null;
    return message;
  }

  @override
  bool isValid(T? value) {
    return !valueList.contains(value);
  }

  @override
  String? getInnerMessage() {
    if (isValid(value)) return null;
    return message;
  }
}
