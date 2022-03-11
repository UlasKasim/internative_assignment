import 'package:kernel/src/validation/_validator_exporter.dart';

abstract class ValidatorBase<T> {
  T? value;
  ValidationLevel? validationLevel;
  String? message;

  String? getMessage(T value);

  String? getInnerMessage();

  bool isValid(T value);
}
