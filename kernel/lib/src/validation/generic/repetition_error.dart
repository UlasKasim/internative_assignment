import 'package:kernel/src/validation/_validator_exporter.dart';

class RepetitionError<T> implements ValidatorBase<T> {
  @override
  T? value;
  List<T> valueList;
  @override
  String? message;
  @override
  ValidationLevel? validationLevel = ValidationLevel.ERROR;

  RepetitionError({
    this.value,
    required this.valueList,
    this.message = ValidationConstants.defaultRepetitionErrorMessage,
  });

  @override
  String? getMessage(T value) {
    if (isValid(value)) return null;
    return message;
  }

  @override
  bool isValid(T? value) {
    if (value == "") return true;
    return !valueList.contains(value);
  }

  @override
  String? getInnerMessage() {
    if (isValid(value)) return null;
    return message;
  }
}
