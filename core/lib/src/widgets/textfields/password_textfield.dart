import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kernel/kernel.dart';

import '_textfields_exporter.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool enabled;
  final Function? onFirstSuffixPressed;
  final Function(String) onChanged;
  final Color? fillColor;
  final bool disableHeight;
  final List<ValidatorBase<dynamic>> validatorList;
  final AutovalidateMode autoValidateMode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final VoidCallback? onEnterPressed;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.labelText = "Label Text",
    this.fillColor,
    this.enabled = true,
    required this.onChanged,
    this.onFirstSuffixPressed,
    this.disableHeight = true,
    this.validatorList = const [],
    this.autoValidateMode = AutovalidateMode.always,
    this.floatingLabelBehavior,
    this.onEnterPressed,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  IconData icon = Icons.remove_red_eye_outlined;
  bool obsecuring = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RegularTextFormField(
            onEnterPressed: widget.onEnterPressed,
            controller: widget.controller,
            onChanged: widget.onChanged,
            labelText: widget.labelText,
            fillColor: widget.fillColor,
            enabled: widget.enabled,
            obsecuring: obsecuring,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            prefixIconData: Icons.lock,
            suffixIconData: icon,
            onSuffixPressed: () {
              obsecuring = !obsecuring;
              icon =
                  obsecuring ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash;
            },
            validatorList: widget.validatorList,
            autoValidateMode: widget.autoValidateMode,
          ),
        ),
      ],
    );
  }
}
